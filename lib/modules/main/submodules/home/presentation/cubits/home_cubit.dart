import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with InitManager {
  HomeCubit() : super(const HomeState());

  @override
  void init() {}

  void onCardTap(value) {}

  void onAddTap(Product value) {}
}