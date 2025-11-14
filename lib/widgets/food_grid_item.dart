import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/food_favorite_icon.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    /* final size = MediaQuery.of(context).size; */
    return LayoutBuilder(
      builder: (context, constrains) {
        return Container(
          height: constrains.maxHeight,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        food[foodIndex].imgUrl,
                        width: constrains.maxWidth * 0.9,
                        height: constrains.maxHeight * 0.55,
                      ),
                    ),
                    FoodFavoriteButton(
                      foodIndex: foodIndex,
                      width:constrains.maxWidth * 0.15 ,
                      height: constrains.maxHeight * 0.07,
                    ),
                  ],
                ),
                SizedBox(
                  width: constrains.maxWidth * 0.7,
                  height: constrains.maxHeight * 0.12,

                  child: FittedBox(
                    child: Text(
                      food[foodIndex].name,
                      textScaler: TextScaler.linear(1.2),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: constrains.maxHeight * 0.02),
                SizedBox(
                  width: constrains.maxWidth * 0.6,
                  height: constrains.maxHeight * 0.12,
                  child: FittedBox(
                    child: Text(
                      "\$ ${food[foodIndex].price}",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
