/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:ui';
import 'package:archethic_dapp_framework_flutter/src/l10n/localizations-ae-dapp-framework.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/themes/app_theme_base.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/buttons/app_button.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/icon_animated.dart';
import 'package:flutter/material.dart';

class PopupCloseButton extends StatelessWidget {
  const PopupCloseButton({
    super.key,
    this.warningCloseLabel = '',
    this.warningCloseFunction,
    this.warningCloseWarning = false,
    this.closeFunction,
  });

  final bool warningCloseWarning;
  final String warningCloseLabel;
  final Function? warningCloseFunction;
  final Function? closeFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () async {
          if (warningCloseWarning == false) {
            if (closeFunction != null) {
              await closeFunction!();
            } else {
              if (!context.mounted) return;
              Navigator.of(context).pop();
            }
            return;
          }

          return showDialog(
            context: context,
            builder: (context) {
              return ScaffoldMessenger(
                child: Builder(
                  builder: (context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: AlertDialog(
                          backgroundColor: AppThemeBase.sheetBackground,
                          contentPadding: const EdgeInsets.only(
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                              color: AppThemeBase.sheetBorder,
                            ),
                          ),
                          content: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SelectableText(
                                    AppLocalizations.of(context)!
                                        .aedappfm_confirmationPopupTitle,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SelectableText(
                                    warningCloseLabel,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppButton(
                                        labelBtn: AppLocalizations.of(context)!
                                            .aedappfm_no,
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      AppButton(
                                        labelBtn: AppLocalizations.of(context)!
                                            .aedappfm_yes,
                                        onPressed: () async {
                                          if (warningCloseFunction != null) {
                                            await warningCloseFunction!();
                                          }

                                          if (!context.mounted) return;
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppThemeBase.backgroundPopupColor,
          child: const CircleAvatar(
            foregroundColor: Colors.white,
            radius: 12,
            child: IconAnimated(
              color: Colors.white,
              icon: Icons.close,
            ),
          ),
        ),
      ),
    );
  }
}
