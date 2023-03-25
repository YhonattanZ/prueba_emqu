import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  NotificationService? notificationService;
  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future requestPermissions() async {
    return await Permission.notification.request();
  }

  //Inicializar notificaciones
  void initNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/logo_emqu_web");

    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
      macOS: null,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

//Metodo para mostrar notificaciones de manera local cada hora
  void showNotification() {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('Notificacion', 'App de prueba',
            'Tiene nueva informacion acerca de nuestra empresa',
            importance: Importance.high);

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: iosNotificationDetails,
        macOS: null);

    flutterLocalNotificationsPlugin.periodicallyShow(
        01,
        'Tienes una notificacion a las ${DateTime.now().hour}:00',
        'Tiene nueva informacion acerca de nuestra empresa',
        RepeatInterval.hourly,
        androidAllowWhileIdle: true,
        notificationDetails);
  }

//ID del dispositivo para los pruebas de adas

}

List<String> testDeviceIds = ["C9EC087678C671DC530956EB96B9286A"];
