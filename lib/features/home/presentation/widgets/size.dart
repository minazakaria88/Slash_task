import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/app_strings.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            AppStrings.selectedSize,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          AppStrings.sizeChart,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}