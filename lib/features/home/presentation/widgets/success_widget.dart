import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/extensions.dart';
import 'package:slash_task/features/home/presentation/widgets/small_image_list_view.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'image_list_view.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.cubit, required this.state,
  });

  final AppCubit cubit;
  final SuccessDetailedProductDataState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesListView(
              state: state,
            ),
            20.0.height,
            Center(
              child: SizedBox(
                width: 50 *
                    cubit.detailedProduct!.variations[0]
                        .productVarientImages.length *
                    0.99,
                child: SmallImageListView(
                  state: state,
                ),
              ),
            ),
            40.0.height,
            Row(
              children: [
                Expanded(
                  child: Text(
                    state.product.name,
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
                      image: NetworkImage(state.product.brandImage),
                    ),
                  ),
                ),
              ],
            ),
            30.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'EGP ${state.product.variations[0].price.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  state.product.brandName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            20.0.height,
            if (cubit.size.isNotEmpty) ...[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Selected Size',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    'Size Chart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              20.0.height,
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.size[index],
                        style: const TextStyle(fontSize: 22,color: Colors.white),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: 10,
                  ),
                  itemCount: cubit.size.length,
                ),
              ),
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
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cubit.material[index],
                        style: const TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: 10,
                  ),
                  itemCount: cubit.material.length,
                ),
              ),
            ],
            10.0.height
          ],
        ),
      ),
    );
  }
}