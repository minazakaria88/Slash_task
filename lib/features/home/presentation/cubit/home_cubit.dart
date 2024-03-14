

import 'dart:async';

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
    detailedProduct=null;
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
        getProperty().then((value) {
          emit(
            SuccessDetailedProductDataState(
              product: products,
            ),
          );
        });
        }
    );
  }

  List<String> size=[];
  List<String> colors=[];
  List<String> material=[];
  Future getProperty()async
  {
    size=[];
    colors=[];
    material=[];
    currentMaterial=0;
    currentColor=0;currentIndex=0;
    Completer completer=Completer();
    for(var k in detailedProduct!.variations)
      {
        for(var i in k.productPropertiesValues)
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
            if(!i.value.contains('#')) {
              String s='#${i.value}';
              colors.add(s);
            }
            else {
              colors.add(i.value);
            }
            print(colors);
          }
        }
      }
    completer.complete(0);
    return completer.future;
  }

  List<bool> color=List.generate(200, (index) => false);
  void changeColor(int index)
  {
    color[index]=!color[index];
    emit(ChangeState());
  }
  int currentIndex=0;
  void chooseSize(int index)
  {
    currentIndex=index;
    emit(ChangeState());
  }
  int currentMaterial=0;
  void chooseMaterial(int index)
  {
    currentMaterial=index;
    emit(ChangeState());
  }

  int currentColor=0;
  void chooseColor(int index)
  {
     currentColor=index;
     emit(ChangeState());
  }


}
