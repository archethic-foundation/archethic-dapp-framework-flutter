// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:ui';

import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

enum BlockInfoColor { blue, purple, green, neutral }

class BlockInfo extends ConsumerWidget {
  const BlockInfo({
    required this.info,
    this.width = 300,
    this.height = 170,
    this.blockInfoColor = BlockInfoColor.blue,
    this.backgroundWidget,
    this.bottomWidget,
    this.paddingEdgeInsetsClipRRect = const EdgeInsets.only(top: 15),
    this.paddingEdgeInsetsInfo = const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 8,
      bottom: 8,
    ),
    this.borderWith = 1.0,
    super.key,
  });

  final Widget info;
  final EdgeInsets paddingEdgeInsetsClipRRect;
  final EdgeInsets paddingEdgeInsetsInfo;
  final double width;
  final double height;
  final BlockInfoColor blockInfoColor;
  final Widget? backgroundWidget;
  final Widget? bottomWidget;
  final double borderWith;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: paddingEdgeInsetsClipRRect,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Stack(
                children: [
                  if (backgroundWidget != null) backgroundWidget!,
                  Container(
                    width: width,
                    height: height,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: blockInfoColor == BlockInfoColor.blue
                          ? LinearGradient(
                              colors: [
                                AppThemeBase.sheetBackgroundTertiary
                                    .withOpacity(0.3),
                                AppThemeBase.sheetBackgroundTertiary
                                    .withOpacity(0.3),
                              ],
                              stops: const [0, 1],
                            )
                          : blockInfoColor == BlockInfoColor.purple
                              ? LinearGradient(
                                  colors: [
                                    ArchethicThemeBase.raspberry500
                                        .withOpacity(0.5),
                                    ArchethicThemeBase.raspberry500
                                        .withOpacity(0.2),
                                  ],
                                  stops: const [0, 1],
                                )
                              : blockInfoColor == BlockInfoColor.green
                                  ? LinearGradient(
                                      colors: [
                                        ArchethicThemeBase.systemPositive300
                                            .withOpacity(0.3),
                                        ArchethicThemeBase.systemPositive600
                                            .withOpacity(0.3),
                                      ],
                                      stops: const [0, 1],
                                    )
                                  : LinearGradient(
                                      colors: [
                                        ArchethicThemeBase
                                            .paleTransparentBackground
                                            .withOpacity(0.3),
                                        ArchethicThemeBase
                                            .paleTransparentBackground
                                            .withOpacity(0.3),
                                      ],
                                      stops: const [0, 1],
                                    ),
                      border: GradientBoxBorder(
                        gradient: blockInfoColor == BlockInfoColor.blue
                            ? LinearGradient(
                                colors: [
                                  AppThemeBase.sheetBorderTertiary
                                      .withOpacity(0.4),
                                  AppThemeBase.sheetBackgroundTertiary
                                      .withOpacity(0.4),
                                ],
                                stops: const [0, 1],
                              )
                            : blockInfoColor == BlockInfoColor.purple
                                ? LinearGradient(
                                    colors: [
                                      AppThemeBase.sheetBorderSecondary
                                          .withOpacity(0.1),
                                      AppThemeBase.sheetBorderSecondary
                                          .withOpacity(0.4),
                                    ],
                                    stops: const [0, 1],
                                  )
                                : blockInfoColor == BlockInfoColor.green
                                    ? LinearGradient(
                                        colors: [
                                          ArchethicThemeBase.systemPositive100
                                              .withOpacity(0.2),
                                          ArchethicThemeBase.systemPositive300
                                              .withOpacity(0.2),
                                        ],
                                        stops: const [0, 1],
                                      )
                                    : LinearGradient(
                                        colors: [
                                          ArchethicThemeBase
                                              .paleTransparentBorder
                                              .withOpacity(0.2),
                                          ArchethicThemeBase
                                              .paleTransparentBorder
                                              .withOpacity(0.2),
                                        ],
                                        stops: const [0, 1],
                                      ),
                        width: borderWith,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: paddingEdgeInsetsInfo,
                      child: info,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (bottomWidget != null)
          SizedBox(
            width: width,
            child: bottomWidget,
          ),
      ],
    );
  }
}
