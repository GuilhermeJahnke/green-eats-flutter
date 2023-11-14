import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/order.dart';
import '../../../../../../shared/utils/utils.dart';
import 'order_status_molecule.dart';

class OrderMolecule extends StatelessWidget {
  const OrderMolecule({
    super.key,
    required this.photoUrl,
    required this.orderNumber,
    required this.totalValue,
    required this.quantity,
    required this.date,
    required this.status,
  });

  final String photoUrl;
  final String orderNumber;
  final double totalValue;
  final int quantity;
  final DateTime date;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Utils.autoDetectImage(photoUrl),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderStatusMolecule(
                    orderNumber: orderNumber,
                    status: status,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    Utils.formatCurrency(totalValue),
                    style: AppTextStyle.subtitleBold,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '$quantity items',
                    style:
                        AppTextStyle.subtitleBold.copyWith(color: Colors.green),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    Utils.formatDate(date),
                    style: AppTextStyle.bodyBold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}