
import 'package:dartz/dartz.dart';
import 'package:slash_task/features/home/data/models/product.dart';

import '../../../../core/error/failure.dart';
import '../models/detailed_product.dart';

abstract class HomeRepo
{
  Future<Either<Failure,List<Product>>> getAllData();

  Future<Either<Failure,DetailedProduct>> getProductData(int id);
}