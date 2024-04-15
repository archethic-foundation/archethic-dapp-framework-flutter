/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:hive/hive.dart';

class HiveConsentDatasource {
  HiveConsentDatasource._(this._box);

  static const String _consentBox = 'consentBox';
  final Box<dynamic> _box;

  static const String hashAddresses = 'archethic_consent_hash_addresses';

  // This doesn't have to be a singleton.
  // We just want to make sure that the box is open, before we start getting/setting objects on it
  static Future<HiveConsentDatasource> getInstance() async {
    final box = await Hive.openBox<dynamic>(_consentBox);
    return HiveConsentDatasource._(box);
  }

  T _getValue<T>(dynamic key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);

  Future<void> addAddress(String v) async {
    if (getConsentTime(v) != null) {
      return;
    }

    final vHashed = uint8ListToHex(hash(v.toUpperCase()));
    return _setValue(
      hashAddresses,
      {
        ...getAddresses() as List<String>,
        '$vHashed|${DateTime.now().millisecondsSinceEpoch}',
      }.toList(),
    );
  }

  List<dynamic> getAddresses() =>
      _getValue(hashAddresses, defaultValue: <String>[]);

  DateTime? getConsentTime(String v) {
    final vHashed = uint8ListToHex(hash(v.toUpperCase()));
    DateTime? _datetime;
    getAddresses().forEach(
      (element) {
        final parts = element.split('|');
        if (parts[0] == vHashed && int.tryParse(parts[1].toString()) != null) {
          _datetime =
              DateTime.fromMillisecondsSinceEpoch(int.tryParse(parts[1])!);
        }
      },
    );
    return _datetime;
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
