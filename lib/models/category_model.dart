import 'package:food_delivery/utilities/app_assets.dart';

class CategoryItem {
  final int id;
  final String categoryName;
  final String imgPath;

  CategoryItem({
    required this.id,
    required this.categoryName,
    required this.imgPath,
  });
}

List<CategoryItem> categories = [
  CategoryItem(id: 1, categoryName: "Bueger", imgPath: AppAssets.burgerIcon),
  CategoryItem(id: 2, categoryName: "Pizza", imgPath: AppAssets.pizzaIcon),
  CategoryItem(id: 3, categoryName: "Pasta", imgPath: AppAssets.pastaIcon),
];
