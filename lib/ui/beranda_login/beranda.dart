import 'package:flutter/material.dart';
import 'package:klinik_app/widget/sidebar.dart';   
  
class Beranda extends StatelessWidget {   
  const Beranda({super.key});   

  @override   
  Widget build(BuildContext context) {   
    return Scaffold( 
      drawer: Sidebar(),  
      appBar: AppBar(
        title: Text("Beranda"),
        backgroundColor: Colors.blueAccent,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      body: Center(   
        child: Text("Selamat Datang"),   
      ),   
    );   
  }   
}