

import 'cotacao_model.dart';

class ListCurrencies {

  final List<Cotacao> listCurrencies;


  ListCurrencies(this.listCurrencies);


  ListCurrencies.fromJson(Map<String, dynamic> json) :
        listCurrencies = List.from(json.values).map((item) => Cotacao.fromJson(item)).toList() ;



}
