import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class PriceAndBrandName extends StatelessWidget {
  const PriceAndBrandName({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'EGP ${cubit.detailedProduct!.variations[cubit.currentColor].price.toString()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          cubit.detailedProduct!.brandName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}