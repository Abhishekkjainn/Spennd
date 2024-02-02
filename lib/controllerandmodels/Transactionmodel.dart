// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModal {
  String Tname;
  double Tamount;
  String TNote;
  String Tdate;
  String Ttime;
  bool isIncome;
  TransactionModal({
    required this.Tname,
    required this.Tamount,
    required this.TNote,
    required this.Tdate,
    required this.Ttime,
    required this.isIncome,
  });
  Map<String, dynamic> toJson() {
    return {
      'Tname': Tname,
      'Tamount': Tamount,
      'TNote': TNote,
      'Tdate': Tdate,
      'Ttime': Ttime,
      'isIncome': isIncome,
    };
  }

  factory TransactionModal.fromJson(Map<String, dynamic> json) {
    return TransactionModal(
        Tname: json['Tname'],
        Tamount: json['Tamount'],
        TNote: json['TNote'],
        Tdate: json['Tdate'],
        Ttime: json['Ttime'],
        isIncome: json['isIncome']);
  }
}
