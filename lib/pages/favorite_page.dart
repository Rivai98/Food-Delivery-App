import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/ui_models/food_details_args.dart';
import 'package:food_delivery/pages/food_details.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final filteredFoodItem =
      food.where((item) => item.isFavourite == true).toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (filteredFoodItem.isEmpty) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/empty_state.png",
                width: size.width * 0.8,
              ),
              Text(
                "No Favorite Items Found",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: filteredFoodItem.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                int favouriteIndexItem = food.indexOf(filteredFoodItem[index]);
                Navigator.of(context).pushNamed(
                  "/food-details",
                  arguments: FoodDetailsArgs(foodIndex: favouriteIndexItem),
                  /* MaterialPageRoute(
                    builder: (context) {
                      int favouriteIndexItem = food.indexOf(
                        filteredFoodItem[index],
                      );
                      return FoodDetailsPage();
                    },
                  ), */
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Image.network(
                        filteredFoodItem[index].imgUrl,
                        height: size.height * 0.1,
                        width: size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: size.width * 0.01),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filteredFoodItem[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "\$ ${filteredFoodItem[index].price}",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            food[index] = food[index].copyWith(
                              isFavourite: false,
                            );
                            filteredFoodItem.removeAt(index);
                          });
                        },

                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.favorite),
                        iconSize: size.width * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
