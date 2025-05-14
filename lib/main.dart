import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/screen/home_screen.dart';
import 'package:login_app/screen/register_screen.dart';
import 'package:login_app/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Z Nation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null ? '/home' : '/home',
      routes: {
          '/home': (context) =>  const HomeScreen(),
          '/register': (context) => const RegisterScreen(),

        '/login': (context) => const LoginScreen(),
                    // You must create this screen
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
