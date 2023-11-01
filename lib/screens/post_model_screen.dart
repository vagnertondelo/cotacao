
import 'package:cotacao_moedas/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/list_currencies_contoller.dart';


class PostModelScreen extends StatefulWidget {
  @override
  _PostModelScreenState createState() => _PostModelScreenState();
}

class _PostModelScreenState extends State<PostModelScreen> {

  final _formKey = GlobalKey<FormState>();
  var controller = ListCurrenciesController.listCurrencies;
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var listCurrenciesOb;
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhes"),
         // actions: [editTheme()],
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.all(32),
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _titleController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite alguma coisa';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _bodyController,
                        decoration: const InputDecoration(
                          hintText: 'Body',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Digite alguma coisa';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            PostModel postModel = PostModel(

                                _titleController.text,
                                _bodyController.text,

                            );

                            var response = await controller.post(postModel);
                            if(response != false){

                              Get.snackbar(
                                "Sucesso",
                                "Salvo com Sucesso",
                                icon: Icon(Icons.check, color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.lightGreen,
                                colorText: Colors.white,

                              );

                            }else{
                              Get.snackbar(
                                  "Houve um erro",
                                  "Deu ruim",
                                  icon: Icon(Icons.error, color: Colors.white),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.blue,
                                  //   borderColor: Colors.blue
                                  colorText: Colors.white
                              );
                            }

                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ],
                  ),
                )
              ],
            ),

        ));
  }
}
