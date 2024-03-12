import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/location_search_controller.dart';
import '../models/location_details.dart';

part 'location_search_event.dart';

part 'location_search_state.dart';

class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  final LocationSearchController controller;

  LocationSearchBloc(this.controller)
      : super(const LocationSearchState.initial()) {
    on<LoadLocations>((event, emit) async {
      await loadLocation("", emit);
    });
    on<KeywordChanged>((event, emit) async {
      emit(state.copyWith(searchKey: event.keyword));
      await loadLocation(event.keyword, emit);
    });

    on<LocationSelected>((event, emit) {
      emit(state.copyWith(
          selectedLocation: event.locationDetails, isLocationSelected: true));
    });
    on<MyLocationSelected>((event, emit) async {
      try {
        final location = await controller.getMyLocation();
        emit(state.copyWith(
            selectedLocation: location, isLocationSelected: true));
      } catch (e) {
        state.copyWith(
            myLocationError: "Cannot retrieve your location",
            isLocationSelected: true);
      }
    });
  }

  Future<void> loadLocation(
      String keyword, Emitter<LocationSearchState> emit) async {
    emit(state.copyWith(isLoading: true));
    var locations = await controller.getLocations(keyword);
    emit(state.copyWith(isLoading: false, locations: locations));
  }
}
