import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with InitManager {
  HomeCubit() : super(const HomeState());

  @override
  void init() {
    emit(
      state.copyWith(
        categories: [
          Category(
            id: "id",
            title: "Carne",
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Category(
            id: "id",
            title: "Peixe",
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Category(
            id: "id",
            title: "Frango",
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
        ],
        discountProducts: [
          Product(
            id: "id",
            title: "Marmita de carne",
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de peixe",
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de frango",
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
        ],
        products: [
          Product(
            id: "id",
            title: "Marmita de carne",
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de peixe",
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de frango",
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de carne",
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de peixe",
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de frango",
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de carne",
            price: 22,
            discount: 15,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de peixe",
            price: 29,
            discount: 25,
            imagePath:
                'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
          ),
          Product(
            id: "id",
            title: "Marmita de frango",
            price: 25,
            discount: 30,
            imagePath:
                'https://img.freepik.com/vetores-premium/ilustracao-da-caixa-de-bento-desenhada-a-mao_23-2148845283.jpg',
          ),
        ],
      ),
    );
  }

  void onCardTap(value) {}

  void onAddTap(Product value) {}

  void onSearchChanged(String? value) {}

  void onDiscountCardTap(Product value) {}

  void onCategoryTap(Category value) {}

  void onSeeMoreCategoryTap() {}

  void onSeeMoreProductTap() {}
}
