import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mencoba/model/transaction.dart';
import 'package:mencoba/screens/create_screen.dart';
import 'package:mencoba/screens/update_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kelola Duit',
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final Box<Transaction> box = Hive.box<Transaction>('transactions');

  void showAlertDialog(BuildContext context, int index) {
    Widget okButton = FloatingActionButton(
        child: Text('Ya'),
        onPressed: () {
          box.deleteAt(index);
          Navigator.pop(context);
        });

    AlertDialog alertDialog = AlertDialog(
        title: Text('Peringatan !'),
        content: Text('Yakin akan menghapus?'),
        actions: [okButton]);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("HOME KELOLA DUIT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          backgroundColor: Colors.grey[400],
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateScreen()));
              },

            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
            )
          ]),
          
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<Transaction> transactionsBox, _) {
            if (transactionsBox.isEmpty) {
              return Center(child: Text('Belum ada transaksi'));
            }

            return ListView.builder(
              itemCount: transactionsBox.length,
              itemBuilder: (context, index) {
                final transaction = transactionsBox.getAt(index);

                return ListTile(
                  title: Text(transaction!.nama),
                  subtitle: Text('Rp ${transaction.total.toStringAsFixed(0)}'),
                  leading: Icon(
                    Icons.attach_money,
                    color: transaction.isPemasukan ? Colors.green : Colors.red,
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UpdateScreen(transaction: transaction, index: index,),
                          ));
                        },
                        icon: Icon(Icons.edit, color: Colors.grey),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          showAlertDialog(
                              context, index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
