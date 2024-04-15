import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsentToCheck extends ConsumerWidget {
  const ConsentToCheck({
    super.key,
    required this.consentChecked,
    required this.onToggleConsent,
    required this.uriTermsOfUse,
    required this.uriPrivacyPolicy,
  });

  final bool consentChecked;
  final Function(bool? newValue) onToggleConsent;
  final String uriTermsOfUse;
  final String uriPrivacyPolicy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            title: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part1,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: Responsive.fontSizeFromTextStyle(
                            context,
                            Theme.of(context).textTheme.bodyMedium!,
                          ),
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (!await canLaunchUrl(Uri.parse(uriTermsOfUse))) return;

                      await launchUrl(Uri.parse(uriTermsOfUse));
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .aedappfm_consent_to_check_part2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: Responsive.fontSizeFromTextStyle(
                              context,
                              Theme.of(context).textTheme.bodyMedium!,
                            ),
                          ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part3,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: Responsive.fontSizeFromTextStyle(
                            context,
                            Theme.of(context).textTheme.bodyMedium!,
                          ),
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (!await canLaunchUrl(Uri.parse(uriPrivacyPolicy))) {
                        return;
                      }

                      await launchUrl(Uri.parse(uriPrivacyPolicy));
                    },
                    child: Text(
                      AppLocalizations.of(context)!
                          .aedappfm_consent_to_check_part4,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            fontSize: Responsive.fontSizeFromTextStyle(
                              context,
                              Theme.of(context).textTheme.bodyMedium!,
                            ),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 3),
                    child: Icon(
                      Iconsax.export_3,
                      size:
                          Theme.of(context).textTheme.bodyMedium!.fontSize! - 1,
                    ),
                  ),
                ],
              ),
            ),
            value: consentChecked,
            onChanged: onToggleConsent,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}

class ConsentAlready extends ConsumerWidget {
  const ConsentAlready({
    super.key,
    required this.consentDateTime,
  });

  final DateTime consentDateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 3,
                      right: 7,
                    ),
                    child: Icon(
                      Iconsax.info_circle,
                      size:
                          Theme.of(context).textTheme.bodyMedium!.fontSize! - 1,
                    ),
                  ),
                  Text(
                      '${AppLocalizations.of(context)!.aedappfm_consent_already} ${DateFormat.yMd(
                    Localizations.localeOf(context).languageCode,
                  ).add_Hm().format(consentDateTime)}'),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 3),
                    child: Icon(
                      Iconsax.export_3,
                      size:
                          Theme.of(context).textTheme.bodyMedium!.fontSize! - 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
