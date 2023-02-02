import '../../seller.dart';

class Transaction {
  final Seller seller;
  final String time;

  Transaction(this.seller, this.time);

  static final List<Transaction> _transactions = [
    Transaction(Seller.sellers1[0], "21 Jan, 2022, 10:41 am"),
    Transaction(Seller.sellers1[1], "21 Jan, 2022, 09:23 am"),
    Transaction(Seller.sellers1[2], "20 Jan, 2022, 11:46 pm"),
    Transaction(Seller.sellers1[3], "20 Jan, 2022, 10:19 pm"),
    Transaction(Seller.sellers1[4], "20 Jan, 2022, 08:07 am"),
    Transaction(Seller.sellers1[5], "20 Jan, 2022, 06:34 am"),
  ];

  static List<Transaction> get list => _transactions;
}
