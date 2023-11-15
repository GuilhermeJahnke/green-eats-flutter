import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';

abstract class SendOrderUsecase {
  Future<Either<Failure, void>> call(List<Product> products);
}
