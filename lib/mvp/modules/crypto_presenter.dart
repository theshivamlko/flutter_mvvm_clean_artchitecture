import 'package:flutter_mvvm_clean_artchitecture/mvp/di.dart';

import '../data/cryptodata.dart';
import 'crypto_presenter.dart';
import 'crypto_presenter.dart';

abstract class CryptoListView {
  void onLoadComplete(List<CryptoData> list);

  void onLoadError(Exception exception);
}


class CryptoListPresenter{

  CryptoListView _cryptoListView;
  late CryptoRepository _cryptoRepository;


  CryptoListPresenter(this._cryptoListView){
    _cryptoRepository =Injector().getCryptoRepository;
  }

  void loadCurrencies(){
    _cryptoRepository.fetchCurrencies().then((value) {
      _cryptoListView.onLoadComplete(value);
    }).catchError((error){
      _cryptoListView.onLoadError(error);

    });
  }
}