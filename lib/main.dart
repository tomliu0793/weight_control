import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/theme/colors/light_colors.dart';
import 'package:flutter/services.dart';
import '/screens/home_page.dart';
import '/screens/calendar_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const Curve scrollCurve = Curves.fastOutSlowIn;
  static final Key key = new UniqueKey();

  final PageController controller = new PageController();

  int _selectedIndex = 0;
  final Key feedPageKey = new GlobalKey(debugLabel: 'feed page');

  @override
  Widget build(BuildContext context) {
    final Color textColor = LightColors.kDarkBlue;

    return new MaterialApp(
      title: 'DartConf',
      home: new Scaffold(
        body: new PageView(
          controller: controller,
          children: <Widget>[
            new HomePage(),
            new CalendarPage(),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              controller.animateToPage(
                _selectedIndex,
                duration: kTabScrollDuration,
                curve: scrollCurve,
              );
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: textColor),
              label: "home",
              backgroundColor: LightColors.kGreen,
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.add_to_photos, color: textColor),
              label: "tools",
              backgroundColor: LightColors.kGreen,
            ),
          ],
        ),
      ),
    );
  }
}
