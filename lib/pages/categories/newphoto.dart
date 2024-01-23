import 'package:flutter/material.dart';

class myac extends StatelessWidget {
  const myac({Key? key}) : super(key: key);
  static int view = 1;
  static PageController controllerPageView = PageController(viewportFraction: 1 / 3), controllerListView = PageController(viewportFraction: 1 / 5);
  static ValueNotifier<ThemeMode> theme = ValueNotifier<ThemeMode>(ThemeMode.dark);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: theme,
        builder: (BuildContext context, ThemeMode value, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            themeMode: value,
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView - ListView Transition'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                myac.theme.value = (myac.theme.value == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
              },
              icon: ValueListenableBuilder<ThemeMode>(
                  valueListenable: myac.theme,
                  builder: (BuildContext context, ThemeMode value, Widget? child) {
                    return Icon((value == ThemeMode.dark) ? Icons.dark_mode_rounded : Icons.light_mode_rounded);
                  })),
          PopupMenuButton<int>(
            initialValue: myac.view,
            onSelected: (int index) {
              if (myac.view != index) {
                myac.view = index;
              }
              if (index == 2 && myac.controllerPageView.hasClients && myac.controllerPageView.page?.round() != null) {
                myac.controllerListView = PageController(viewportFraction: 1 / 5, initialPage: (myac.controllerPageView.page?.round())!);
              } else if (index == 3 && myac.controllerListView.hasClients && myac.controllerListView.page?.round() != null) {
                myac.controllerPageView = PageController(viewportFraction: 1 / 3, initialPage: (myac.controllerListView.page?.round())!);
              }
              Navigator.of(context).pushReplacement(_createRoute(const MyHomePage()));
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Switch to GridView'),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Switch to ListView'),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text('Switch to PageView'),
                ),
              ];
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: (myac.view == 2)
          ? PageView(
              controller: myac.controllerListView,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              padEnds: false,
              children: <Hero>[
                for (int index = 0; index < _months.length; index++)
                  Hero(
                    tag: index,
                    createRectTween: (Rect? begin, Rect? end) {
                      //return MaterialRectCenterArcTween(begin: begin, end: end);
                      return CustomRectTween(a: begin!, b: end!);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 4.0,
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Center(
                          child: Text(
                            _months[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            )
          : (myac.view == 1)
              ? GridView.count(
                  physics: const PageScrollPhysics(),
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8.0),
                  children: <Hero>[
                    for (int index = 0; index < _months.length; index++)
                      Hero(
                        tag: index,
                        createRectTween: (Rect? begin, Rect? end) {
                          //return MaterialRectCenterArcTween(begin: begin, end: end);
                          return CustomRectTween(a: begin!, b: end!);
                        },
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 4.0,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              _months[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                )
              : PageView(
                  controller: myac.controllerPageView,
                  children: <Hero>[
                    for (int index = 0; index < _months.length; index++)
                      Hero(
                        tag: index,
                        createRectTween: (Rect? begin, Rect? end) {
                          //return MaterialRectCenterArcTween(begin: begin, end: end);
                          return CustomRectTween(a: begin!, b: end!);
                        },
                        child: Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 4.0,
                          borderOnForeground: false,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: Center(
                              child: Text(
                                _months[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
    );
  }
}

Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => destination,
    transitionDuration: const Duration(milliseconds: 1200),
    reverseTransitionDuration: const Duration(milliseconds: 1200),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCirc, reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}

class CustomRectTween extends MaterialRectCenterArcTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a, b;

  @override
  Rect lerp(double t) {
    final double myCurve = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, myCurve),
      lerpDouble(a.top, b.top, myCurve),
      lerpDouble(a.right, b.right, myCurve),
      lerpDouble(a.bottom, b.bottom, myCurve),
    );
  }

  double lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
