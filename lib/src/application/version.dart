/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/src/l10n/localizations-ae-dapp-framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'version.g.dart';

@riverpod
Future<String> versionString(
  Ref ref,
  AppLocalizations localizations,
) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${localizations.aedappfm_version} ${packageInfo.version} - ${localizations.aedappfm_build} ${packageInfo.buildNumber}';
}
