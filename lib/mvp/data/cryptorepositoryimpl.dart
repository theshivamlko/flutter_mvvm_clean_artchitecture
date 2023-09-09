import 'cryptodata.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  @override
  Future<List<CryptoData>> fetchCurrencies() async{
    await Future.delayed(Duration(seconds: 2));
    return Future.value(currencies);
  }
}

var currencies = <CryptoData>[
  CryptoData("Bitcoin", 3000, 2),
  CryptoData("Ethereum", 1000, -0.2),
  CryptoData("Ripple", 2, 0.5),
];
