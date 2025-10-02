import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),

              child: Image.asset(
                "assets/images/classic_burger.jpg",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.0),

            Expanded(
              child: GridView.builder(
                itemCount: food.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20,
                ),
                itemBuilder:
                    (context, index) => FoodGridItem(foodItem: food[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
