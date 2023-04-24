import 'package:easy_eat/core/constatnts.dart';
import 'package:easy_eat/screens/widgets/select_pickup_place_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: BottomNavBarK.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: BottomNavBarK.shopingCard,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: BottomNavBarK.account,
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.selectCategory,
  });

  final String categoryName;
  final VoidCallback selectCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectCategory,
      child: Row(
        children: [
          SizedBox(width: 8),
          Card(
            color: Theme.of(context).highlightColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(categoryName),
            ),
          ),
        ],
      ),
    );
  }
}
