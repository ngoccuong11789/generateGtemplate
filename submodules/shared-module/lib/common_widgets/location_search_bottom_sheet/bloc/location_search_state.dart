part of 'location_search_bloc.dart';

class LocationSearchState extends Equatable {
  final List<LocationDetails> locations;
  final bool isLoading;
  final LocationDetails? selectedLocation;
  final bool isLocationSelected;
  final String? myLocationError;
  final String searchKey;

  const LocationSearchState(
      {required this.locations,
      this.isLoading = false,
      this.selectedLocation,
      this.isLocationSelected = false,
      this.myLocationError,
      this.searchKey =''});

  const LocationSearchState.initial()
      : locations = const [],
        isLoading = false,
        selectedLocation = null,
        isLocationSelected = false,
        myLocationError = null,
        searchKey = '';

  @override
  List<Object?> get props => [
        locations,
        isLoading,
        selectedLocation,
        isLocationSelected,
        myLocationError,
        searchKey
      ];

  LocationSearchState copyWith({
    List<LocationDetails>? locations,
    bool? isLoading,
    LocationDetails? selectedLocation,
    bool? isLocationSelected,
    String? myLocationError,
    String? searchKey,
  }) {
    return LocationSearchState(
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      isLocationSelected: isLocationSelected ?? this.isLocationSelected,
      myLocationError: myLocationError ?? this.myLocationError,
      searchKey: searchKey ?? this.searchKey,
    );
  }
}
