import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/food_favorite_icon.dart';

class TopBanner extends StatelessWidget {
  final int foodIndex;
  const TopBanner({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 136, 133, 113),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.30,
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      width: size.width * 0.09,
                      height: size.height * 0.04,
                      onTap: () => Navigator.of(context).pop(),
                      icon:
                          Platform.isIOS
                              ? Icons.chevron_left
                              : Icons.arrow_back_rounded,
                    ),
                    FoodFavoriteButton(
                      foodIndex: foodIndex,
                      width: size.width * 0.09,
                      height: size.height * 0.04,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Image.network(
                  food[foodIndex].imgUrl,

                  fit: BoxFit.contain,
                  width: size.width,
                  height: size.height * 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
