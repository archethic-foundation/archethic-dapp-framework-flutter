import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:flutter/material.dart';

class BlackBoxInfo extends StatelessWidget {
  const BlackBoxInfo({
    super.key,
    required this.textWidget,
    required this.additionalWidget,
    this.onTap,
  });

  final Widget textWidget;
  final Widget additionalWidget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: ArchethicThemeBase.purple800.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Column(
          children: [
            textWidget,
            const SizedBox(height: 5),
            additionalWidget,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
