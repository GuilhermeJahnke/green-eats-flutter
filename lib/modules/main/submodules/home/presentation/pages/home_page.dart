import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module.dart';
import '../atomic/templates/home_page_template.dart';
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
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      builder: (context, state) {
        return HomePageTemplate(
          onSearchChanged: _cubit.onSearchChanged,
          onDiscountCardTap: _cubit.onDiscountCardTap,
          onCategoryTap: _cubit.onCategoryTap,
          onAddTap: _cubit.onAddTap,
          onCardTap: _cubit.onCardTap,
          onSeeMoreCategoryTap: _cubit.onSeeMoreCategoryTap,
          onSeeMoreProductTap: _cubit.onSeeMoreProductTap,
          discountProducts: state.discountProducts,
          categories: state.categories,
          products: state.products,
        );
      },
    );
  }
}
