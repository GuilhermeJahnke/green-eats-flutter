import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/shared_navigator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.sharedNavigator,
  }) : super(const SplashState());

  final SharedNavigator sharedNavigator;

  final splashScreenTime = const Duration(seconds: 2);

  Future<void> onInit() async {
    await Future<void>.delayed(splashScreenTime);
    // sharedNavigator.goToHome();
  }
}
