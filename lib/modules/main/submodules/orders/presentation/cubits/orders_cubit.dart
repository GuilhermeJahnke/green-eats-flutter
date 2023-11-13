import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/order.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> with InitManager {
  OrdersCubit() : super(const OrdersState());

  @override
  void init() {}
}
