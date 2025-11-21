import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/widgets/custom_button.dart';

class FoodFavoriteButton extends StatefulWidget {
  final int foodIndex;
  final double width;
  final double height;
  FoodFavoriteButton({
    super.key,
    required this.foodIndex,
    required this.width,
    required this.height,
  }) {
    /* debugPrint("Contructor in Favorite Button Widget"); */
  }

  @override
  State<FoodFavoriteButton> createState() {
    /* debugPrint("Create State Method!"); */
    return _FoodFavoriteButtonState();
  }
}

class _FoodFavoriteButtonState extends State<FoodFavoriteButton> {
  /* _FoodFavoriteButtonState() {
    debugPrint("Contructor Favorite Button State!");
  } */
  /* @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("InitState(_)!");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    debugPrint("didChangedDependcies!()");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint("Dispose() called!");
  } */

  @override
  Widget build(BuildContext context) {
    /* debugPrint("Build Method Called!"); */
    return Align(
      alignment: Alignment.topRight,
      child: CustomButton(
        width: widget.width,
        height: widget.height,
        onTap:
            () => {
              setState(() {
                food[widget.foodIndex] = food[widget.foodIndex].copyWith(
                  isFavourite: !food[widget.foodIndex].isFavourite,
                );
              }),
            },
        icon:
            food[widget.foodIndex].isFavourite
                ? Icons.favorite
                : Icons.favorite_border,
      ),
    );

    /* InkWell(
      onTap:
          () => {
            setState(() {
              food[widget.foodIndex] = food[widget.foodIndex].copyWith(
                isFavourite: !food[widget.foodIndex].isFavourite,
              );
            }),
          },
      child: Align(
        alignment: Alignment.topRight,
        child: Icon(
          size: widget.constrains.maxWidth * 0.15,
          food[widget.foodIndex].isFavourite
              ? Icons.favorite
              : Icons.favorite_border,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ); */
  }
}
