import 'package:flutter/material.dart';

void main() {
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

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME KELOLA DUIT", 
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20)
        ), 
      backgroundColor: Colors.grey[400],
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.add),
          )
          ]
      ),
      
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: 10),
            
            Text('Total Pemasukan : Rp 200.000'),
            SizedBox(height: 10),
            Text('Total Pengeluaran : Rp 50.000'),

            ListTile(
              title: Text('Bensin'),
              subtitle: Text('20.000'),
              leading: Icon(Icons.attach_money,
              color: Colors.blue),
              trailing: Wrap(
                children: [
                  Icon(Icons.edit, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.delete, color: Colors.red)
                  ]
              )
            ),
            
            ListTile(
              title: Text('Makan'),
              subtitle: Text('20.000'),
              leading: Icon(Icons.attach_money,
              color: Colors.blue),
              trailing: Wrap(
                children: [
                  Icon(Icons.edit, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.delete, color: Colors.red)
                  ]
              )
            ),

            ListTile(
              title: Text('Minum'),
              subtitle: Text('10.000'),
              leading: Icon(Icons.attach_money,
              color: Colors.blue),
              trailing: Wrap(
                children: [
                  Icon(Icons.edit, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.delete, color: Colors.red)
                  ]
              )
            )
          ]
        )
          ),
    );
  }
}