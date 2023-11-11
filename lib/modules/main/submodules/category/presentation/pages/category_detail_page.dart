import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../shared/presentation/atomic/organisms/product_card_builder_organism.dart';
import '../../category_module.dart';
import '../cubits/category_detail_cubit.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({super.key});

  static const routeName = '/category-detail';
  static const routePath = CategoryModule.routePath + routeName;

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late final CategoryDetailCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<CategoryDetailCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailCubit, CategoryDetailState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: Navigator.of(context).pop,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              state.category?.title ??
                                  'Marmitas de Frango null',
                              style: AppTextStyle.titleBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      ProductCardBuilderOrganism(
                        productList: state.products,
                        onCardTap: _cubit.onCardTap,
                        onAddTap: _cubit.onAddTap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
