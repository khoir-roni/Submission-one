import 'package:flutter/material.dart';

buildRatingStars(double rating) {
  String stars = '';
  for (int i = 0; i < rating; i++) {
    stars += '⭐ ';
  }
  stars.trim();
  return Text(stars);
}
