import 'package:e_comm/controllers/auth_service.dart';
import 'package:e_comm/firebase_options.dart';
import 'package:e_comm/provider/adminprovider.dart';
import 'package:e_comm/view/admin_home.dart';
import 'package:e_comm/view/categories_pages.dart';
import 'package:e_comm/view/login.dart';
import 'package:e_comm/view/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AdminProvider(),
      builder:(context,child)=>  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce Admin App',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
      "/":(context)=>CheckUser(),
          '/login':(context)=>LoginPage(),
          '/signup':(context)=>SingupPage(),
          '/home':(context)=>AdminHome(),
          "/category" : (context)=> CategoriesPage(),
        },
      ),
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  void initState() {
    AuthService().isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Center(child: CircularProgressIndicator(),),);
  }
}