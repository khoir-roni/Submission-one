import 'package:flutter/material.dart';

import '../widgets/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Restaurant',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Text(
                    'Recommendation restaurant for you!',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: ListViewRestaurants(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
