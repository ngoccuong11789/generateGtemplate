import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map/src/layers/directions_layer.dart';
import 'package:map/src/models/models.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MobileMap extends StatefulWidget {
  final MobileMapController? controller;
  final Widget Function(ScrollController sc)? builderPanelChild;
  final bool hidePanel;
  final List<LocationModal> locations;
  final List<LocationModal> locationsRouting;
  final List<IconMarker> iconMarkers;
  final Widget Function(LocationModal, int)? builderIconMarker;
  final Widget? builderDirectMarker;
  final Function(dynamic, LatLng)? onTap;
  final Function(dynamic, LatLng)? onLongPress;
  final Function(LatLngBounds)? onMapReady;
  final Function(List<Polyline>)? onDoneGetRouting;
  final LocationModal? focusMarker;
  final List<LocationModal>? multipleHighlightMarker;
  final bool isFocus;
  final bool isMultipleHighlight;
  final double highLightScale;
  final double routingScaleMarker;
  final Function(LocationModal, int)? onClickMarker;
  final Function()? onClickPickingMarker;
  final Function(LatLng?, double)? onPositionChanged;
  final double maxRatioHeightOpen;
  final double minRatioHeightOpen;
  final double initFabHeight;
  final bool isDisplayCloseIcon;
  final Widget sourceCloseIcon;
  final bool isDirection;
  final String urlGetDirection;
  final String urlTemplate;
  final double zoom;
  final double maxZoom;
  final double initZoom;
  final double focusZoom;
  final double getLatlogZoom;
  final List<Color> colorRoutes;
  final Color tourColor;
  final bool isGetLatLog;
  final void Function(double position)? onPanelSlide;
  final VoidCallback? onPanelOpened;
  final VoidCallback? onPanelClosed;
  final bool isTourguide;
  final int guideDuration;
  final void Function(int position, Timer t, int pos)? onPlaying;
  final void Function(Timer t, LatLngBounds?)? onStartPlay;
  final bool autoPlay;
  final double speed;
  
  // unit is milisecond
  final int guideStepDuration;
  final int guidePoints;

  const MobileMap({super.key,
    this.controller,
    required this.locations,
    this.locationsRouting = const [],
    this.multipleHighlightMarker,
    this.focusMarker,
    this.isFocus = false,
    this.autoPlay = false,
    this.isMultipleHighlight = false,
    this.isDirection = false,
    this.isDisplayCloseIcon = false,
    this.hidePanel = false,
    this.isGetLatLog = false,
    this.zoom = 13,
    this.speed = 1,
    this.initFabHeight = 120.0,
    this.maxZoom = 18,
    this.initZoom = 7,
    this.focusZoom = 13,
    this.getLatlogZoom = 7,
    this.maxRatioHeightOpen = 0.80,
    this.minRatioHeightOpen = 0.20,
    this.builderPanelChild,
    this.builderIconMarker,
    this.onClickMarker,
    this.onClickPickingMarker,
    this.onPositionChanged,
    this.onTap,
    this.onLongPress,
    this.onMapReady,
    this.onPanelSlide,
    this.onPanelOpened,
    this.onPanelClosed,
    this.iconMarkers = const [
      IconMarker(source: FlutterLogo(), type: IconType.social),
      IconMarker(source: FlutterLogo(), ratio: 1.5, type: IconType.travelAssistant),
      IconMarker(source: FlutterLogo(), type: IconType.booking),
      IconMarker(source: FlutterLogo(), type: IconType.ecommerce),
    ],
    this.colorRoutes = const [
      Colors.blue,
      Colors.blue,
      Colors.blue,
      Colors.blue
    ],
    this.sourceCloseIcon = const Icon(
      Icons.audiotrack,
      color: Colors.green,
      size: 30.0,
    ),
    this.urlTemplate = 'https://tmtrav-map-resource-dev.tma-swerp.com/tile/{z}/{x}/{y}.png',
    this.urlGetDirection = 'https://tmtrav-map-dev.tma-swerp.com/ors/v2/directions/driving-car',
    this.isTourguide = false, 
    this.builderDirectMarker,
    this.guideDuration = 25,
    this.guideStepDuration = 300,
    this.guidePoints = 8,
    this.onPlaying, 
    this.onStartPlay, 
    this.highLightScale = 2,
    this.routingScaleMarker = 0.5,
    this.tourColor = Colors.redAccent,
    this.onDoneGetRouting
  });

  @override
  State<MobileMap> createState() => _MobileMapState();
}

