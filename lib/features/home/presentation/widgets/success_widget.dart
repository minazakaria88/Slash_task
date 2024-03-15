import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';
import 'package:slash_task/features/home/presentation/widgets/price_and_brand_name.dart';
import 'package:slash_task/features/home/presentation/widgets/selected_color.dart';
import 'package:slash_task/features/home/presentation/widgets/selected_material.dart';
import 'package:slash_task/features/home/presentation/widgets/selected_size.dart';
import 'package:slash_task/features/home/presentation/widgets/size.dart';
import 'package:slash_task/features/home/presentation/widgets/small_image_list_view.dart';

import '../cubit/home_cubit.dart';

import 'brand_and_image.dart';
import 'image_list_view.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesListView(
              cubit: cubit,
            ),
            20.0.height,
            Center(
              child: SizedBox(
                width: 50 *
                    cubit.detailedProduct!.variations[cubit.currentColor].productVarientImages
                        .length *
                    0.99,
                child: SmallImageListView(
                  cubit: cubit,
                ),
              ),
            ),
            40.0.height,
            NameAndBrandImage(cubit: cubit),
            30.0.height,
            PriceAndBrandName(cubit: cubit),
            20.0.height,
            if (cubit.size.isNotEmpty) ...[
              const SizeWidget(),
              20.0.height,
              SelectedSize(cubit: cubit),
            ],
            20.0.height,
            if (cubit.material.isNotEmpty) ...[
              const Text(
                'Selected Material',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              20.0.height,
              SelectedMaterial(cubit: cubit),
            ],
            10.0.height,
            if (cubit.colors.isNotEmpty) ...[
              const Text(
                'Selected Colors',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              20.0.height,
              SelectedColor(cubit: cubit),
            ],
          ],
        ),
      ),
    );
  }
}
