import 'package:flutter/material.dart';
import 'package:mencoba/screens/create_screen.dart';
import 'package:mencoba/screens/update_screen.dart';

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

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {

showAlertDialog(BuildContext context) {
  Widget okButton = FloatingActionButton(
    child: Text('Ya'),
    onPressed: () {}
  );
    
      AlertDialog alertDialog = AlertDialog(
        title: Text('Peringatan !'),
        content: Text('Yakin akan menghapus?'),
        actions: [okButton]
      );

      showDialog(context: context, builder: (BuildContext context ){
        return alertDialog;
      });
}

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
        IconButton (
          icon: Icon(Icons.add),onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateScreen()));
          },),
        Padding(
          padding: EdgeInsets.only(right: 20),
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
                  
                  IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateScreen()));
                  },  icon: Icon(Icons.edit), color: Colors.grey),
                  SizedBox(width: 20),
                  
                  IconButton(onPressed: () {
                    showAlertDialog(context);
                  }, icon: Icon(Icons.delete, color: Colors.red))

                  ]
              )
            ),
          ]
        )
          ),
    );
  }
}