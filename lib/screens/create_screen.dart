import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mencoba/boxes.dart';
import 'package:mencoba/model/transaction.dart';


class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  bool? _isPemasukan;

  @override
  void dispose(){
    _namaController.dispose();
    _totalController.dispose();
    Hive.box('transactions').close();
    super.dispose();
  }

Future<void> _addTransaction() async {
  String nama = _namaController.text.trim();
  String totalText = _totalController.text.trim();

  if (nama.isEmpty || totalText.isEmpty || _isPemasukan == null){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('harap isi Semua data'))
    );
    return;
  } 

  double total = double.tryParse(totalText) ?? 0;

  final transaction = Transaction()
    ..nama = nama
    ..total = total
    ..isPemasukan = _isPemasukan!;

  final box = Boxes.getTransaction();
  await box.add(transaction);

  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20)
        ),
        backgroundColor: Colors.grey[400]
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama'), TextField(controller: _namaController,),
            SizedBox(height: 20,),

            Text('Total'), TextField(controller: _totalController, keyboardType: TextInputType.number,),
            SizedBox(height: 20,),

            Text('Tipe Transaksi'),

            ListTile(
              title: Text('Pemasukan'),
            leading: Radio(
              value: true,
              groupValue: _isPemasukan, onChanged: (value) {
                setState(() {
                  _isPemasukan = value as bool;
                }
                );
              }
              )
            ),
            ListTile(
              title: Text('Pengeluaran'),
            leading: 
            Radio(groupValue: _isPemasukan,  value: false, onChanged: (value) {
              setState(() {
                _isPemasukan = value as bool;
              });
            })
            ),
            ElevatedButton(
              onPressed: _addTransaction, 
              child: Text('Simpan')),
            ],

          ),
        )
      ),
    );
  }
}

