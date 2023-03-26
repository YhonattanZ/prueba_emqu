import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prueba_emqu/models/sales_data.dart';
import 'package:prueba_emqu/pages/mainPage/home_page_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

final HomePageController homeCtrl = Get.put(HomePageController());
final todayDate = DateFormat('EEEE').format(homeCtrl.date);

class ChartsWButtons extends StatefulWidget {
  ChartsWButtons({super.key});

  @override
  State<ChartsWButtons> createState() => _ChartsWButtonsState();
}

class _ChartsWButtonsState extends State<ChartsWButtons> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        flex: 4,
        child: Column(children: [
          IndexedStack(
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
          )
        ]));
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
}
