import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/category.dart';
import '../../../../../../shared/domain/entities/product.dart';
import '../../../../../../shared/presentation/atomic/molecules/text_field_molecule.dart';
import '../../../../../../shared/presentation/atomic/organisms/card_effects_organism.dart';
import '../../../../../../shared/presentation/atomic/organisms/product_card_builder_organism.dart';
import '../molecules/saudation_app_bar_molecule.dart';
import '../molecules/section_title_molecule.dart';
import '../organisms/category_builder_organism.dart';

class HomePageTemplate extends StatelessWidget {
  const HomePageTemplate({
    super.key,
    required this.onSearchChanged,
    required this.onDiscountCardTap,
    required this.onCategoryTap,
    required this.onAddTap,
    required this.onCardTap,
    required this.onSeeMoreCategoryTap,
    required this.discountProducts,
    required this.categories,
    required this.products,
  });

  final ValueSetter<String?> onSearchChanged;
  final ValueSetter<Product> onDiscountCardTap;
  final ValueSetter<Category> onCategoryTap;
  final ValueSetter<Product> onAddTap;
  final ValueSetter<Product> onCardTap;
  final VoidCallback onSeeMoreCategoryTap;
  final List<Product> discountProducts;
  final List<Category> categories;
  final List<Product> products;

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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SaudationAppBarMolecule(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldMolecule(
                    type: TextFieldType.search,
                    label: 'Pesquisar categoria',
                    onChanged: onSearchChanged,
                  ),
                ),
                const SizedBox(height: 20),
                DiscountProductsOrganism(
                  itemsList: discountProducts,
                  onCardTap: onDiscountCardTap,
                ),
                const SizedBox(height: 20),
                SectionTitleMolecule(
                  title: 'Categorias',
                  onSeeMoreTap: onSeeMoreCategoryTap,
                ),
                const SizedBox(height: 20),
                CategoryBuilderOrganism(
                  categoryList: categories,
                  onCardTap: onCategoryTap,
                ),
                const SizedBox(height: 20),
                const SectionTitleMolecule(
                  title: 'Mais vendidos',
                  showSeeMore: false,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProductCardBuilderOrganism(
                    productList: products,
                    onCardTap: onCardTap,
                    onAddTap: onAddTap,
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
