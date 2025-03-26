abstract class ConsentRepository {
  Future<void> addAddress(String v);

  Future<DateTime?> getConsentTime(String v);
}
