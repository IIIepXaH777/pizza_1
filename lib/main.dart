import 'package:flutter/material.dart';
import 'package:pizza_1/theme_screen.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_1/theme.dart';

void main() => runApp(
      MaterialApp(
        theme: globalTheme(),
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Souce { hot, sour, cheese }

class _MyAppState extends State<MyApp> {
  double _Slidervalue = 0;
  int _cost = 0;
  bool _checked = false;
  int _cheesecoast = 0;
  bool _yesCheese = false;
  var _moreCheese = 'assets/pizza.png';

  Souce? _souce = Souce.hot;
  bool _testoYes = false;

  void _onChoiseChanged(Souce? value) {
    setState(() {
      _souce = value;
    });
  }

  int _calcCost() {
    _cost = _Slidervalue.round() + 300;
    if (_yesCheese == true) _cost += 70;
    if (_testoYes == true) _cost += 90;

    switch (_souce) {
      case Souce.hot:
        _cost += 0;
        break;
      case Souce.sour:
        _cost += 25;
        break;
      case Souce.cheese:
        _cost += 35;
        break;
      default:
        _souce = Souce.hot;
        break;
    }
    return _cost;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: false,
        right: false,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          height: 123,
                          width: 232,
                          child: const Image(image: AssetImage('assets/5.png')),
                        ),
                      ]),
                      const SizedBox(
                        height: 33,
                      ),
                      const Text('Калькулятор пиццы',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      const SizedBox(height: 9),
                      Text('Выберите параметры',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 33),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SlidingSwitch(
                              height: 40,
                              width: 380,
                              buttonColor: const Color(0xFF0079D0),
                              textOff: 'Обычное тесто',
                              textOn: 'Тонкое тесто',
                              colorOn: Colors.red,
                              colorOff: Colors.red,
                              inactiveColor: Colors.black,
                              onSwipe: () {
                                setState(() {
                                  _testoYes = !_testoYes;
                                  _calcCost();
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  _testoYes = !_testoYes;
                                });
                              },
                              onChanged: (value) {},
                              value: false,
                              onTap: () {
                                setState(() {
                                  _testoYes = !_testoYes;
                                });
                              })),
                      const SizedBox(height: 19),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                color: Theme.of(context).colorScheme.primary,
                                margin: const EdgeInsets.only(left: 10),
                                child: Text('Размер',
                                    style:
                                        Theme.of(context).textTheme.bodyText2)),
                          ]),
                      const SizedBox(height: 5),
                      Stack(alignment: Alignment.center, children: [
                        Container(
                            height: 35,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(36),
                              ),
                              color: Color(0xffECEFF1),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SliderTheme(
                                data: const SliderThemeData(
                                  trackShape: RectangularSliderTrackShape(),
                                  trackHeight: 3.0,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 8.0),
                                ),
                                child: SizedBox(
                                  height: 4,
                                  child: Slider(
                                      activeColor: Colors.blue,
                                      inactiveColor: Colors.grey[300],
                                      min: 0,
                                      max: 60.0,
                                      divisions: 2,
                                      value: _Slidervalue,
                                      onChanged: (value) {
                                        setState(() {
                                          _Slidervalue = value;
                                          _calcCost();
                                        });
                                      }),
                                ),
                              ),
                            )),
                        Text(
                          '$_Slidervalue см',
                          style: GoogleFonts.rowdies(
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Colors.purple),
                        )
                      ]),
                      const SizedBox(
                        height: 13,
                      ),
                      ListTile(
                          visualDensity: VisualDensity.compact,
                          title: Text('Соус',
                              style: Theme.of(context).textTheme.bodyText1)),
                      const Divider(),
                      RadioListTile<Souce>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text('Острый',
                            style: Theme.of(context).textTheme.bodyText2),
                        value: Souce.hot,
                        activeColor: Colors.green,
                        groupValue: _souce,
                        onChanged: _onChoiseChanged,
                      ),
                      const Divider(),
                      RadioListTile<Souce>(
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text('Кисло-сладкий',
                            style: Theme.of(context).textTheme.bodyText2),
                        value: Souce.sour,
                        activeColor: Colors.green,
                        groupValue: _souce,
                        onChanged: _onChoiseChanged,
                      ),
                      const Divider(),
                      RadioListTile<Souce>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text('Сырный',
                              style: Theme.of(context).textTheme.bodyText2),
                          value: Souce.cheese,
                          activeColor: Colors.green,
                          groupValue: _souce,
                          onChanged: _onChoiseChanged),
                      const Divider(),
                      SizedBox(height: 18),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 18, right: 11),
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xffF0F0F0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          SwitchListTile(
                              secondary: Image.asset(_moreCheese, height: 34),
                              value: _yesCheese,
                              title: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Дополнительный сыр',
                                  style: GoogleFonts.amita(
                                    color: Colors.yellow[900],
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              activeColor: Colors.yellow[400],
                              onChanged: (value) {
                                setState(() {
                                  if (_yesCheese == false) {
                                    _moreCheese = 'assets/pizza1.png';
                                  } else if (_yesCheese == true) {
                                    _moreCheese = 'assets/pizza.png';
                                  }
                                  _yesCheese = value;
                                  _calcCost();
                                });
                              }),
                        ],
                      ),
                      const SizedBox(height: 18),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Стоимость:',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 34,
                        width: 400,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(36),
                            ),
                            color: Color(0xffECEFF1),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('${_calcCost()} рублей',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      SizedBox(
                        height: 42,
                        width: 154,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Заказать',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      const SizedBox(height: 30),
                    ])))));
  }
}
