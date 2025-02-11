import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mencoba/boxes.dart';
import 'package:mencoba/model/transaction.dart';


class UpdateScreen extends StatefulWidget {
  final int index;
  final Transaction transaction;
  const UpdateScreen({super.key, required this.index, required this.transaction});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _namaController = TextEditingController();
  late TextEditingController _totalController = TextEditingController();
  bool? _isPemasukan;

  @override
  void initState(){
    super.initState();
    _namaController = TextEditingController(text: widget.transaction.nama);
    _totalController = TextEditingController(text: widget.transaction.total.toString());
    _isPemasukan = widget.transaction.isPemasukan;
  }

  @override
  void dispose() {
    _namaController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  void _updateTransaction() async {
    String nama = _namaController.text.trim();
    String totalText = _totalController.text.trim();
    double total = double.tryParse(totalText) ?? 0;
  

  if (nama.isEmpty || totalText.isEmpty || _isPemasukan){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('harap isi Semua data'))
    );
    return;
    }

    final box = Hive.box<Transaction>('transactions'); 
    final updatedTransaction = Transaction(
    nama: nama,
    total: total,
    isPemasukan: _isPemasukan ?? false
);

    if (widget.index >= 0 && widget.index < box.length) {
  box.putAt(widget.index, updatedTransaction);
} else {
  print("Error: Index tidak valid.");
}

    // box.putAt(widget.index, updatedTransaction);
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit',
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
              Text('Nama'), 
              TextField(controller: _namaController,),
              SizedBox(height: 20,),

              Text('Total'), 
              TextField(controller: _totalController, keyboardType: TextInputType.number,),
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
              onPressed: _updateTransaction, 
              child: Text('Simpan')
              ),
            ],

          ),
        )
      ),
    );
  }
}
