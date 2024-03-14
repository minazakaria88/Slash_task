import 'package:slash_task/features/home/data/models/detailed_product.dart';

import '../../data/models/product.dart';

abstract class AppState {}
class InitState extends AppState{}

class LoadingAllDataState extends AppState{}
class SuccessAllDataState extends AppState{

}
class ErrorAllDataState extends AppState{
  final String error;

  ErrorAllDataState({required this.error});
}

class LoadingDetailedProductDataState extends AppState{}

class SuccessDetailedProductDataState extends AppState{
  final DetailedProduct product;
  SuccessDetailedProductDataState({required this.product});
}
class ErrorDetailedProductDataState extends AppState{
  final String error;
  ErrorDetailedProductDataState({required this.error});
}
class ChangeState extends AppState{}
