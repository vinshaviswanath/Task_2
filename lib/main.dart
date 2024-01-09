import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/controller/controller.dart';
import 'package:task2/views/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=>homescreencontroller(),
  
        ),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: view(),
      ),
    );
  }
}
