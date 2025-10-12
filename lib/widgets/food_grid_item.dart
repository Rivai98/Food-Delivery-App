import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;
  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    food[widget.foodIndex].imgUrl,
                    width: size.width * 0.5,
                    height: size.height * 0.10,
                  ),
                ),
                InkWell(
                  onTap:
                      () => {
                        setState(() {
                          food[widget
                              .foodIndex] = food[widget.foodIndex].copyWith(
                            isFavourite: !food[widget.foodIndex].isFavourite,
                          );
                        }),
                      },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      food[widget.foodIndex].isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              food[widget.foodIndex].name,
              textScaler: TextScaler.linear(1.2),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: size.height * 0.01),
            Text(
              "\$ ${food[widget.foodIndex].price}",
              textScaler: TextScaler.linear(1),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
