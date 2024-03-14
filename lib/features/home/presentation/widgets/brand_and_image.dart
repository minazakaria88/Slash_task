import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';

import '../cubit/home_cubit.dart';

class NameAndBrandImage extends StatelessWidget {
  const NameAndBrandImage({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            cubit.detailedProduct!.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        20.0.width,
        Container(
          width: 70,
          height: 58,
          decoration: BoxDecoration(
            color: Colors.pink,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(cubit.detailedProduct!.brandImage),
            ),
          ),
        ),
      ],
    );
  }
}