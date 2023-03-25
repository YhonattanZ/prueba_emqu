import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:prueba_emqu/models/sales_data.dart';
import 'package:prueba_emqu/pages/home/home_page_controller.dart';
import 'package:prueba_emqu/services/notifications_service.dart';
import 'package:prueba_emqu/widgets/user_image.dart';
import 'package:prueba_emqu/widgets/welcome_back.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

final HomePageController homeCtrl = Get.put(HomePageController());

final todayDate = DateFormat('EEEE').format(homeCtrl.date);

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    NotificationService().initNotifications();
    NotificationService().showNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                  children: [
                    _appBar(),
                    // //Container blanco
                    Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.orange.shade500,
                                        spreadRadius: 8,
                                        blurRadius: 16)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              width: double.infinity,
                            ),
                            UserImage(file: homeCtrl.profileImage),
                            WelcomeBack(
                                title:
                                    'Bienvenido de vuelta ${homeCtrl.username}',
                                subtitle: homeCtrl.formattedDate)
                          ],
                        )),
                    Expanded(
                      flex: 4,
                      child: Column(children: <Widget>[
                        _chartSales(),
                        _weekButtons(size),
                        StatefulBuilder(
                          builder: (context, setState) => Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              color: Colors.white,
                              width: homeCtrl.bannerAd.size.width.toDouble(),
                              height: size.height * 0.13,
                              child: AdWidget(ad: homeCtrl.bannerAd)),
                        )
                      ]),
                    ),
                  ],
                ),
              ]),
            )));
  }

  Widget _chartSales() {
    return IndexedStack(
      index: homeCtrl.indexGraphics,
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          child: _graphics(),
        ),
      ],
    );
  }

  Widget _weekButtons(Size size) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: todayDate == 'Monday' || homeCtrl.bools[0]
                          ? null
                          : () {
                              setState(() {
                                homeCtrl.indexGraphics == 0;
                                homeCtrl.enabledMonday();
                              });
                            },
                      child: Text('Lunes',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16))),
                ),
                SizedBox(
                    width: size.width * 0.25,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade300,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: todayDate == 'Tuesday' || homeCtrl.bools[1]
                            ? null
                            : () {
                                setState(() {
                                  homeCtrl.indexGraphics == 1;
                                  homeCtrl.enabledTuesday();
                                });
                              },
                        child: Text('Martes',
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 16)))),
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: todayDate == 'Wednesday' || homeCtrl.bools[2]
                          ? null
                          : () {
                              setState(() {
                                homeCtrl.indexGraphics == 2;
                                homeCtrl.enabledWednesday();
                              });
                            },
                      child: Text('Miercoles',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: todayDate == 'Thrusday' || homeCtrl.bools[3]
                          ? null
                          : () {
                              setState(() {
                                homeCtrl.indexGraphics == 3;
                                homeCtrl.enabledThrusday();
                              });
                            },
                      child: Text('Jueves',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16))),
                ),
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: todayDate == 'Friday' || homeCtrl.bools[4]
                          ? null
                          : () {
                              setState(() {
                                homeCtrl.indexGraphics == 4;
                                homeCtrl.enabledFriday();
                              });
                            },
                      child: Text('Viernes',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16))),
                ),
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: todayDate == 'Saturday' || homeCtrl.bools[5]
                          ? null
                          : () {
                              setState(() {
                                homeCtrl.indexGraphics == 5;
                                homeCtrl.enabledSaturday();
                              });
                            },
                      child: Text('Sabado',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 16))),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.25,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade300,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: todayDate == 'Sunday' || homeCtrl.bools[6]
                      ? null
                      : () {
                          setState(() {
                            homeCtrl.indexGraphics == 6;
                            homeCtrl.enabledSunday();
                          });
                        },
                  child: Text('Domingo',
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _graphics() {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.orange,
      palette: const [Colors.orange, Colors.pink],
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(
          text: 'Precio de las acciones EmQu Tech',
          textStyle: GoogleFonts.lato(color: Colors.pink)),
      series: <LineSeries<SalesData, String>>[
        LineSeries<SalesData, String>(
            animationDelay: 100,
            dataSource: <SalesData>[
              SalesData('10:00', homeCtrl.randomBetween(10, 300).toDouble()),
              SalesData('11:00', homeCtrl.randomBetween(10, 500).toDouble()),
              SalesData('12:00', homeCtrl.randomBetween(10, 600).toDouble()),
              SalesData('13:00', homeCtrl.randomBetween(10, 250).toDouble()),
              SalesData('14:00', homeCtrl.randomBetween(10, 400).toDouble()),
              SalesData('15:00', homeCtrl.randomBetween(10, 550).toDouble()),
              SalesData('16:00', homeCtrl.randomBetween(10, 400).toDouble()),
              SalesData('17:00', homeCtrl.randomBetween(10, 100).toDouble()),
              SalesData('18:00', homeCtrl.randomBetween(10, 150).toDouble()),
              SalesData('19:00', homeCtrl.randomBetween(10, 120).toDouble()),
              SalesData('20:00', homeCtrl.randomBetween(10, 220).toDouble()),
              SalesData('21:00', homeCtrl.randomBetween(10, 310).toDouble()),
              SalesData('22:00', homeCtrl.randomBetween(10, 480).toDouble())
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales)
      ],
    );
  }

  Widget _appBar() {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        padding: const EdgeInsets.only(bottom: 60),
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          Text(
            homeCtrl.username,
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
