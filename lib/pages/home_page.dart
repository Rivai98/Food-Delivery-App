import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/pages/food_details.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: LayoutBuilder(
        builder:
            (context, constrains) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),

                      child: Image.asset(
                        "assets/images/classic_burger.jpg",
                        height: _getImageHeight(constrains, isLandScape),
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: food.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isLandScape ? 3 : 2,
                        crossAxisSpacing: size.width * 0.02,
                        mainAxisSpacing: size.height * 0.02,
                      ),
                      itemBuilder:
                          (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => FoodDetailsPage(
                                        foodItem: food[index],
                                      ),
                                ),
                              );
                            },
                            child: FoodGridItem(foodIndex: index),
                          ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  double _getImageHeight(BoxConstraints constrains, bool islandScape) {
    final screenHeight = constrains.maxHeight;

    if (islandScape) {
      return screenHeight * 0.75;
    }
    if (screenHeight >= 1200) {
      return screenHeight * 0.8;
    } else if (screenHeight >= 800) {
      return screenHeight * 0.65;
    } else if (screenHeight >= 600) {
      return screenHeight * 0.28;
    } else {
      return screenHeight * 0.20;
    }
  }
}
