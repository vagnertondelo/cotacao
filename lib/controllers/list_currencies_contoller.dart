
import 'package:cotacao_moedas/models/post_model.dart';
import 'package:get/get.dart';

import '../models/cotacao_model.dart';
import '../services/cotacao_service.dart';


class ListCurrenciesController extends GetxController {

  CotacaoService cotacaoService = CotacaoService();

  var isLoading = false.obs;

  var listCurrenciesObs = <Cotacao>[].obs;

  static ListCurrenciesController get listCurrencies => Get.find();
  
  Future<dynamic> listCurrecies()  async {
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurrencies();
    listCurrenciesObs.value = list.listCurrencies;
    isLoading.value = false;
    update();
    return listCurrenciesObs;
  }


  Future<dynamic> post(PostModel objeto)  async {
    isLoading.value = true;
    var list = await cotacaoService.fetchPostModel(objeto);
    isLoading.value = false;
    update();
    return list;
  }


}
