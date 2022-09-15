import 'package:flutter/material.dart';
import '../widgets/menu_list.dart';

import '../models/restaurant.dart';
import '../widgets/rating_star.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail_page';

  final RestaurantElement restaurantElement;
  const DetailScreen({super.key, required this.restaurantElement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantElement.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: restaurantElement.pictureId,
                child: Image.network(restaurantElement.pictureId)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRatingStars(restaurantElement.rating),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    restaurantElement.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(restaurantElement.city),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text('Rating: ${restaurantElement.rating}'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Deskripsi'),
                  const Divider(color: Colors.grey),
                  Text(
                    restaurantElement.description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Drink menus",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            MenuList(restaurantElement: restaurantElement)
            // MenuList(restaurantElement),
          ],
        ),
      ),
    );
  }
}
