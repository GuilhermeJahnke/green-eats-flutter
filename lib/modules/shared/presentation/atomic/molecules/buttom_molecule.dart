import 'package:flutter/material.dart';

enum Buttontype { filled, outlined }

class ButtomMolecule extends StatefulWidget {
  const ButtomMolecule({
    super.key,
    required this.type,
    required this.title,
    this.backgroundColor,
    required this.onTap,
    this.isLoading = false,
    this.isEnabled = true,
    this.textStyle,
  });

  final Buttontype type;
  final String title;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isEnabled;
  final TextStyle? textStyle;

  @override
  State<ButtomMolecule> createState() => _ButtomMoleculeState();
}

class _ButtomMoleculeState extends State<ButtomMolecule> {
  Border? getBorder() {
    if (!widget.isEnabled) {
      return Border.all(
        color: Colors.grey,
      );
    }

    if (widget.type == Buttontype.outlined) {
      return Border.all(
        color: Colors.grey,
      );
    }

    return null;
  }

  Color? getColor() {
    if (!widget.isEnabled) {
      return Colors.grey;
    }

    if (widget.type == Buttontype.filled) {
      return widget.backgroundColor ?? Colors.green;
    }

    return null;
  }

  TextStyle getTextStyle() {
    if (widget.type == Buttontype.outlined) {
      return widget.textStyle ?? const TextStyle(color: Colors.black);
    }

    return widget.textStyle ?? const TextStyle(color: Colors.white);
  }

  VoidCallback? getOnTap() {
    if (widget.isEnabled) {
      return widget.onTap;
    }

    return null;
  }

  Widget getWidget() {
    if (widget.isLoading) {
      return const CircularProgressIndicator();
    }

    return Center(
      child: Text(
        widget.title,
        style: getTextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getOnTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: getBorder(),
          borderRadius: BorderRadius.circular(20),
          color: getColor(),
        ),
        child: Center(
          child: getWidget(),
        ),
      ),
    );
  }
}
