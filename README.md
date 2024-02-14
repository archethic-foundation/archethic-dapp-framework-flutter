# Archethic's flutter framework to create Archethic Dapps
WIP

## Arb file management

### To generate the arb file, you should:
- Generate with Flutter_Gen (command: `flutter gen-l10n`) the `AppLocalizations` and `AppLocalizationsEn` classes in the hidden folder `.dart_tool/flutter_gen/gen_l10n`. (see `/l10n.yaml` conf)
```bash
flutter gen-l10n
```

- Copy generated classes to a public folder `/lib/src/l10n` with the script `./lib/src/l10n/copy_l10n.sh`.
```bash
./lib/src/l10n/copy_l10n.sh
```

### Warning
To avoid key doublons, we recommand to suffix Archethic DApp Framework imports in the DApp project.<br/>
For example: `import 'package:archethic_dapp_framework_flutter/archethic-dapp-framework-flutter.dart as aedappfm;` 
