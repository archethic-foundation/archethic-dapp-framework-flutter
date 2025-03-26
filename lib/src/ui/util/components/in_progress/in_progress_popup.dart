import 'dart:ui';
import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/popup_close_button.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/popup_waves.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InProgressPopup {
  static Future<void> getDialog(
    BuildContext context,
    List<Widget> Function(BuildContext context, WidgetRef ref) bodyBuilder,
    PopupCloseButton Function(BuildContext context, WidgetRef ref)
        closeButtonBuilder, {
    bool useSafeArea = false,
    bool useRootNavigator = false,
    double height = 400,
  }) async {
    return showDialog<void>(
      context: context,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      builder: (context) {
        return ScaffoldMessenger(
          child: Builder(
            builder: (context) {
              return Consumer(
                builder: (context, ref, _) {
                  return Scaffold(
                    backgroundColor: Colors.transparent.withAlpha(120),
                    body: AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: Stack(
                        children: <Widget>[
                          ArchethicScrollbar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 30,
                                    right: 15,
                                    left: 8,
                                  ),
                                  height: height,
                                  width: AppThemeBase.sizeBoxComponentWidth,
                                  decoration: BoxDecoration(
                                    color: AppThemeBase.sheetBackground,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppThemeBase.sheetBorder,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          top: 300,
                                        ),
                                        child: Card(
                                          color: Colors.transparent,
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16),
                                            ),
                                          ),
                                          child: PopupWaves(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: bodyBuilder(context, ref),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: closeButtonBuilder(context, ref),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
