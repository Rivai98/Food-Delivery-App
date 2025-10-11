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
    return Container(
      height: 100,
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
                    width: 100,
                    height: 100.0,
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 3.0),
            Text(
              "\$ ${food[widget.foodIndex].price}",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
