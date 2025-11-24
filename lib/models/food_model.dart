class FoodItem {
  final String name;
  final String imgUrl;
  final double price;
  final bool isFavourite;
  final int categoryId;

  FoodItem({
    required this.name,
    required this.imgUrl,
    required this.price,
    this.isFavourite = false,
    required this.categoryId,
  });

  FoodItem copyWith({
    String? name,
    String? imgUrl,
    double? price,
    bool? isFavourite,
    int? categoryId,
  }) {
    return FoodItem(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      isFavourite: isFavourite ?? this.isFavourite,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    name: "Classic Burger",
    imgUrl:
        "https://carlsjr.com.my/wp-content/uploads/2020/08/classic-burger-with-cheese-2.png",
    price: 5.5,
    categoryId: 1,
  ),
  FoodItem(
    name: "Beef Burger",
    imgUrl:
        "https://carlsjr.com.my/wp-content/uploads/2020/08/classic-burger-with-cheese-2.png",
    price: 5.5,
    categoryId: 1,
  ),

  FoodItem(
    name: "Cheese Burger",
    imgUrl:
        "https://www.mcdonalds.eg/Cms_Data/Contents/En/Media/15.4.25/Cheeseburger.png",
    price: 6.5,
    categoryId: 1,
  ),

  FoodItem(
    name: "Chicken Burger",
    imgUrl:
        "https://buffalonlineorderingprod.s3.eu-west-1.amazonaws.com/menu_items/ae28628c3ef8fe8935302a35f33cca2a.png",
    price: 8.5,
    categoryId: 1,
  ),

  FoodItem(
    name: "Cheese Pizza",
    imgUrl: "https://valentinos.com/wp-content/uploads/2024/11/cheese.png",
    price: 8.5,
    categoryId: 2,
  ),

  FoodItem(
    name: "Chicken Pizza",
    imgUrl:
        "https://roma2go.com/wp-content/uploads/2023/01/Crispy-Chicken-1.png",
    price: 10,
    categoryId: 2,
  ),
  FoodItem(
    name: "Pizza Burger",
    imgUrl:
        "https://user-gen-media-assets.s3.amazonaws.com/seedream_images/78ea165c-0ddb-43e0-b15f-d4547adebcfe.png",
    price: 12.5,
    categoryId: 2,
  ),

  FoodItem(
    name: "Speghetti Pasta",
    imgUrl:
        "https://static.vecteezy.com/system/resources/previews/030/672/223/non_2x/of-spaghetti-with-no-background-with-white-free-photo.jpg",
    price: 5.5,
    categoryId: 3,
  ),
];
