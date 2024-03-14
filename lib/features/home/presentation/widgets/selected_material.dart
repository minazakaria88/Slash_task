import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class SelectedMaterial extends StatelessWidget {
  const SelectedMaterial({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            cubit.chooseMaterial(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: cubit.currentMaterial==index? Colors.pink:Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cubit.material[index],
                style:
                const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Container(
          width: 10,
        ),
        itemCount: cubit.material.length,
      ),
    );
  }
}