import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_model.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/ui_models/food_details_args.dart';
import 'package:food_delivery/pages/food_details.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgets/category_widget.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = -1;
  int _categoryId = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final List<FoodItem> filteredItems =
        _categoryId == 0
            ? food
            : food.where((item) => item.categoryId == _categoryId).toList();

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
                        AppAssets.appBanner,
                        height: _getImageHeight(constrains, isLandScape),
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),

                    SizedBox(
                      width: size.width,
                      height: size.height * 0.08,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder:
                            (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedItem == index) {
                                    selectedItem = -1;
                                  } else {
                                    selectedItem = index;
                                  }
                                  _categoryId = selectedItem + 1;

                                  debugPrint(
                                    " SelectedItem Value : ${selectedItem}",
                                  );
                                });
                              },
                              child: CategeoryWidget(
                                categoryIndex: index,
                                isSelected: selectedItem == index,
                              ),
                            ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isLandScape ? 3 : 2,
                        crossAxisSpacing: size.width * 0.02,
                        mainAxisSpacing: size.height * 0.02,
                      ),
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        final int indexofItem = food.indexOf(item);
                        return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(
                                  FoodDetailsPage.foodDetailsRouteName,
                                  arguments: FoodDetailsArgs(
                                    foodIndex: indexofItem,
                                  ),
                                )
                                .then((value) {
                                  setState(() {});
                                  debugPrint(value.toString());
                                });
                          },
                          child: FoodGridItem(foodIndex: indexofItem),
                        );
                      },
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
