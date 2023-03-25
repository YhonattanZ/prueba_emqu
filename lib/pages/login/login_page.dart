import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_emqu/pages/login/login_page_controller.dart';

import 'package:prueba_emqu/widgets/sign_in_form.dart';

final LoginPageController loginCtrl = Get.put(LoginPageController());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Painter

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange.shade300, Colors.pink.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Stack(children: [
              Column(
                children: <Widget>[
                  _loginInfo(),
                  _imageUser(context),
                  const SizedBox(height: 20),
                  //Container blanco en la pantalla
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      width: double.infinity,
                      child: Column(children: [
                        _hello(),
                        SizedBox(height: size.height * 0.04),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: size.height * 0.10,
                            width: double.infinity,
                            child: _formUsername(context),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: size.height * 0.10,
                            width: double.infinity,
                            child: _formPassword(context),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: _buttonLogin(context),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('No tienes una cuenta?',
                                    style: GoogleFonts.lato(
                                        fontSize: 18, color: Colors.orange)),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Registrate ahora',
                                      style: GoogleFonts.lato(
                                          fontSize: 18, color: Colors.pink)),
                                ),
                              ],
                            ))
                      ]),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  Widget _loginInfo() {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inicia sesion!',
                style: GoogleFonts.lato(shadows: [
                  Shadow(
                      color: Colors.orange.shade500,
                      offset: Offset(4, 3),
                      blurRadius: 10)
                ], fontSize: 30, color: Colors.white),
              ),
              Text('Agregando una foto de perfil',
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  Widget _hello() {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola!',
                style: GoogleFonts.lato(
                  fontSize: 38,
                  color: Colors.pink,
                ),
              ),
              Text('Ingresa tus credenciales para continuar',
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.030, horizontal: size.width * 0.12),
      child: SizedBox(
        height: size.height * 0.07,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            loginCtrl.login();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink.shade300,
            shape: const StadiumBorder(),
          ),
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _formUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Usuario',
            style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        SignUpForms(
            controller: loginCtrl.userCtrl,
            autofocus: false,
            obstext: false,
            formTitle: 'Ingresa tu usuario',
            formIcon: Icon(
              Icons.person,
              color: Colors.orange.shade400,
            ),
            keyboardType: TextInputType.text),
      ],
    );
  }

  Widget _formPassword(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                'Contraseña',
                style: GoogleFonts.lato(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            SignUpForms(
                controller: loginCtrl.passwordCtrl,
                autofocus: false,
                obstext: !loginCtrl.visiblePassword.value,
                lines: 1,
                formTitle: 'Ingresa tu contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                      loginCtrl.visiblePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.orange),
                  onPressed: () {
                    loginCtrl.visiblePassword.value =
                        !loginCtrl.visiblePassword.value;
                  },
                ),
                formIcon: Icon(
                  Icons.lock,
                  color: Colors.orange.shade400,
                ),
                keyboardType: TextInputType.text),
          ],
        ));
  }

  Widget _imageUser(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          GestureDetector(
              onTap: () {
                loginCtrl.showAlertDialog(context);
              },
              child: GetBuilder<LoginPageController>(
                  builder: (value) => Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.pink,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 55,
                                backgroundImage: loginCtrl.imageFile != null
                                    ? FileImage(loginCtrl.imageFile!)
                                    : const AssetImage(
                                            'assets/images/image.jpg')
                                        as ImageProvider),
                          ),
                          Positioned(
                            top: size.height * 0.08,
                            left: size.width * 0.18,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_circle_sharp,
                                  size: 40,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(blurRadius: 3, color: Colors.black38)
                                  ],
                                )),
                          ),
                        ],
                      ))),
        ]),
      ),
    );
  }
}
