part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({
    this.cartCount = 0,
  });

  final int cartCount;

  @override
  List<Object?> get props => [
        cartCount,
      ];

  MainState copyWith({
    int? cartCount,
  }) {
    return MainState(
      cartCount: cartCount ?? this.cartCount,
    );
  }
}
