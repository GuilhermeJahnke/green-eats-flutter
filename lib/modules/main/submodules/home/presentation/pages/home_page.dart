import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../../../shared/presentation/atomic/organisms/card_effects_organism.dart';
import '../../../../../shared/presentation/atomic/organisms/product_card_builder_organism.dart';
import '../../../../../shared/utils/utils.dart';
import '../../home_module.dart';
import '../atomic/molecules/section_title_molecule.dart';
import '../atomic/organisms/category_builder_organism.dart';
import '../cubits/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';
  static const routePath = HomeModule.routePath + routeName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = Modular.get<HomeCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 205, 211, 207),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Utils.getSaudation(),
                            style: AppTextStyle.subtitleRegular,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Amélia Barlow',
                            style: AppTextStyle.subtitleRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldMolecule(
                    type: TextFieldType.search,
                    label: 'Pesquisar categoria',
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(height: 20),
                DiscountProductsOrganism(
                  itemsList: [
                    Product(
                      id: '1254124',
                      title: 'Marmitas veganas',
                      price: 23,
                      discount: 30,
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350979.jpg',
                    ),
                    Product(
                      id: '4124123',
                      title: 'Marmitas de frango',
                      price: 23,
                      discount: 22,
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
                    ),
                    Product(
                      id: '5123',
                      title: 'marmitas de carne',
                      price: 23,
                      discount: 15,
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
                    ),
                  ],
                  onCardTap: _cubit.onCardTap,
                ),
                const SizedBox(height: 20),
                SectionTitleMolecule(
                  title: 'Categorias',
                  onSeeMoreTap: () {},
                ),
                const SizedBox(height: 20),
                CategoryBuilderOrganism(
                  categoryList: const [
                    Category(
                      id: '1254124',
                      title: 'Veganas',
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350979.jpg',
                    ),
                    Category(
                      id: '4124123',
                      title: 'Frango',
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
                    ),
                    Category(
                      id: '5123',
                      title: 'Carne',
                      imagePath:
                          'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
                    ),
                  ],
                  onCardTap: _cubit.onCardTap,
                ),
                const SizedBox(height: 20),
                SectionTitleMolecule(
                  title: 'Mais vendidos',
                  onSeeMoreTap: () {},
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProductCardBuilderOrganism(
                    productList: [
                      Product(
                        id: '1254124',
                        title: 'Marmitas veganas',
                        price: 23,
                        discount: 30,
                        imagePath:
                            'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350979.jpg',
                      ),
                      Product(
                        id: '4124123',
                        title: 'Marmitas frango',
                        price: 23,
                        discount: 22,
                        imagePath:
                            'https://img.freepik.com/vetores-gratis/ilustracao-de-comida-kawaii-desenhada-a-mao_52683-84890.jpg',
                      ),
                      Product(
                        id: '5123',
                        title: 'marmitas de carne',
                        price: 23,
                        discount: 15,
                        imagePath:
                            'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
                      ),
                    ],
                    onCardTap: _cubit.onCardTap,
                    onAddTap: _cubit.onAddTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
