import 'package:flutter/material.dart';
import 'dart:io';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/models/ui_models/food_details_args.dart';

import 'package:food_delivery/widgets/custom_button.dart';
import 'package:food_delivery/widgets/food_details/counter_button.dart';
import 'package:food_delivery/widgets/food_details/counter_widget.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';
import 'package:food_delivery/widgets/food_details/top_banner.dart';
import 'package:food_delivery/widgets/food_favorite_icon.dart';

class FoodDetailsPage extends StatelessWidget {
  final int counter = 1;
  const FoodDetailsPage({super.key});

  static const String foodDetailsRouteName = "/food-details"; 

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs foodArgs =
        ModalRoute.settingsOf(context)!.arguments as FoodDetailsArgs;
    final int foodIndex = foodArgs.foodIndex;
    return Scaffold(
      /* appBar: AppBar(), */
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  floating: false,

                  expandedHeight: size.height * 0.50,

                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      width: size.width * 0.05,
                      height: size.height * 0.04,
                      onTap: () => Navigator.of(context).pop<int>(counter),
                      icon:
                          Platform.isIOS
                              ? Icons.chevron_left
                              : Icons.arrow_back_rounded,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FoodFavoriteButton(
                        foodIndex: foodIndex,
                        width: size.width * 0.09,
                        height: size.height * 0.04,
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      food[foodIndex].imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 200.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food[foodIndex].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    "Bufflo Burger",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              CounterWidget(),
                            ],
                          ),
                          SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const PropertyItem(
                                propertyName: 'Size',
                                propertyValue: 'Meduim',
                              ),
                              VerticalDivider(),

                              const PropertyItem(
                                propertyName: 'Calories',
                                propertyValue: '150 kcal',
                              ),
                              VerticalDivider(),
                              const PropertyItem(
                                propertyName: 'Cooking',
                                propertyValue: '10 - 20 Mins',
                              ),
                            ],
                          ),

                          const SizedBox(height: 16.0),

                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),

          /* Expanded(
            flex: 1,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                TopBanner(foodIndex: foodIndex),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 200.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food[foodIndex].name,
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                "Bufflo Burger",
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          CounterWidget(),
                        ],
                      ),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PropertyItem(
                            propertyName: 'Size',
                            propertyValue: 'Meduim',
                          ),
                          VerticalDivider(),

                          const PropertyItem(
                            propertyName: 'Calories',
                            propertyValue: '150 kcal',
                          ),
                          VerticalDivider(),
                          const PropertyItem(
                            propertyName: 'Cooking',
                            propertyValue: '10 - 20 Mins',
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),

                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), */
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "\$ ${food[foodIndex].price}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 45),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
