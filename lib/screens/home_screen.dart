import 'package:easy_eat/screens/home_widgets/category_item.dart';
import 'package:easy_eat/screens/widgets/select_pickup_place_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SelectPickUpPlace(),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search_rounded),
                  label: const Text("")),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(
                  categoryName: "Wszystkie",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Burger",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Pizza",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Włoska",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Hinduska",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Turecka",
                  selectCategory: () {},
                ),
                CategoryItem(
                  categoryName: "Kebab",
                  selectCategory: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
