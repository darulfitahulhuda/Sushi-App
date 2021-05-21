import 'package:flutter/cupertino.dart';
import 'package:sushiapp/model/ingredients.dart';

enum Types { Popular, All }

class Sushi {
  final int id;
  final String name;
  final String subtitle;
  final String image;
  final String details;
  final List<Ingredients> ingredients;
  final int price;
  final double rating;
  final List<Types> types;
  final int duration;
  final String phoneNumber;
  bool favorite;

  Sushi(
      {this.id,
      this.favorite = false,
      @required this.phoneNumber,
      @required this.name,
      @required this.subtitle,
      @required this.image,
      @required this.details,
      @required this.ingredients,
      @required this.price,
      @required this.rating,
      @required this.types,
      @required this.duration});
}

List<Sushi> listSushi = [
  Sushi(
      id: 1,
      name: 'Sushi Salmon',
      subtitle: 'with raice & vegetables',
      image: 'assets/sushi_salmon.png',
      details:
          'Sushi Salmon salah satu sushi yang terkenal adalah sushi dengan nasi yang dikepal dan dibentuk menjadi lonjong kemudian diberi irisan ikan salmon di atasnya. Salmon adalah ikan yang banyak digunakan sebagai neta pada berbagai jenis sushi.',
      ingredients: [
        Ingredients(name: 'Salmon', image: 'assets/salmon.png'),
        Ingredients(name: 'Rice', image: 'assets/rice.png'),
        Ingredients(name: 'Vegetable', image: 'assets/vegetable.png'),
        Ingredients(name: 'Vinegar', image: 'assets/vinegar.png'),
      ],
      price: 40000,
      rating: 4.8,
      types: [Types.All],
      duration: 50,
      phoneNumber: '+6288812346554',
      favorite: false),
  Sushi(
      id: 2,
      name: 'Sushi Octopus',
      subtitle: 'with raice & vegetables',
      image: 'assets/sushi_octopus.png',
      details:
          'Sushi Salmon salah satu sushi yang terkenal adalah sushi dengan nasi yang dikepal dan dibentuk menjadi lonjong kemudian diberi irisan ikan salmon di atasnya. Salmon adalah ikan yang banyak digunakan sebagai neta pada berbagai jenis sushi.',
      ingredients: [
        Ingredients(name: 'Octopus', image: 'assets/octopus.png'),
        Ingredients(name: 'Rice', image: 'assets/rice.png'),
        Ingredients(name: 'Vegetable', image: 'assets/vegetable.png'),
        Ingredients(name: 'Vinegar', image: 'assets/vinegar.png'),
      ],
      price: 50000,
      rating: 4.8,
      types: [Types.All, Types.Popular],
      duration: 45,
      phoneNumber: '+6283812356143',
      favorite: false),
  Sushi(
    id: 3,
    name: 'Sushi Caviar',
    subtitle: 'with raice & vegetables',
    image: 'assets/sushi_cavior.png',
    details:
        'Sushi Salmon salah satu sushi yang terkenal adalah sushi dengan nasi yang dikepal dan dibentuk menjadi lonjong kemudian diberi irisan ikan salmon di atasnya. Salmon adalah ikan yang banyak digunakan sebagai neta pada berbagai jenis sushi.',
    ingredients: [
      Ingredients(name: 'Caviar', image: 'assets/caviar.jpg'),
      Ingredients(name: 'Rice', image: 'assets/rice.png'),
      Ingredients(name: 'Vegetable', image: 'assets/vegetable.png'),
      Ingredients(name: 'Vinegar', image: 'assets/vinegar.png'),
    ],
    price: 60000,
    rating: 4.3,
    types: [
      Types.All,
    ],
    duration: 30,
    phoneNumber: '+628131346542',
    favorite: true,
  ),
  Sushi(
    id: 4,
    name: 'Sushi Shrimp',
    subtitle: 'with raice & vegetables',
    image: 'assets/sushi_shrimp.png',
    details:
        'Sushi Salmon salah satu sushi yang terkenal adalah sushi dengan nasi yang dikepal dan dibentuk menjadi lonjong kemudian diberi irisan ikan salmon di atasnya. Salmon adalah ikan yang banyak digunakan sebagai neta pada berbagai jenis sushi.',
    ingredients: [
      Ingredients(name: 'Shrimp', image: 'assets/sh.png'),
      Ingredients(name: 'Rice', image: 'assets/rice.png'),
      Ingredients(name: 'Vegetable', image: 'assets/vegetable.png'),
      Ingredients(name: 'Vinegar', image: 'assets/vinegar.png'),
    ],
    price: 55000,
    rating: 4.7,
    types: [Types.All, Types.Popular],
    duration: 40,
    phoneNumber: '+6288887846542',
    favorite: true,
  ),
];
