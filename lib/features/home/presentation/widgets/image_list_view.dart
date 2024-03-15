import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({
    super.key, required this.cubit,
  });

  final AppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height*0.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: context.width-40,
          height: 80,
          child: Image(
            image: NetworkImage(cubit.detailedProduct!.variations[cubit.currentColor].productVarientImages[index].imagePath),
            fit: BoxFit.fill,
          ),
        ),
        separatorBuilder:(context, index) =>Container(
          width: 30,
        ),
        itemCount: cubit.detailedProduct!.variations[cubit.currentColor].productVarientImages.length,
      ),
    );
  }
}