import 'dart:convert';
import 'package:cotacao_moedas/models/post_model.dart';
import 'package:http/http.dart' as http;
import '../models/lis_currencies_model.dart';

class CotacaoService{
  String url = "https://blockchain.info/ticker";
  dynamic _response;
  CotacaoService(){
    _response="";
  }

  Future<ListCurrencies> fetchListCurrencies() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return  ListCurrencies.fromJson(retorno);
    } else {
      throw Exception('Failed to load cote');
    }
  }


  Future<dynamic> fetchPostModel(PostModel objeto) async {
    _response = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: json.encode(objeto.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return PostModel.fromJson(retorno) ;
    } else {
      return false;
    }
  }


}







