/// SPDX-License-Identifier: AGPL-3.0-or-later

abstract class VerifiedTokensRepositoryInterface {
  Future<List<String>> getVerifiedTokens();

  Future<bool> isVerifiedToken(
    String address,
    List<String> verifiedTokensList,
  );
}
