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
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 10),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    restaurantElement.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Menu",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Food:",
              ),
            ),
            MenuList(menu: restaurantElement.menus.foods),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Drink:",
              ),
            ),
            MenuList(menu: restaurantElement.menus.drinks),

            // MenuList(restaurantElement),
          ],
        ),
      ),
    );
  }

  lismenu(Menus menus) {}
}
