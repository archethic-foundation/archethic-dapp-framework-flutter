import 'package:flutter/material.dart';

class ButtonConfirmBack extends StatelessWidget {
  const ButtonConfirmBack({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SelectableText(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        BackButton(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
