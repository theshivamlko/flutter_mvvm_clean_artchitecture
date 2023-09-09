import 'package:flutter_mvvm_clean_artchitecture/mvp/data/cryptodata.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/data/cryptorepositoryimpl.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/data/cryptorepositoryprod.dart';

enum Flavor { MOCK, PROD }

class Injector {
  Injector._internal();

  static final Injector _singleton = Injector._internal();

  static late Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector(){
    return _singleton;
  }

  CryptoRepository get getCryptoRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return CryptoRepositoryImpl();
      case Flavor.PROD:
        return CryptoRepositoryProd();
    }
  }
}
