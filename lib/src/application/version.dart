/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final versionStringProvider = FutureProvider.autoDispose
    .family<String, AppLocalizations>((ref, localizations) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return '${localizations.aedappfm_version} ${packageInfo.version} - ${localizations.aedappfm_build} ${packageInfo.buildNumber}';
});