class _MobileMapState extends State<MobileMap> {
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  final MapController _mapController = MapController();
  late final List<Marker> _markers;
  LatLng _hardMarker = LatLng(51.51868093513547, -0.12835376940892318);
  late final customMarkers = <Marker>[
    buildPin(_hardMarker),
  ];
  List<LatLng> _latLog = [];
  List<LatLng> _latLogRouting = [];
  final PanelController pn = PanelController();
  List<Polyline> _directions = [];
  List<Polyline> _tourDirections = [];
  late Timer timer;
  int currentIndexPos = 0;
  LatLng directLatlog = LatLng(51.51868093513547, -0.12835376940892318);
  late final directMarker = <Marker>[
    buildDirectionPin(directLatlog, widget.builderDirectMarker, 0.0),
  ];
  LatLngBounds? _bounds;
  late int stepCount;
  DirectionsRoutesController routingGuideController = DirectionsRoutesController();
  double _speed = 1;

  @override
  void initState() {
    _speed = widget.speed;
    super.initState();
    widget.controller?._addState(this);
    _fabHeight = widget.initFabHeight;
    _latLog = widget.locations.length == 0 ? [_hardMarker] : widget.locations
        .map(
          (location) => LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
        )
        .toList();
    _latLogRouting = widget.locationsRouting.isEmpty ? [_hardMarker] : widget.locationsRouting
        .map(
          (location) => LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
        )
        .toList();
    if( widget.isGetLatLog){
      _markers = [];
    }
    else {
      _markers = 
        List.generate(widget.locations.length
      , (index) => _buildMarker(widget.locations[index],  index)) .toList();
    }
    if(widget.isTourguide){
        _bounds = _latLogRouting.length > 1 ? LatLngBounds(_latLogRouting[0], _latLogRouting[1]) :
      LatLngBounds(_latLogRouting[0], _latLogRouting[0]);

      _latLogRouting
          .map(
            (markerPosition) => _bounds?.extend(markerPosition),
          )
          .toList();
    }
    else {
      _bounds = _latLog.length > 1 ? LatLngBounds(_latLog[0], _latLog[1]) :
      LatLngBounds(_latLog[0], _latLog[0]);

      _latLog
          .map(
            (markerPosition) => _bounds?.extend(markerPosition),
          )
          .toList();
    }
    if(widget.isTourguide){
      stepCount = ((widget.guideDuration*1000)/widget.guideStepDuration).round();
      // play(currentIndexPos);
    }
  }

  @override
  void dispose() {
    stop(timer);
    super.dispose();
  }

  void getDirections(List<LocationModal> locationsRouting, Color? color, {
    Function(List<Polyline> listPolYline)? callback
  }) async {
    _latLogRouting = locationsRouting.isEmpty ? [_hardMarker] : locationsRouting
        .map(
          (location) => LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
        )
        .toList();
    LatLngBounds nbounds = _latLog.length > 1 ? LatLngBounds(_latLog[0], _latLog[1]) :
      LatLngBounds(_latLog[0], _latLog[0]);

      _latLog
          .map(
            (markerPosition) => nbounds.extend(markerPosition),
          )
          .toList();
    _mapController.centerZoomFitBounds(nbounds);
    routingGuideController.getDirections(_latLogRouting, color, callback: callback);
  }

  double getAngle(LatLng a, LatLng b){
    double angle = 0;
    var latA = a.latitude;
    var lonA = a.longitude;
    var latB = b.latitude;
    var lonB = b.longitude;

    if(lonA == lonB && latA>latB ){
        angle = pi;
    }
    else if(lonA == lonB && latA < latB ){
        angle = 0	;
    }
    else if(lonA > lonB && latA == latB ){
        angle = -(pi/2);
    }
    else if(lonA < lonB && latA == latB ){
        angle = pi/2	;
    }
    else{
        var x1 = latA*pow(10,12);
        var x2 = latB*pow(10,12);
        var y1 = lonA*pow(10,12);
        var y2 = lonB*pow(10,12);
        angle = atan2(y2-y1,x2-x1);
    }
    return angle; 
  }

