import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_model.dart';

class CategeoryWidget extends StatelessWidget {
  /* final CategoryItem categoryItem; */
  final int categoryIndex;
  final bool isSelected;
  const CategeoryWidget({
    super.key,
    required this.categoryIndex,
    required this.isSelected, 
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: size.width * 0.4,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: isSelected ? Colors.deepOrange : Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                categories[categoryIndex].imgPath,
                width: size.width * 0.12,
                height: size.height * 0.3,
              ),
            ),
            SizedBox(width: size.width * 0.0002),
            Text(
              categories[categoryIndex].categoryName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
