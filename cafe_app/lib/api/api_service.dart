import 'dart:convert';
import 'package:cafe_app/model/customer_reviews.dart';
import 'package:cafe_app/model/post_customer_review.dart';
import 'package:cafe_app/model/post_customer_review_result.dart';
import 'package:cafe_app/model/restaurant_detail_result.dart';
import 'package:cafe_app/model/restaurant_search_result.dart';
import 'package:cafe_app/model/restaurants_result.dart';
import 'package:http/http.dart' as http;

class Service {
  final _baseUrl = 'https://restaurant-api.dicoding.dev/';

  //format awal
  //di private karna cuma dibutuhin sama service doang
  Future<Map<String, dynamic>> _getApi(String endpoint) async {
    final response = await http.get(_baseUrl + endpoint);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  //menuju ke bagian restaurant list nya
  Future<RestaurantsResult> getListRestaurant() async {
    final json = await _getApi('list');
    return RestaurantsResult.fromJson(json);
  }

  Future<RestaurantDetailResult> getDetailRestaurant(String id) async {
    final urlEnd = 'detail/$id'; //biar rapih
    final json = await _getApi(urlEnd);
    return RestaurantDetailResult.fromJson(json);
  }

  Future<RestaurantsSearchResult> getSearchRestaurant(String keyword) async {
    final json = await _getApi('/search?q=$keyword');
    return RestaurantsSearchResult.fromJson(json);
  }

  //bisa buat dua
  // Future<List<CustomerReviews>> postReview(PostCustomerReview body) async {
  //   final response = await http.post(
  //       _baseUrl + '/review', body: jsonEncode(body.toJson()),
  //       headers: {'Content-Type': 'application/json', 'X-Auth-Token': '12345'},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(response.body);
  //     final result = PostCustomerReview.fromJson(jsonResponse);
  //     return result.customerReviews;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<List<CustomerReviews>> postReview(PostCustomerReview body) async {
    final response = await http.post(
      _baseUrl + 'review',
      body: jsonEncode(body.toJson()),
      headers: {"Content-Type": "application/json", "X-Auth-Token": "12345"},
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final results = PostCustomerReviewsResult.fromJson(jsonResponse);
      return results.customerReviews;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
