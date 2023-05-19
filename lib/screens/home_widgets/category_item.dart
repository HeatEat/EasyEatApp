import 'package:flutter/material.dart';

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
          const SizedBox(width: 8),
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