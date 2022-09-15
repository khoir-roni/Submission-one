import 'package:flutter/material.dart';
import '../theme/theme.dart';

import '../models/restaurant.dart';
import '../screens/detail_page.dart';
import 'rating_star.dart';

class ListViewRestaurants extends StatelessWidget {
  const ListViewRestaurants({super.key});

  Widget _buildList(BuildContext context, RestaurantElement restaurantElement) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.routeName,
            arguments: restaurantElement);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120.0,
                        child: Text(
                          restaurantElement.name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    restaurantElement.city,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  buildRatingStars(restaurantElement.rating),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          restaurantElement.rating.toString(),
                          style: const TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 15.0,
            bottom: 15.0,
            child: Hero(
              tag: restaurantElement.pictureId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  width: 110.0,
                  image: NetworkImage(
                    restaurantElement.pictureId,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final restaurant = restaurantFromJson(snapshot.data);

            final restaurantElement = restaurant.restaurants;
            return ListView.builder(
              itemCount: restaurantElement.length,
              itemBuilder: (context, index) {
                return _buildList(context, restaurantElement[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
