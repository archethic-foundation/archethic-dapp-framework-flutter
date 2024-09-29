enum Environment {
  mainnet(
    label: 'Archethic Mainnet',
    endpoint: 'https://mainnet.archethic.net',
  ),
  testnet(
    label: 'Archethic Testnet',
    endpoint: 'https://testnet.archethic.net',
  ),
  devnet(
    label: 'Archethic Devnet',
    endpoint: 'http://localhost:4000',
  );

  const Environment({
    required this.label,
    required this.endpoint,
  });

  final String label;
  final String endpoint;

  static Environment byEndpoint(String endpoint) =>
      Environment.values.firstWhere(
        (environment) => environment.endpoint == endpoint,
      );
}
