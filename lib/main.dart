import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/content_page.dart';
import 'package:getx_app/my_detail_page.dart';
import 'package:getx_app/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MyHomePage()),
        GetPage(name: "/detail", page: () => DetailPage()),
        ],
    );
  }
}
