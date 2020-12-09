import 'package:cafe_app/api/api_service.dart';
import 'package:cafe_app/model/customer_reviews.dart';
import 'package:cafe_app/model/restaurant_detail.dart';
import 'package:cafe_app/utils/enum.dart';
import 'package:flutter/material.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final Service apiService;

  RestaurantDetailProvider({@required this.apiService});

  RestaurantDetail _restaurantDetail;
  String _message = '';
  Result _state;
  List<CustomerReviews> _customerReviews;

  RestaurantDetail get restaurant => _restaurantDetail;

  String get message => _message;

  Result get state => _state;

  List<CustomerReviews> get customerReviews => _customerReviews;

  Future<dynamic> fetchRestaurantDetail(String id) async {
    try {
      _state = Result.Loading;
      notifyListeners();
      final result = await apiService.getDetailRestaurant(id);
      print(result);
      if (result.error) {
        _state = Result.NoData;
        notifyListeners();
        return _message = result.message;
      } else {
        _state = Result.HasData;
        _customerReviews = result.restaurant.customerReviews;
        notifyListeners();
        return _restaurantDetail = result.restaurant;
      }
    } catch (e) {
      _state = Result.Error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }

  updateCostumeReviews(List<CustomerReviews> customerReviews) {
    _customerReviews = customerReviews;
    notifyListeners();
  }
}