import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';
import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart';

import '../cubit/home_state.dart';

class SmallImageListView extends StatelessWidget {
  const SmallImageListView({
    super.key, required this.cubit,
  });
  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 50,
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(cubit.detailedProduct!.variations[0]
                .productVarientImages[index].imagePath),
          ),
        ),
        separatorBuilder: (context, index) => Container(
          width: 10,
        ),
        itemCount:
        cubit.detailedProduct!.variations[0].productVarientImages.length,
      ),
    );
  }
}