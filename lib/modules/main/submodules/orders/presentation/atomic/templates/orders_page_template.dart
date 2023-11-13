import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_assets.dart';
import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/order.dart';
import '../../../../../../shared/utils/utils.dart';
import '../../../../home/presentation/atomic/molecules/section_title_molecule.dart';
import '../organisms/orders_builder_organism.dart';

class OrdersPageTemplate extends StatelessWidget {
  const OrdersPageTemplate({
    super.key,
    required this.orders,
  });

  final List<Order> orders;

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
                  title: 'Meus Pedidos',
                  showSeeMore: false,
                  titleTextStyle: AppTextStyle.titleBold,
                ),
                const SizedBox(height: 20.0),
                Visibility(
                  visible: orders.isEmpty,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Utils.autoDetectImage(AppAssets.emptyOrders),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Nenhum pedido encontrado',
                          style: AppTextStyle.titleBold,
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Parece que você ainda não fez nenhum pedido',
                          style: AppTextStyle.subtitleRegular,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                OrdersBuilderOrganism(orders: orders),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
