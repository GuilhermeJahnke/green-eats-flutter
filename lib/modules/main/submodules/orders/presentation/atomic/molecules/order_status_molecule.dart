import 'package:flutter/material.dart';

import '../../../../../../shared/configs/constants/app_text_style.dart';
import '../../../../../../shared/domain/entities/order.dart';
import '../../entities/order_status_extension.dart';

class OrderStatusMolecule extends StatelessWidget {
  const OrderStatusMolecule({
    super.key,
    required this.orderNumber,
    required this.status,
  });

  final String orderNumber;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '#$orderNumber',
          style: AppTextStyle.subtitleBold,
        ),
        Container(
          decoration: BoxDecoration(
            color: status.color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              status.text,
              style: AppTextStyle.bodyBold.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
