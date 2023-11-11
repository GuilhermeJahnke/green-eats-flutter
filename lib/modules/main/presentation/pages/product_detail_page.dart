import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/configs/constants/app_colors.dart';
import '../../../shared/configs/constants/app_text_style.dart';
import '../../../shared/presentation/atomic/atoms/arrow_back_atom.dart';
import '../../../shared/presentation/atomic/molecules/buttom_molecule.dart';
import '../../../shared/presentation/atomic/molecules/item_quantity_manager_molecule.dart';
import '../../../shared/utils/utils.dart';
import '../../main_module.dart';
import '../atomic/organisms/characteristics_builder_organism.dart';
import '../cubits/product_detail_cubit.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const routeName = '/product-detail';
  static const routePath = MainModule.routePath + routeName;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late final ProductDetailCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = Modular.get<ProductDetailCubit>();
    _cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state.product == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20.0),
                        ),
                        child: Utils.autoDetectImage(
                          state.product!.imagePath,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ArrowBackAtom(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            state.product!.title,
                            style: AppTextStyle.titleBold,
                          ),
                        ),
                        ItemQuantityManagerMolecule(
                          onAddTap: _cubit.onAddQuantityTap,
                          onRemoveTap: _cubit.onRemoveQuantityTap,
                          quantity: state.product!.quantity,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Utils.formatCurrency(state.product!.price),
                          style: AppTextStyle.titleBold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          Utils.formatWeight(state.product!.weight),
                          style: AppTextStyle.titleBold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      state.product!.description,
                      style: AppTextStyle.subtitleRegular.copyWith(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CharacteristicsCardBuilderOrganism(
                      characteristicList: state.product!.characteristics,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonMolecule(
                      type: Buttontype.filled,
                      title: 'Adicionar no carrinho',
                      onTap: _cubit.onAddCartTap,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
