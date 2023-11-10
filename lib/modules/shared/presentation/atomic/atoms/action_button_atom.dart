import 'package:flutter/material.dart';

import '../../../configs/constants/app_colors.dart';

class ActionButtonAtom extends StatelessWidget {
  const ActionButtonAtom({
    super.key,
    required this.onAddTap,
    required this.icon,
  });

  const ActionButtonAtom.add({
    required this.onAddTap,
  }) : icon = Icons.add;

  const ActionButtonAtom.remove({
    required this.onAddTap,
  }) : icon = Icons.remove;

  final VoidCallback onAddTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
