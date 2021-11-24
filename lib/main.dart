import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product/page/home_page/home.dart';

void main (){
  runApp(const MyApp());

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(barTitle: 'Products',),
    );
  }
}
