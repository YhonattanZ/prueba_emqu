import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:prueba_emqu/services/notifications_service.dart';

class LoginPageController extends GetxController {
  LoginPageController() {
    NotificationService().initNotifications();
    NotificationService().showNotification();
  }

  //Formulario usuario
  TextEditingController userCtrl = TextEditingController();
  //Formulario contrasena
  TextEditingController passwordCtrl = TextEditingController();
  //Boolean para mostrar o esconder la contrasena
  var visiblePassword = true.obs;
  //Seleccionar imagenes
  ImagePicker picker = ImagePicker();
  File? imageFile;

  void goToHomePage() {
    Get.offNamedUntil('/home', (route) => false,
        arguments: {'user': userCtrl.text, 'image': imageFile});
  }

  void login() async {
    String user = userCtrl.text.trim();
    String password = passwordCtrl.text.trim();

    if (isValidForm(user, password)) {
      if (user == 'Admin' && password == 'Admin') {
        Fluttertoast.showToast(
          msg: 'Credenciales correctas',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
        );

        goToHomePage();
      } else {
        Get.snackbar('Login fallido', 'Credenciales incorrectas');
      }
    }
  }

  bool isValidForm(String user, String password) {
    if (user.isEmpty && password.isEmpty) {
      Get.snackbar('Los campos estan vacios', 'Debes rellenar los formularios');
      return false;
    }
    if (imageFile == null) {
      Get.snackbar('No seleccionaste una imagen ',
          'Debes ingresar una imagen para continuar');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar(
          'El campo password esta vacio', 'Debes ingresar una contrasena');
      return false;
    }
    if (user.isEmpty) {
      Get.snackbar('El campo user esta vacio', 'Debes ingresar una usuario');
      return false;
    }
    return true;
  }

//Con este metodo realizamos la seleccion de imagen
  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

//Este alertdialog se mostrara al usuario para elegir la opcion desde donde seleccionar la imagen
  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)))),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      },
      child: const Text('Galeria'),
    );
    Widget cameraButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)))),
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
      child: const Text('Camara'),
    );

    AlertDialog alertDialog = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: const Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
