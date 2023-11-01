class Cotacao {

  final double last;
  final double buy;
  final double sell;
  final String symbol;

  Cotacao(this.last, this.buy, this.sell, this.symbol); // Cotacao(this.last,


  Cotacao.fromJson(Map<String, dynamic> json) :
        last= json['last'],
        buy= json['buy'],
        sell= json['sell'],
        symbol= json['symbol'];

   Map<String, dynamic> toJson() => {
    'last': last,
    'buy': buy,
    };

}
