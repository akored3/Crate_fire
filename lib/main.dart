import 'package:crate_fire/constants.dart';
import 'package:crate_fire/theme.dart';
import 'package:crate_fire/views/get_started.dart';
import 'package:crate_fire/views/sign_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      signInRoute: (context) => const SignInPage(),
    },
    title: 'Flutter Demo',
    theme: lightThemeData,
    darkTheme: darkThemeData,
    home: const GetStartedPage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
