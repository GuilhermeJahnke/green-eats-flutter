import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> with InitManager {
  CategoryCubit() : super(const CategoryState());

  @override
  void init() {}
}
