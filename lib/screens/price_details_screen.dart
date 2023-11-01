
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';


import '../components/pais_cotacao.dart';
import '../models/cotacao_model.dart';

class PriceDetails extends StatefulWidget {
  late final Cotacao cotacao;
  PriceDetails({required this.cotacao}) : super();

  // PriceDetails({required Cotacao cotacao});

  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {

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
                PaisCotacao(image: 'assets/imagens-moedas/${widget.cotacao.symbol}.png',width: 250.0),
                SizedBox(height: 30.0,),
                Card(
                  child:
                    Column(
                      children: [
                        ListTile(
                          title: Text("Compra"),
                          leading: Text(widget.cotacao.symbol),
                          trailing: Text(Money.fromNum(widget.cotacao.buy,code:widget.cotacao.symbol).toString()),
                        ),
                        ListTile(
                          title: Text("Venda"),
                          leading: Text(widget.cotacao.symbol),
                          trailing: Text(Money.fromNum(widget.cotacao.sell,code:widget.cotacao.symbol).toString()),
                        ),
                      ],
                    ),
                )
              ],
            ),

        ));
  }
}
