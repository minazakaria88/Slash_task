import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';

import '../cubit/home_state.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({
    super.key, required this.state,
  });

  final SuccessDetailedProductDataState state;
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
            image: NetworkImage(state.product.variations[0].productVarientImages[index].imagePath),
            fit: BoxFit.fill,
          ),
        ),
        separatorBuilder:(context, index) =>Container(
          width: 30,
        ),
        itemCount: state.product.variations[0].productVarientImages.length,
      ),
    );
  }
}