import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/category.dart';
import '../../../../home/presentation/atomic/molecules/section_title_molecule.dart';
import '../molecules/category_card_builder_organism.dart';

class CategoryPageTemplate extends StatelessWidget {
  const CategoryPageTemplate({
    super.key,
    required this.categoryList,
    required this.onCategoryTap,
  });

  final ValueSetter<Category> onCategoryTap;
  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                const SectionTitleMolecule(
                  title: 'Categorias',
                  showSeeMore: false,
                  titleTextStyle: AppTextStyle.titleBold,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CategoryCardBuilderOrganism(
                    categoryList: categoryList,
                    onCategoryTap: onCategoryTap,
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
