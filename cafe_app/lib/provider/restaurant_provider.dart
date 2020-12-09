import 'package:cafe_app/api/api_service.dart';
import 'package:cafe_app/model/restaurant.dart';
import 'package:cafe_app/model/restaurant_search_result.dart';
import 'package:cafe_app/model/restaurants_result.dart';
import 'package:cafe_app/utils/enum.dart';
import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  final Service apiService;

  RestaurantProvider({@required this.apiService}) {
    getRestaurant();
  }

  List<Restaurant> _listRestaurants;
  List<Restaurant> _restaurant;
  Result _result;
  Result _tempState;
  String _message = ''; //buat nge-handle respon nya itu failed atau success
  String _keyword;

  List<Restaurant> get restaurant => _restaurant;

  String get message => _message;

  Result get state => _result;

  Future<dynamic> _fetchProvider(FetchType type) async {
    final _tryDataRestaurant = () async {
      final result = await apiService.getListRestaurant();

      if (result.restaurants.isEmpty) {
        _result = Result.NoData;
        _tempState = _result;
        notifyListeners();
        return _message = 'No Restaurant Data';
      } else {
        _result = Result.HasData;
        _tempState = _result;
        _listRestaurants = result.restaurants;
        notifyListeners();
        return _restaurant = result.restaurants;
      }
    };

    final _trySearchRestaurant = () async {
      final result = await apiService.getSearchRestaurant(_keyword);
      if (result.founded == 0) {
        _result = Result.NoData;
        notifyListeners();
        return _message = '$_keyword not found';
      } else {
        _result = Result.HasData;
        notifyListeners();
        return _restaurant = result.restaurants;
      }
    };

    try {
      _result = Result.Loading;
      notifyListeners();
      switch (type) {
        case FetchType.AllRestaurant:
          _tryDataRestaurant();
          break;
        case FetchType.SearchRestaurant:
          _trySearchRestaurant();
          break;
        default:
          _tryDataRestaurant();
          break;
      }
    } catch (e) {
      _result = Result.Error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }

  Future<RestaurantsSearchResult> fetchRestaurantsSearch(String keyword) async {
    _keyword = keyword;
    return await _fetchProvider(FetchType.SearchRestaurant);
  }

  Future<RestaurantsResult> getRestaurant() async {
    return await _fetchProvider(FetchType.AllRestaurant);
  }

  resetRestaurant() {
    if (_tempState == Result.HasData) _restaurant = _listRestaurants;
    getRestaurant();
  }

}
