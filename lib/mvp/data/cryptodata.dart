

class CryptoData{
  String name;
  double price;
  double perChange;
  CryptoData(this.name,this.price,this.perChange);

}

abstract class CryptoRepository{
  Future<List<CryptoData>> fetchCurrencies();
}

class FetchDataException implements Exception{
  final message;
  FetchDataException(this.message);

}