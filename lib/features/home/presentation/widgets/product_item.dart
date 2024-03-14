import 'package:flutter/material.dart';


import 'package:slash_task/core/utils/extensions.dart';
import 'package:slash_task/features/home/data/models/product.dart';


import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:slash_task/injections.dart' as di;

import '../cubit/home_cubit.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product, required this.onPressed, required this.index,
  });
  final Function onPressed;
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                onPressed();
              },
              child: Column(
                children: [
                  Container(
                    height: context.height * 0.2,
                    width: context.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage(
                          product.productVariations[0].images[0].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  5.0.height,
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        15.0.width,
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 0.2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              AppStrings.slash,
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'EGP ${product.productVariations[0].price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  5.0.width,
                  IconButton(
                    onPressed: (){
                      di.s1<AppCubit>().changeColor(index);
                    },
                    icon:  Icon(
                      di.s1<AppCubit>().color[index]? Icons.favorite:Icons.favorite_border,
                      color: di.s1<AppCubit>().color[index]? Colors.pink:Colors.white,
                      size: 25,
                    ),
                  ),
                  5.0.width,
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                    size: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
