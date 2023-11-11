import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/product.dart';

part 'category_detail_state.dart';

class CategoryDetailCubit extends Cubit<CategoryDetailState> {
  CategoryDetailCubit({
    required this.category,
  }) : super(
          const CategoryDetailState(),
        );

  final Category category;

  void onInit() {
    emit(
      state.copyWith(
        category: category,
      ),
    );
    _getProducts();
  }

  Future<void> _getProducts() async {
    emit(
      state.copyWith(
        products: [
          Product(
            id: 'id',
            title: 'Marmita de carne',
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de peixe',
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de frango',
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de carne',
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de peixe',
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de frango',
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de carne',
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de peixe',
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: 'id',
            title: 'Marmita de frango',
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
        ],
      ),
    );
  }

  void onProductTap(Product product) {}

  void onCardTap(Product value) {}

  void onAddTap(Product value) {}
}
