/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/application/oracle/provider.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/components/icon_button_animated.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/generic/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ArchethicOracleUco extends ConsumerWidget {
  const ArchethicOracleUco({
    required this.faqLink,
    super.key,
  });

  final String faqLink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archethicOracleUCO =
        ref.watch(ArchethicOracleUCOProviders.archethicOracleUCO);
    if (archethicOracleUCO.usd == 0) {
      return const SizedBox.shrink();
    }
    final timestamp = DateFormat.yMd(
      Localizations.localeOf(context).languageCode,
    ).add_Hm().format(
          DateTime.fromMillisecondsSinceEpoch(
            archethicOracleUCO.timestamp * 1000,
          ).toLocal(),
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButtonAnimated(
          icon: const Icon(
            Icons.help,
            size: 16,
          ),
          onPressed: () {
            launchUrl(Uri.parse(faqLink));
          },
          color: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectableText(
              '1 UCO = \$${archethicOracleUCO.usd.formatNumber(precision: 2)} ($timestamp)',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
