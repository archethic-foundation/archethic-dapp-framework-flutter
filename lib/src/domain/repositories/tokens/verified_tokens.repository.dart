abstract class VerifiedTokensRepositoryInterface {
  Future<List<String>> getVerifiedTokens();

  bool isVerifiedToken(
    String address,
    List<String> verifiedTokensList,
  );
}
