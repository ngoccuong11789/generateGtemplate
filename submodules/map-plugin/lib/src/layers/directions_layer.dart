import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:map/src/models/models.dart';

class RouteMap {
  late List<RouteGeometry> routes;

  RouteMap(this.routes);

  RouteMap.fromJson(Map<String, dynamic> data) {
    
    routes = List.of(data['routes'])
    .map((e) => RouteGeometry.fromJson(e)).toList();
  }
}

class RouteGeometry {
  late List<LatLng> geometry;

  RouteGeometry(this.geometry);

  List<LatLng> decode(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;
    BigInt big0 = BigInt.from(0);
    BigInt big0x1f = BigInt.from(0x1f);
    BigInt big0x20 = BigInt.from(0x20);

    while (index < len) {
      int shift = 0;
      BigInt b, result;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      BigInt rShifted = result >> 1;
      int dLat;
      if (result.isOdd)
        dLat = (~rShifted).toInt();
      else
        dLat = rShifted.toInt();
      lat += dLat;

      shift = 0;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      rShifted = result >> 1;
      int dLng;
      if (result.isOdd)
        dLng = (~rShifted).toInt();
      else
        dLng = rShifted.toInt();
      lng += dLng;

      points.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }

    return points;
  }

  RouteGeometry.fromJson(Map<String, dynamic> data) {
    geometry = decode(data['geometry']);
  }
}


class DirectionsRoutes extends StatefulWidget {
  final MapController mapController;
  final DirectionsRoutesController? controller;
  final List<LatLng> coordinates;
  final List<Color> colorRoutes;
  final Color? color;
  final double? strokeWidth;
  final Function(bool isRouteAvailable)? onCompleted;
  final Function(List<Polyline> directions)? onInit;
  final Function()? onPreloadGetRouting;
  final Function(List<Polyline> directions)? onDoneGetRouting;
  final String urlGetDirection;
  final List<LocationModal> locations;
  final bool hasRounting;
  const DirectionsRoutes({
    super.key,
    required this.coordinates,
    required this.colorRoutes,
    required this.locations,
    this.color,
    this.strokeWidth,
    this.onCompleted,
    this.urlGetDirection = 'https://soctrip-map-dev.tma-swerp.com/ors/v2/directions/driving-car',
    required this.mapController,
    this.controller,
    this.onInit,
    this.onPreloadGetRouting,
    this.onDoneGetRouting,
    this.hasRounting = true,
  });

  @override
  State<StatefulWidget> createState() => _DirectionsRoutesState();
}

class _DirectionsRoutesState extends State<DirectionsRoutes> {
  final Color _defaultColor = Colors.blue;
  final double _defaultStrokeWidth = 3.0;

  List<Polyline> _directions = [];
  final List<Polyline> _tourDirections = [];
  // late final List<Marker> _markers;
  // late final List<LatLng> _latLog = widget.coordinates;
  
  // late final LatLngBounds _bounds = LatLngBounds(const LatLng(0,0), const LatLng(0,0));
  @override
  void initState() {
    widget.controller?._addState(this);
    _getDirections(widget.coordinates, widget.color, callback: (listPolYline) {
      _directions = listPolYline;
      if (widget.onInit != null) {
        widget.onInit!(_directions);
      }
    });
    super.initState();
  }

  void drawLineWithoutPoint(){
    var n = widget.locations.map((e) => e).toList();
    n.sort((a, b) {
      int cmp = (a.dayNo ?? 0).compareTo( b.dayNo ?? 0);
      if(cmp == 0){
        return (a.order ?? 0).toInt().compareTo((b.order ?? 0).toInt());
      }
      return cmp;
    });
    _directions.add(
      Polyline(
        points: n.map((e) => LatLng(e.latitude ?? 0, e.longitude ?? 0)).toList(),
        strokeJoin: StrokeJoin.round,
        borderStrokeWidth: widget.strokeWidth ?? _defaultStrokeWidth,
        color: _defaultColor,
        borderColor: _defaultColor
      )
    );
    setState(() {

    });
  }

