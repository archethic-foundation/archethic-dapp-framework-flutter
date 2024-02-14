/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart'
    as aedappfm;
import 'package:archethic_dapp_framework_flutter/src/l10n/localizations-ae-dapp-framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonClose extends ConsumerWidget {
  const ButtonClose({
    required this.onPressed,
    super.key,
    this.background = const Color(0xFF3D1D63),
  });

  final VoidCallback onPressed;
  final Color background;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return aedappfm.AppButton(
      background: background,
      labelBtn: AppLocalizations.of(context)!.aedappfm_btn_close,
      onPressed: onPressed,
    );
  }
}