  Marker buildPin(LatLng point) => Marker(
    point: point,
    builder: (_) =>  GestureDetector(
      onTap: widget.onClickPickingMarker,
      child: Icon(Icons.location_pin, size: 60, color: Colors.redAccent)),
    width: 60,
    height: 60,
  );

  Marker buildDirectionPin(LatLng point, Widget? w, double angle) {
    return Marker(
      rotate: true,
      point: point,
      builder: (_) =>  Transform.rotate(
        angle: angle,
        child: Transform.scale(
          scale: widget.routingScaleMarker,
          child: GestureDetector(
            onTap: widget.onClickPickingMarker,
            child: w != null ? w : Icon(Icons.directions_bus, size: 60, color: Colors.yellow.shade500)),
        ),
      ),
      width: 60,
      height: 60,
    );
  }

  double get _zoom => _mapController.zoom;
  MapController get __mapController => _mapController;
  int get _stepCount => ((_directions[0].points.length/stepCount)*widget.guidePoints).round();

  void closePanel(){
    pn.close();
  }

  void setSpeed(double s){
    setState(() {
      _speed = s;
    });
  }

  void openPanel(){
    pn.open();
  }

  void mapMove(LatLng center, {
    double zoom = 7
  }){
    _mapController.move(center, zoom);
  }

