import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/mocks/category_mock.dart';
import '../../category_navigator.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> with InitManager {
  CategoryCubit({
    required this.navigator,
  }) : super(const CategoryState());

  final CategoryNavigator navigator;

  @override
  void init() {
    emit(
      state.copyWith(
        categories: categoriesListMock,
      ),
    );
  }

  void onCategoryTap(Category category) {
    navigator.goToCategoryDetail(
      category: category,
    );
  }
}
