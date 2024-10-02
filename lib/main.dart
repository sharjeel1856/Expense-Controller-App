import 'package:expence_controller/Home_Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Catagorey/catagorey.dart';
import 'Controller/Controller.dart';
import 'Model/Model.dart';
import 'ViewAll/ViewAll.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(TransactionModelAdapter()); // Register the adapter
  Get.put(TransactionController()); // Initialize the controller
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const home_screen(),
      getPages: [
        GetPage(name: '/', page: () => const home_screen()),
        GetPage(name: '/AddInfo', page: () => const Category()),
        GetPage(name: '/ViewData', page: () => const Viewall()),
      ],
    );
  }
}
