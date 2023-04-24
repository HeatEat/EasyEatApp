import 'package:easy_eat/core/constatnts.dart';
import 'package:flutter/material.dart';

class SelectPickUpPlace extends StatelessWidget {
  const SelectPickUpPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          const Text(
            HomeScreenK.pickUpPlace,
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
          Row(
            children: [
              const Text("RZE001"),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
