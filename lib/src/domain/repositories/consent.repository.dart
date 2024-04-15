/// SPDX-License-Identifier: AGPL-3.0-or-later

abstract class ConsentRepository {
  Future<void> addAddress(String v);

  Future<DateTime?> getConsentTime(String v);
}
