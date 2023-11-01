import 'package:get/get.dart';

import 'controllers/list_currencies_contoller.dart';

class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<ListCurrenciesController>(() => ListCurrenciesController());
    //Get.lazyPut<ThemeController>(() => ThemeController());
  }

}