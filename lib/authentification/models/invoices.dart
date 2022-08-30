class Invoice {
  DateTime? invoiceDate;
  String? id;

  Invoice({this.invoiceDate, this.id});

  Invoice.fromJson(Map<String, dynamic> json) {
    invoiceDate = DateTime.parse(json['invoiceDate']);
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoiceDate'] = invoiceDate;
    data['_id'] = id;
    return data;
  }

  @override
  String toString() {
    return '{invoiceDate: $invoiceDate '
        'id: $id';
  }
}
