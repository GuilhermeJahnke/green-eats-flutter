import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cart_module.dart';
import '../atomic/templates/cart_page_template.dart';
import '../cubits/cart_cubit.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const routeName = '/cart';
  static const routePath = CartModule.routePath + routeName;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<CartCubit>();
    _cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: _cubit,
      builder: (context, state) {
        return CartPageTemplate(
          products: state.products,
          onAddQuantityTap: _cubit.onAddQuantityTap,
          onRemoveQuantityTap: _cubit.onRemoveQuantityTap,
          onConfirmTap: _cubit.onConfirmTap,
        );
      },
    );
  }
}
