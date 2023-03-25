import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:intl/intl.dart';

import 'package:prueba_emqu/services/demo_ads.dart';
import 'package:prueba_emqu/services/notifications_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
//Inicializamos el controlador para que cada vez que se use, se realicen metodos especificos
  HomePageController() {
    RequestConfiguration configuration =
        RequestConfiguration(testDeviceIds: testDeviceIds);

    MobileAds.instance.updateRequestConfiguration(configuration);

    //Load Banner Ad
    bannerAd.load();
  }
  final username = Get.arguments['user'];
  final profileImage = Get.arguments['image'];
  //Indice de las graficas mostradas
  int indexGraphics = 0;

  NotificationService? notificationService;
//Boolean para chequear si el anuncio esta listo
  bool isBannerAdReady = false;
//Boolean para chequear si el boton esta disponible o no
  List<bool> bools = [false, false, false, false, false, false, false];

  void enabledMonday() {
    bools[1] = bools[1] == false;
    bools[2] = bools[2] == false;
    bools[3] = bools[3] == false;
    bools[4] = bools[4] == false;
    bools[5] = bools[5] == false;
    bools[6] = bools[6] == false;
  }

  void enabledTuesday() {
    bools[0] = bools[0] == false;
    bools[2] = bools[2] == false;
    bools[3] = bools[3] == false;
    bools[4] = bools[4] == false;
    bools[5] = bools[5] == false;
    bools[6] = bools[6] == false;
  }

  void enabledWednesday() {
    bools[0] = bools[0] == false;
    bools[1] = bools[1] == false;
    bools[3] = bools[3] == false;
    bools[4] = bools[4] == false;
    bools[5] = bools[5] == false;
    bools[6] = bools[6] == false;
  }

  void enabledThrusday() {
    bools[0] = bools[0] == false;
    bools[1] = bools[1] == false;
    bools[2] = bools[2] == false;
    bools[4] = bools[4] == false;
    bools[5] = bools[5] == false;
    bools[6] = bools[6] == false;
  }

  void enabledFriday() {
    bools[0] = bools[0] == false;
    bools[1] = bools[1] == false;
    bools[2] = bools[2] == false;
    bools[3] = bools[3] == false;
    bools[5] = bools[5] == false;
    bools[6] = bools[6] == false;
  }

  void enabledSaturday() {
    bools[0] = bools[0] == false;
    bools[1] = bools[1] == false;
    bools[2] = bools[2] == false;
    bools[3] = bools[3] == false;
    bools[4] = bools[4] == false;
    bools[6] = bools[6] == false;
  }

  void enabledSunday() {
    bools[0] = bools[0] == false;
    bools[1] = bools[1] == false;
    bools[2] = bools[2] == false;
    bools[3] = bools[3] == false;
    bools[4] = bools[4] == false;
    bools[5] = bools[5] == false;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final date = DateTime.now();

//Random() se usa para obtener valores al azar, lo que viene perfecto para unas graficas dinamicas
  final _random = Random();
  int randomBetween(int min, int max) => min + _random.nextInt(max - min);
//Formateamos la fecha obtenida con la paqueteria intl
  String formattedDate =
      DateFormat.yMMMMEEEEd().format(DateTime.now().toLocal());

//Con este metodo creamos un ad publicitario de prueba de tipo Banner
  final BannerAd bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.fullBanner,
      listener: listener,
      request: const AdRequest());
}

//El listener nos permite saber en que etapa se encuentra la solicitud del ad
final BannerAdListener listener = BannerAdListener(
  // Se ejecuta cuando el banner se encuentra cargado
  onAdLoaded: (Ad ad) {
    print('Ad loaded.');
  },
  // Se ejecuta cuando el banner tiene un error
  onAdFailedToLoad: (Ad ad, LoadAdError error) {
    // Se ejecuta el metodo dispose para liberar recursos
    ad.dispose();
    print('Ad failed to load: $error');
  },
  //Se llama cuando un anuncio abre una superposición que cubre la pantalla.
  onAdOpened: (Ad ad) => print('Ad opened.'),
  // Se llama cuando un anuncio elimina una superposición que cubre la pantalla.
  onAdClosed: (Ad ad) => print('Ad closed.'),
  // Se llama cuando se produce una impresión en el anuncio.
  onAdImpression: (Ad ad) => print('Ad impression.'),
);
