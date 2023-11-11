import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../shared/presentation/atomic/atoms/arrow_back_atom.dart';
import '../../../../../shared/presentation/atomic/molecules/buttom_molecule.dart';

import '../../../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import '../../cart_module.dart';
import '../atomic/molecules/empty_cart_molecule.dart';
import '../atomic/organisms/cart_builder_item_organism.dart';
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
        return Scaffold(
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20.0),
                          !Modular.to.path.contains(WrapperNavbar.routeName)
                              ? const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ArrowBackAtom(),
                                    Expanded(
                                      child: Text(
                                        'Carrinho',
                                        style: AppTextStyle.titleBold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                  ],
                                )
                              : const Center(
                                  child: Text(
                                    'Carrinho',
                                    style: AppTextStyle.titleBold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          const SizedBox(height: 40.0),
                          if (state.products.isEmpty)
                            const EmptyCartMolecule()
                          else ...[
                            CartBuilderItemOrganism(
                              products: state.products,
                              onAddQuantityTap: _cubit.onAddQuantityTap,
                              onRemoveQuantityTap: _cubit.onRemoveQuantityTap,
                            ),
                            const SizedBox(height: 90.0),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state.products.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.transparent),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      color: const Color(0x00ffffff),
                      child: ButtonMolecule(
                        type: Buttontype.filled,
                        title: 'Confirmar',
                        onTap: _cubit.onConfirmTap,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
