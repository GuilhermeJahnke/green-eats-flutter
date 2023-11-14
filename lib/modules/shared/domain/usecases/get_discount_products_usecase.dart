import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../errors/failures/failure.dart';

abstract class GetDiscountProductsUsecase {
  Future<Either<Failure, List<Product>>> getDiscountProducts();
}
