

import 'package:shared_module/constants/constants.dart';
import 'package:shared_module/features/search_page/model/FilterModel.dart';

abstract class SearchEvent {}

class FetchDataMainAppMenu extends SearchEvent {}

class Filter extends SearchEvent {
  final FilterModel filterModel;

  Filter(this.filterModel);
}

class Pagination extends SearchEvent {
  final int index;

  Pagination(this.index);
}

class SaveCityId extends SearchEvent {
  final String cityId;

  SaveCityId(this.cityId);
}

class InitialLoadingFilter extends SearchEvent {
  InitialLoadingFilter();
}

class SaveBuyTypeEvent extends SearchEvent {
final BUYTYPE buyType;

  SaveBuyTypeEvent(this.buyType);
}
