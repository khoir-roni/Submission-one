import 'package:flutter/material.dart';

import '../models/restaurant.dart';
import '../theme/theme.dart';

class MenuList extends StatelessWidget {
  final RestaurantElement restaurantElement;
  const MenuList({Key? key, required this.restaurantElement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurantElement.menus.foods.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 180.0,
                        width: 180.0,
                        image: NetworkImage(restaurantElement.pictureId),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 10.0,
                      bottom: 10.0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          restaurantElement.menus.drinks[index].name,
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    blurRadius: 1,
                                    offset: Offset(1, 1),
                                    color: Colors.white)
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
