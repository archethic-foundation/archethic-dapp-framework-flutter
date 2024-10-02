import 'package:archethic_dapp_framework_flutter/src/l10n/localizations-ae-dapp-framework.dart';
import 'package:archethic_dapp_framework_flutter/src/ui/util/iconsax.dart';
import 'package:flutter/gestures.dart';
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
    this.textStyle,
  });

  final bool consentChecked;
  final Function(bool? newValue) onToggleConsent;
  final String uriTermsOfUse;
  final String uriPrivacyPolicy;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultStyle = textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    final linkStyle = defaultStyle.copyWith(
      decoration: TextDecoration.underline,
    );

    return Row(
      children: [
        Expanded(
          child: CheckboxListTile(
            title: RichText(
              text: TextSpan(
                style: defaultStyle,
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part1,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part2,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunchUrl(Uri.parse(uriTermsOfUse))) {
                          await launchUrl(Uri.parse(uriTermsOfUse));
                        }
                      },
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part3,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_to_check_part4,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunchUrl(Uri.parse(uriPrivacyPolicy))) {
                          await launchUrl(Uri.parse(uriPrivacyPolicy));
                        }
                      },
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
    required this.uriTermsOfUse,
    required this.uriPrivacyPolicy,
    this.textStyle,
  });

  final DateTime consentDateTime;
  final String uriTermsOfUse;
  final String uriPrivacyPolicy;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultStyle = textStyle ?? Theme.of(context).textTheme.bodyMedium!;
    final linkStyle = defaultStyle.copyWith(
      decoration: TextDecoration.underline,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: defaultStyle,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 3, right: 7),
                      child: Icon(
                        Iconsax.info_circle,
                        size: defaultStyle.fontSize! - 1,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_already_part1,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_already_part2,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunchUrl(Uri.parse(uriTermsOfUse))) {
                          await launchUrl(Uri.parse(uriTermsOfUse));
                        }
                      },
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_already_part3,
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_already_part4,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunchUrl(Uri.parse(uriPrivacyPolicy))) {
                          await launchUrl(Uri.parse(uriPrivacyPolicy));
                        }
                      },
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .aedappfm_consent_already_part5,
                  ),
                  TextSpan(
                    text: DateFormat.yMd(
                      Localizations.localeOf(context).languageCode,
                    ).add_Hm().format(consentDateTime),
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
