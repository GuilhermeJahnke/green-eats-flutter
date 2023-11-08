import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void addCartCount() {
    emit(state.copyWith(cartCount: state.cartCount + 1));
  }

  void removeCartCount() {
    emit(state.copyWith(cartCount: state.cartCount - 1));
  }
}
