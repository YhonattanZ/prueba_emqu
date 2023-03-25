import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:prueba_emqu/pages/login/login_page.dart';
import 'package:prueba_emqu/pages/home/home_page.dart';

void main() async {
  runApp(const PruebaEmqu());
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();
}

class PruebaEmqu extends StatelessWidget {
  const PruebaEmqu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          errorColor: Colors.red,
          disabledColor: Colors.grey[200],
          inputDecorationTheme: InputDecorationTheme(
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade800),
                  borderRadius: BorderRadius.circular(10)))),
      debugShowCheckedModeBanner: false,
      title: "Prueba Emqu Technologies",
      initialRoute: '/login',
      locale: const Locale('es', 'ES'),
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
      ],
      navigatorKey: Get.key,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Prueba'),
          ),
          body: const Center(
            child: Text('Prueba Emqu Technologies'),
          )),
    );
  }
}
