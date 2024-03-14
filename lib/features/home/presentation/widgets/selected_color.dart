import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({
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
            cubit.chooseColor(index);
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: cubit.currentColor==index? Colors.yellowAccent:Colors.black,
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(int.parse('0xFF${cubit.colors[index]}')),
                  shape: BoxShape.circle),
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