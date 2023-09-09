import 'cryptodata.dart';

class CryptoRepositoryProd implements CryptoRepository {
  @override
  Future<List<CryptoData>> fetchCurrencies() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(currencies);
  }
}

var currencies = <CryptoData>[
  CryptoData("Ripple", 2, 0.5),
  CryptoData("SHIBA", 3000, 2),
  CryptoData("DODGE", 1000, -0.2),
];
