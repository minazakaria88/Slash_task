import 'package:dartz/dartz.dart';
import 'package:slash_task/core/api/dio_helper.dart';
import 'package:slash_task/core/api/end_points.dart';
import 'package:slash_task/core/error/failure.dart';
import 'package:slash_task/features/home/data/models/product.dart';
import 'package:slash_task/features/home/data/repos/home_repo.dart';

import '../models/detailed_product.dart';

class HomeRepoImpl implements HomeRepo {

  final DioHelper dioHelper;
  List<Product> product = [];
  DetailedProduct ? detailed;
  HomeRepoImpl({required this.dioHelper});

  @override
  Future<Either<Failure, List<Product>>> getAllData() async {
    try {
      var response = await dioHelper.getData(url: EndPoints.url);
      for (var i in response.data['data']) {
        product.add(Product.fromJson(i));
      }
      return Right(product);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailedProduct>> getProductData(int id)async {
    try {
      var response = await dioHelper.getData(url: '${EndPoints.url}/$id');
      detailed=DetailedProduct.fromJson(response.data['data']);
      return Right(detailed!);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