  void  showTopSheet(bool show, Widget child) async {
    if(show){
      await showTopModalSheet<String?>(context, child );
    }
    else {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }

  void play(int start) async {
    if(widget.isTourguide){
        _bounds = _latLogRouting.length > 1 ? LatLngBounds(_latLogRouting[0], _latLogRouting[1]) :
      LatLngBounds(_latLogRouting[0], _latLogRouting[0]);

      _latLogRouting
          .map(
            (markerPosition) => _bounds?.extend(markerPosition),
          )
          .toList();
    }
    currentIndexPos = 0;
    currentIndexPos = start + 1;
    timer = Timer.periodic(Duration(milliseconds: widget.guideStepDuration), (t) {
      debugPrint('start ${start}');
      debugPrint('stepCount ${stepCount}');
      if(_directions.isNotEmpty){
        int increase = (((_directions[0].points.length/stepCount)/widget.guidePoints)*_speed).round();
        debugPrint('setState ${currentIndexPos}, ${increase}');
        step(currentIndexPos + increase, t);
        if(currentIndexPos == 0){
          stop(t);
        }
      }
      else {
        stop(t);
      }
    });
    debugPrint('widget.onStartPlay ${widget.onStartPlay}');
    if(widget.onStartPlay !=null){
      widget.onStartPlay!(timer, _bounds);
    }
  }

  void step(int step, Timer t) async {
    setState(() {
      int l = _directions[0].points.length;
      currentIndexPos = min(step, l - 1);
      debugPrint('_directions[0].points.length ${l}');
      directLatlog = _directions[0].points[currentIndexPos];
      double angle = getAngle(directLatlog, _directions[0].points[max(0, currentIndexPos-1)]);
      directMarker[0] = buildDirectionPin(directLatlog, widget.builderDirectMarker, angle);
      if(widget.onPlaying !=null){
        widget.onPlaying!(((currentIndexPos*widget.guidePoints)/l).round(), t, currentIndexPos);
      }
      debugPrint('done $currentIndexPos, ${ l - 1}');    
      if(currentIndexPos >= l - 1){
        debugPrint('done stop ${l}');    
        stop(t);
      }
    });
  }

   void stop(Timer t) {
     debugPrint('Timer stop');
     debugPrint('Timer ${t.tick}');
    if(t.isActive){
      debugPrint('Timer cancel');
      t.cancel();
    }
  }


  Future<T?> showTopModalSheet<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
    BorderRadiusGeometry? borderRadius,
  }) {
    return showGeneralDialog<T?>(
      context: context,
      barrierDismissible: barrierDismissible,
      transitionDuration: const Duration(milliseconds: 250),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) => child,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          child: Column(
            children: [
              Material(
                borderRadius: borderRadius,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [child],
                ),
              )
            ],
          ),
          position: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)
              .drive(
                  Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero)),
        );
      },
    );
  }


  Marker _buildMarker(LocationModal data, int index) {
    return Marker(
      point: LatLng(data.latitude ?? 0.0, data.longitude ?? 0.0),
      width: 40,
      height: 40,
      builder: (_) => SizedBox(
        child: widget.builderIconMarker !=null 
        ? widget.builderIconMarker!(data,index)
        : GestureDetector(
          onTap: (){
            if(widget.onClickMarker !=null){
              widget.onClickMarker!(data, index);
            }
          },
          child: _buildIcon(data, data.type)
        ),
      ),
      anchorPos: AnchorPos.align(AnchorAlign.top),
    );
  }

  Widget _buildIcon(LocationModal data, IconType icon) {
    IconMarker i = widget.iconMarkers.firstWhere((element) => element.type == icon);
    if(widget.isMultipleHighlight){
      if(widget.multipleHighlightMarker?.where((element) => data.id == element.id) != null){
      return Transform.scale(
          scale: widget.highLightScale,
          child: i.source
        );
      }
    }
    if(widget.focusMarker?.id == data.id){
      return Transform.scale(
        scale: widget.highLightScale,
        child: i.source
      );
    }
    return Transform.scale(
      scale: i.ratio,
      child: i.source
    );
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * (widget.maxRatioHeightOpen);
    _panelHeightClosed = MediaQuery.of(context).size.height * (widget.minRatioHeightOpen);
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SlidingUpPanel(
          controller: pn,
          maxHeight: _panelHeightOpen,
          minHeight: widget.hidePanel ? 0.0 : _panelHeightClosed,
          parallaxEnabled: true,
          parallaxOffset: .5,
          body:   _buildMap(context),
          panelBuilder: (sc) => _buildPanel(sc),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0)),
          onPanelSlide: widget.onPanelSlide,
          onPanelClosed: widget.onPanelClosed,
          onPanelOpened: widget.onPanelOpened,
        )
      ]
    );
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    assert(list.isNotEmpty);
    double x0 = 0, x1 = 0, y0 = 0, y1 = 0;
    for (LatLng latLng in list) {
      if (x0 == 0) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(LatLng(x1, y1), LatLng(x0, y0));
  }

  Widget _buildPanel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(children: [
          widget.builderPanelChild !=null ? widget.builderPanelChild!(sc): const SizedBox.shrink(),
          widget.isDisplayCloseIcon ? Positioned(
            right: 16,
            top: 12,
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: widget.sourceCloseIcon,
            )
          ) : const SizedBox.shrink()
        ],)
        );
  }
  Widget _buildMap(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        keepAlive: true,
        bounds:_bounds,
        onMapReady: () {
          // _mapController.mapEventStream.listen((evt) {
          //   debugPrint('evt ${evt}');
          // });
          
          if(widget.isFocus && widget.builderIconMarker !=null){
            _mapController.move(LatLng(((widget.focusMarker!.latitude! - 0.02)), widget.focusMarker?.longitude ?? 0.0), widget.focusZoom);
          }
          else {
            if(widget.isGetLatLog){
              _mapController.move(_hardMarker, widget.getLatlogZoom);
              return;
            }
            //  _mapController.move(LatLng(((_bounds.center.latitude - 0.7)), _bounds.center.longitude ?? 0.0), widget.initZoom);
            //  _mapController.centerZoomFitBounds(_bounds, options: const FitBoundsOptions(inside: true, forceIntegerZoomLevel: true));
          }
          if(widget.onMapReady != null){
            widget.onMapReady!(_bounds ?? LatLngBounds(LatLng(0, 0), LatLng(0, 0)));
          }
        },
        onTap:(tapPosition, point) {
          if(widget.isGetLatLog){
            customMarkers[0] = buildPin(point);
            setState(() {});
          }
          if(widget.onTap != null){
            widget.onTap!(tapPosition, point);
          }
        },
        onLongPress: widget.onLongPress,
        onPositionChanged: (position, hasGesture) {
          var R = 3958.8; 
          var mapBoundNorthEast = _mapController.bounds?.northEast;
          var mapBoundSouthWest = _mapController.bounds?.southWest;
          var rlat1 =( mapBoundNorthEast?.latitude ?? 0)* (pi/180); 
          var rlat2 = ( mapBoundSouthWest?.latitude ?? 0) * (pi/180); 
          var difflat = rlat2-rlat1; 
          var difflon = ((mapBoundSouthWest?.longitude ?? 0) - (mapBoundNorthEast?.longitude ?? 0)) * (pi/180);

          var d = 2*R*asin(sqrt(sin(difflat/2)*sin(difflat/2)+cos(rlat1)*cos(rlat2)*sin(difflon/2)*sin(difflon/2)));
          if(widget.onPositionChanged !=null){
            widget.onPositionChanged!(position.center , d);
          }
        },
        rotationWinGestures: MultiFingerGesture.none,
        boundsOptions: const FitBoundsOptions(forceIntegerZoomLevel: true),
        zoom: widget.zoom,
        maxZoom: widget.maxZoom,
      ),
      children: [
        TileLayer(
          urlTemplate: widget.urlTemplate,
          userAgentPackageName: 'com.example.app',
        ),
        widget.isDirection ? DirectionsRoutes(
          locations: widget.locations,
          colorRoutes: widget.colorRoutes,
          urlGetDirection: widget.urlGetDirection,
          mapController: _mapController,
          coordinates: _latLog,
          color: Colors.blue,
        ) : const SizedBox.shrink(),
        widget.isTourguide ? DirectionsRoutes(
          hasRounting: false,
          controller: routingGuideController,
          locations: widget.locations,
          colorRoutes: widget.colorRoutes,
          urlGetDirection: widget.urlGetDirection,
          mapController: _mapController,
          coordinates: _latLogRouting,
          color: Colors.blue,
          onDoneGetRouting: (directions) {
            
            if(widget.isTourguide){
              setState(() {
                List<LatLng> nlatLog = _latLogRouting;
                final LatLngBounds nbounds = LatLngBounds(nlatLog[0], nlatLog[1]);
                nlatLog
                    .map(
                      (markerPosition) => nbounds.extend(markerPosition),
                    )
                    .toList();
                _mapController.fitBounds(
                 nbounds,
                 options: const FitBoundsOptions(forceIntegerZoomLevel: true)
                  // LatLngBounds(
                  //     _directions[0].boundingBox.center,
                  //     _directions[_directions.length - 1].boundingBox.center
                  //   )
                );
                _directions = List.from(directions.map((p) {
                  Color _defaultColor = widget.tourColor;
                  return Polyline(
                    points: p.points,
                    strokeJoin: StrokeJoin.round,
                    borderStrokeWidth: p.borderStrokeWidth,
                    color: _defaultColor,
                    borderColor: _defaultColor,
                  );
                }));
              });
              if(widget.onDoneGetRouting !=null){
                widget.onDoneGetRouting!(_directions);
              }
              debugPrint('onInit _directions ${_directions}');
              if(widget.autoPlay){
                play(currentIndexPos);
              }
            }
          },
        ) : const SizedBox.shrink(),
        widget.isTourguide ? PolylineLayer(polylines: _directions.take(currentIndexPos).toList() ?? []) : const SizedBox.shrink(),
        MarkerLayer(markers: _markers),
        widget.isGetLatLog ? MarkerLayer(markers: customMarkers) : const SizedBox.shrink(),
        widget.isTourguide ? MarkerLayer(
          rotate: true,
          markers: _directions.isNotEmpty ? directMarker : [] ) : const SizedBox.shrink(),
      ],
    );
  }
}


class MobileMapController{
  _MobileMapState? _state;

  void _addState(_MobileMapState state) {
    _state = state;
  }

  void showTopSheet(bool isShow, Widget child) {
    _state?.showTopSheet(isShow, child);
  }

  void openPanel() {
    _state?.openPanel();
  }

  void closePanel() {
    _state?.closePanel();
  }

  void mapMove(LatLng center, {
    double zoom = 7
  }){
    _state?.mapMove(center, zoom: zoom);
  }

  void play(int start){
    _state?.play(start);
  }

  void setSpeed(double s){
    _state?.setSpeed(s);
  }

  void getDirections(List<LocationModal> locationsRouting, Color? color, {
    Function(List<Polyline> listPolYline)? callback
  }){
    _state?.getDirections(locationsRouting, color, callback: callback);
  }

  double get zoom {
    return _state!._zoom;
  }

  int get stepCount {
    return _state!._stepCount;
  }

  MapController get mapController {
    return _state!._mapController;
  }
}