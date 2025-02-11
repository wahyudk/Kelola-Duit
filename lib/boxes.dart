import 'package:hive/hive.dart';
import 'package:mencoba/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransaction() => Hive.box<Transaction> ('transactions');
}