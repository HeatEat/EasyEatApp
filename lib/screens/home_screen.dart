import 'package:easy_eat/screens/home_widgets/category_item.dart';
import 'package:easy_eat/screens/widgets/select_pickup_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/categories/categories_bloc.dart';

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
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is SelectedCategoryState) {
                  return ListView.builder(
                      itemCount: state.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryItem(
                            categoryName: state.categories[index].name,
                            selectCategory: () {},
                            isSelected: state.categories[index].selected,
                            categoryId: state.categories[index].id,
                          ));
                }
                return Container();
              },
            ),
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     CategoryItem(
            //       categoryName: "Wszystkie",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Burger",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Pizza",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Włoska",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Hinduska",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Turecka",
            //       selectCategory: () {},
            //     ),
            //     CategoryItem(
            //       categoryName: "Kebab",
            //       selectCategory: () {},
            //     ),
            //   ],
            // ),
          ),
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(builder: (context, state) {
          BlocProvider.of<CategoriesBloc>(context).add(LoadCategoriesEvent());
          return Container();
        })
      ],
    );
  }
}
