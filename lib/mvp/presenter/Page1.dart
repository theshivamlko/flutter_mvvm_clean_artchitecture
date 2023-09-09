import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/data/cryptodata.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvp/modules/crypto_presenter.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> implements CryptoListView {
  late CryptoListPresenter cryptoListPresenter;

  List<CryptoData> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cryptoListPresenter = CryptoListPresenter(this);
    cryptoListPresenter.loadCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "${list[index].name} ${list[index].price} ${list[index].perChange}",
                style: TextStyle(fontSize: 18),),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void loadCurrencies() {}

  @override
  void onLoadComplete(List<CryptoData> list) {
    print("onLoadComplete");
   setState(() {
     this.list=list;
   });
  }

  @override
  void onLoadError(Exception exception) {
    // TODO: implement onLoadError
  }
}
