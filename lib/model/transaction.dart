import 'package:hive/hive.dart';
part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject{
  @HiveField(0)
  late String nama;

  @HiveField(1)
  late double total;

  @HiveField(2)
  late bool isPemasukan = true;
}