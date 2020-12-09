import 'package:cafe_app/model/restaurant.dart';
import 'package:cafe_app/screen/detail_restaurant_page.dart';
import 'package:cafe_app/utils/navigation.dart';
import 'package:flutter/material.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;

  RestaurantList({this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: restaurants.length,
        shrinkWrap: true,
        itemBuilder: (context, position) {
          final restaurant = restaurants[position];
          return ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: restaurant.id,
                  child: FadeInImage(
                    placeholder: AssetImage('images/not_found.png'),
                    image: NetworkImage(restaurant.pictureId),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              width: 60,
            ),            title: Text(
              restaurant.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(restaurant.city)
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(restaurant.rating.toString())
                  ],
                )
              ],
            ),
            onTap: () {
              Navigation.intentWithData(
                  RestaurantDetailPage.routeName, restaurant.id.toString());
            },
          );
        });
  }
}