  void _getDirections(List<LatLng> coordinates, Color? color, {
    Function(List<Polyline> listPolYline)? callback
  }) async {
    // final destinations = widget.coordinates.map((location) => '${location.longitude},${location.latitude}').join(';');
    final destinations = coordinates.map((location) => [location.longitude,location.latitude]).toList();
    final http.Response response;
    if(widget.onPreloadGetRouting != null){
      widget.onPreloadGetRouting!();
    }
    final _body = jsonEncode({
      'coordinates': destinations
    });
    try {
      final Map<String, String> _header = {
        'Content-Type': 'application/json'
      };
      // response = await http.get(Uri.parse('https://router.project-osrm.org/route/v1/driving/$destinations?overview=full&geometries=geojson'),
      // body: {}
      // );
      debugPrint('destinations $_body');
      response = await http.post(Uri.parse(widget.urlGetDirection),
      body: _body,
      headers: _header
      );
      if (response.statusCode != 200) {
        _onCompleted(false);
      } else {
        if(callback != null){
          callback(_onRetrieveRouteSuccess(response, coordinates, color));
        }
        _directions = _onRetrieveRouteSuccess(response, coordinates, color);
        if (widget.onInit != null) {
          widget.onInit!(_directions);
        }
        setState(() {
        });
      }
    } catch (_) {
      debugPrint('catch $_');
      drawLineWithoutPoint();
      _onCompleted(false);
    }
  }

  void _onCompleted(bool isRouteAvailable) {
    if (widget.onCompleted != null) {
      widget.onCompleted!(isRouteAvailable);
    }
  }

  List<Polyline> _onRetrieveRouteSuccess(http.Response response, List<LatLng> coordinates, Color? color) {
    final routes = RouteMap.fromJson(jsonDecode(response.body));
    final List<Polyline> _directionsLine = [];
    _tourDirections.clear();
    
    for (var route in routes.routes) {
      _directionsLine.add(
        Polyline(
          points: route.geometry,
          strokeJoin: StrokeJoin.round,
          borderStrokeWidth: widget.strokeWidth ?? _defaultStrokeWidth,
          color: color ?? _defaultColor,
          borderColor: color ?? _defaultColor,
        )
      );
      // _tourDirections.add(
      //   Polyline(
      //     points: route.geometry,
      //     strokeJoin: StrokeJoin.round,
      //     borderStrokeWidth: widget.strokeWidth ?? _defaultStrokeWidth,
      //     color: widget.tourColor ?? _defaultColor,
      //     borderColor: widget.tourColor ?? _defaultColor,
      //   )
      // );
    }
    if(_directions.isEmpty){
      drawLineWithoutPoint();
    }
    _onCompleted(_directions.isNotEmpty);
    // List<LatLng> _latLog = coordinates;
    // final LatLngBounds _bounds = LatLngBounds(_latLog[0], _latLog[1]);
    // _latLog
    //     .map(
    //       (markerPosition) => _bounds.extend(markerPosition),
    //     )
    //     .toList();
    // widget.mapController.fitBounds(
    //  _bounds,
    //  options: const FitBoundsOptions(forceIntegerZoomLevel: true)
    //   // LatLngBounds(
    //   //     _directions[0].boundingBox.center,
    //   //     _directions[_directions.length - 1].boundingBox.center
    //   //   )
    // );
    if (widget.onDoneGetRouting != null) {
      widget.onDoneGetRouting!(_directionsLine);
    }
    return _directionsLine;
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasRounting ? PolylineLayer(
      polylines: _directions,
    ) : const SizedBox.shrink();
  }
}

class DirectionsRoutesController{
  _DirectionsRoutesState? _state;

  void _addState(_DirectionsRoutesState state) {
    _state = state;
  }

  void getDirections(List<LatLng> coordinates, Color? color, {
    Function(List<Polyline> listPolYline)? callback
  }) async {
    _state?._getDirections(coordinates, color, callback: callback);
  }
}