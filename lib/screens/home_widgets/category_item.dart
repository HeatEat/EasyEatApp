import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/categories/categories_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.selectCategory,
    required this.isSelected,
    required this.categoryId,
  });

  final int categoryId;
  final bool isSelected;
  final String categoryName;
  final VoidCallback selectCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CategoriesBloc>(context)
            .add(ChangeCategoryEvent(categoryId));
      },
      child: Row(
        children: [
          const SizedBox(width: 8),
          Card(
            color: isSelected
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.background,
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
