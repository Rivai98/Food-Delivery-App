import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';

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
    if (filteredFoodItem.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset("assets/images/empty_state.png"),
            Text("No Favorite Items Found", style: TextStyle(fontSize: 20)),
          ],
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
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Image.network(
                      filteredFoodItem[index].imgUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10.0),

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
                              color: Colors.deepOrange,
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

                      color: Colors.deepOrange,
                      icon: Icon(Icons.favorite),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
