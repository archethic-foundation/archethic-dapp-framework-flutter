import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart'
    as aedappfm;
import 'package:flutter/material.dart';
import 'package:lit_starfield/view.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    required this.backgroundImage,
    this.withAnimation = false,
    super.key,
  });

  final bool withAnimation;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                aedappfm.ArchethicThemeBase.purple500.withOpacity(1),
                BlendMode.modulate,
              ),
              image: AssetImage(
                backgroundImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (withAnimation)
          Opacity(
            opacity: 0.8,
            child: LitStarfieldContainer(
              velocity: 0.2,
              number: 200,
              starColor: aedappfm.ArchethicThemeBase.neutral0,
              scale: 3,
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
        if (withAnimation)
          Opacity(
            opacity: 0.3,
            child: LitStarfieldContainer(
              velocity: 0.5,
              number: 100,
              scale: 10,
              starColor: aedappfm.ArchethicThemeBase.blue600,
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
      ],
    );
  }
}
