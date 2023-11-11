import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
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
        categories: const [
          Category(
            id: 'id',
            title: 'Marmita de carne',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de peixe',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de frango',
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de carne',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de peixe',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de frango',
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de carne',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de peixe',
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Category(
            id: 'id',
            title: 'Marmita de frango',
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
        ],
      ),
    );
  }

  void onCategoryTap(Category category) {
    navigator.goToCategoryDetail(
      category: category,
    );
  }
}
