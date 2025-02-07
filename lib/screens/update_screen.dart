import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  final int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update',
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
            children: [Text('Nama'), TextField(),SizedBox(height: 20,),
            Text('Tipe Tramsaksi'),
            ListTile(
              title: Text('Pemasukan'),
            leading: 
            Radio(groupValue: _value,  value: 1, onChanged: (value) {})
            ),
            ListTile(
              title: Text('Pemasukan'),
            leading: 
            Radio(groupValue: _value,  value: 2, onChanged: (value) {})
            ),
            Text('Total'), TextField(),SizedBox(height: 20,),
            ElevatedButton(onPressed: () {}, child: Text('Simpan'))
            ],
          ),
        )
      ),
    );
  }
}