import 'package:flutter/material.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  MaterialColor get primaryColor {
    const int _1d2528PrimaryValue = 0xFF1d2528;
    return const MaterialColor(_1d2528PrimaryValue, <int, Color>{
      50: Color(0xFFE4E5E5),
      100: Color(0xFFBBBEBF),
      200: Color(0xFF8E9294),
      300: Color(0xFF616669),
      400: Color(0xFF3F4648),
      500: Color(_1d2528PrimaryValue),
      600: Color(0xFF1A2124),
      700: Color(0xFF151B1E),
      800: Color(0xFF111618),
      900: Color(0xFF0A0D0F),
    });
  }

  // 0xff1d2528
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ps2 Rampage',
      theme: ThemeData(
        colorScheme: ColorScheme
            .fromSwatch(primarySwatch: primaryColor)
            .copyWith(secondary: Colors.white)
      ),
      home: const Home(title: 'Ps2 rampage'),
    );
  }
}
