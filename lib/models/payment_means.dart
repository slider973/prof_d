class PaymentMeans {
  PaymentMeans({
    String? cash,
    String? check,
    String? creditCard,}){
    _cash = cash;
    _check = check;
    _creditCard = creditCard;
  }

  PaymentMeans.fromJson(dynamic json) {
    _cash = json['cash'];
    _check = json['check'];
    _creditCard = json['credit_card'];
  }
  String? _cash;
  String? _check;
  String? _creditCard;

  String? get cash => _cash;
  String? get check => _check;
  String? get creditCard => _creditCard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cash'] = _cash;
    map['check'] = _check;
    map['credit_card'] = _creditCard;
    return map;
  }

}