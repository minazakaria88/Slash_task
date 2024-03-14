

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/features/home/data/models/detailed_product.dart';
import 'package:slash_task/features/home/data/repos/home_repo.dart';
import 'package:slash_task/features/home/presentation/cubit/home_state.dart';

import '../../data/models/product.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.homeRepo}) : super(InitState());

  final HomeRepo homeRepo;
  List<Product> product = [];
  void getProductsData() async {
    emit(LoadingAllDataState());
    var result = await homeRepo.getAllData();
    result.fold(
        (failure) => emit(
              ErrorAllDataState(
                error: failure.errorMsg,
              ),
            ), (products) {
          product=products;
      emit(SuccessAllDataState());
    });
  }


  DetailedProduct ? detailedProduct;
  void getDetailedProductData(int id) async {
    emit(LoadingDetailedProductDataState());
    var result = await homeRepo.getProductData(id);
    result.fold(
      (failure) => emit(
        ErrorDetailedProductDataState(
          error: failure.errorMsg,
        ),
      ),
      (products) {
        detailedProduct=products;
        getProperty();
        emit(
        SuccessDetailedProductDataState(
          product: products,
        ),
      );}
    );
  }

  List<String> size=[];
  List<String> colors=[];
  List<String> material=[];
  void getProperty()
  {
    for(var i in detailedProduct!.variations[0].productPropertiesValues)
      {
          if(i.property=='Size')
            {
              size.add(i.value);
            }
          else if(i.property=='Materials')
            {
              material.add(i.value);
            }
          else
            {
              colors.add(i.value);
            }
      }
  }

  List<bool> color=List.generate(20, (index) => false);
  void changeColor(int index)
  {
    color[index]=!color[index];
    emit(ChangeState());
  }


}
