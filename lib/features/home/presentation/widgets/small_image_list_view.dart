import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';

import '../cubit/home_state.dart';

class SmallImageListView extends StatelessWidget {
  const SmallImageListView({
    super.key, required this.state,
  });
  final SuccessDetailedProductDataState state;
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
            image: NetworkImage(state.product.variations[0]
                .productVarientImages[index].imagePath),
          ),
        ),
        separatorBuilder: (context, index) => Container(
          width: 10,
        ),
        itemCount:
        state.product.variations[0].productVarientImages.length,
      ),
    );
  }
}