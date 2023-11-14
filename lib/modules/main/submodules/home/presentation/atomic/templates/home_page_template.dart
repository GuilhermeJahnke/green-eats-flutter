import 'package:flutter/material.dart';

import '../../../../../../shared/domain/entities/category.dart';
import '../../../../../../shared/domain/entities/product.dart';
import '../../../../../../shared/domain/entities/user.dart';
import '../../../../../../shared/presentation/atomic/organisms/discount_products_organism.dart';
import '../../../../../../shared/presentation/atomic/organisms/product_card_builder_organism.dart';
import '../../../../../../shared/presentation/atomic/shimmers/organisms/discount_products_shimmer_organism.dart';
import '../../../../../../shared/presentation/atomic/shimmers/organisms/product_card_builder_shimmer_organism.dart';
import '../molecules/saudation_app_bar_molecule.dart';
import '../molecules/section_title_molecule.dart';
import '../molecules/shimmers/section_title_shimmer_molecule.dart';
import '../organisms/category_builder_organism.dart';
import '../organisms/shimmers/category_builder_shimmer_organism.dart';

class HomePageTemplate extends StatelessWidget {
  const HomePageTemplate({
    super.key,
    required this.user,
    required this.onSearchChanged,
    required this.onDiscountCardTap,
    required this.onCategoryTap,
    required this.onAddTap,
    required this.onCardTap,
    required this.onSeeMoreCategoryTap,
    required this.discountProducts,
    required this.categories,
    required this.products,
    required this.discountProductsIsLoading,
    required this.categoriesIsLoading,
    required this.productsIsLoading,
  });

  final User? user;
  final ValueSetter<String?> onSearchChanged;
  final ValueSetter<Product> onDiscountCardTap;
  final ValueSetter<Category> onCategoryTap;
  final ValueSetter<Product> onAddTap;
  final ValueSetter<Product> onCardTap;
  final VoidCallback onSeeMoreCategoryTap;
  final List<Product> discountProducts;
  final List<Category> categories;
  final List<Product> products;

  final bool discountProductsIsLoading;
  final bool categoriesIsLoading;
  final bool productsIsLoading;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing:
          discountProductsIsLoading || categoriesIsLoading || productsIsLoading,
      child: Scaffold(
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
                    child: SaudationAppBarMolecule(
                      user: user,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (discountProductsIsLoading)
                    const DiscountProductsShimmerOrganism()
                  else
                    DiscountProductsOrganism(
                      itemsList: discountProducts,
                      onCardTap: onDiscountCardTap,
                    ),
                  const SizedBox(height: 20),
                  if (categoriesIsLoading)
                    const SectionTitleShimmerMolecule()
                  else
                    SectionTitleMolecule(
                      title: 'Categorias',
                      onSeeMoreTap: onSeeMoreCategoryTap,
                    ),
                  const SizedBox(height: 20),
                  if (categoriesIsLoading)
                    const CategoryBuilderShimmerOrganism()
                  else
                    CategoryBuilderOrganism(
                      categoryList: categories,
                      onCardTap: onCategoryTap,
                    ),
                  const SizedBox(height: 20),
                  if (productsIsLoading)
                    const SectionTitleShimmerMolecule()
                  else
                    const SectionTitleMolecule(
                      title: 'Mais vendidos',
                      showSeeMore: false,
                    ),
                  const SizedBox(height: 20),
                  if (productsIsLoading)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ProductCardShimmerBuilderOrganism(),
                    )
                  else
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
      ),
    );
  }
}
