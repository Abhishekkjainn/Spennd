import 'package:get/get.dart';
import 'package:spennd/controllerandmodels/Transactionmodel.dart';
import 'package:get_storage/get_storage.dart';

class TransactionController extends GetxController {
  String Timefull = '${DateTime.now().hour} : ${DateTime.now().minute} ';

  int Time = DateTime.now().hour;
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int day = DateTime.now().day;
  String Date =
      '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}';
  String Greeting = '';
  var UserName = 'Abhishekk';
  double balance = 0;

  String GreetControl(Time) {
    if (Time > 4 && Time < 11) {
      Greeting = 'Good Morning';
    }
    if (Time > 11 && Time < 16) {
      Greeting = 'Good Afternoon';
    }
    if (Time > 16 && Time < 20) {
      Greeting = 'Good Evening';
    } else {
      Greeting = 'Hello';
    }

    return Greeting;
  }

  final String _storageKey = "transactions";
  final getStorage = GetStorage();

  @override
  void onInit() {
    if (getStorage.hasData(_storageKey)) {
      balance = getStorage.read('balance');
      UserName = (getStorage.hasData('user') ? getStorage.read('user') : '');
      final storedTransaction = getStorage.read<List<dynamic>?>(_storageKey);
      if (storedTransaction != null) {
        TransactionList.assignAll(storedTransaction
            .map((transaction) => TransactionModal.fromJson(transaction)));
        balance = getStorage.read('balance');
      }
      balance = getStorage.read('balance');
    }
    super.onInit();
  }

  void _saveTransactionToStorage() {
    getStorage.write('balance', balance);
    getStorage.write(_storageKey,
        TransactionList.map((transaction) => transaction.toJson()).toList());
  }

  List<TransactionModal> TransactionList = <TransactionModal>[].obs;

  void addTransaction(String Tname, double Tamount, String TNote, String Tdate,
      String Ttime, bool isIncome) {
    TransactionList.insert(
        0,
        TransactionModal(
            Tname: Tname,
            Tamount: Tamount,
            TNote: TNote,
            Tdate: Tdate,
            Ttime: Ttime,
            isIncome: isIncome));
    if (isIncome == true) {
      balance = balance + Tamount;
    }
    if (isIncome == false) {
      balance = balance - Tamount;
    }
    _saveTransactionToStorage();
    update();
  }

  void removeTransaction(transactionIndex) {
    if (TransactionList[transactionIndex].isIncome) {
      balance = balance - TransactionList[transactionIndex].Tamount;
    } else {
      balance = balance + TransactionList[transactionIndex].Tamount;
    }

    TransactionList.removeAt(transactionIndex);
    _saveTransactionToStorage();
    update();
  }
}
