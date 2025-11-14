import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/food_favorite_icon.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItem foodItem;
  const FoodDetailsPage({super.key, required this.foodItem});

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      /* appBar: AppBar(), */
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey.),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                          onTap: () => Navigator.of(context).pop(),
                          icon: Icons.chevron_left,
                        ),
                        FoodFavoriteButton(
                          foodIndex: 1,
                          width: size.width * 0.09,
                          height: size.height * 0.04,
                        ),
                      ],
                    ),

                    SizedBox(
                      width: size.width,
                      height: size.height * 0.45,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          foodItem.imgUrl,

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
