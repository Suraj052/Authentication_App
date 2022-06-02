import 'package:authentication/auth.dart';
import 'package:authentication/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(

    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  )
  );
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
          stream:FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {

            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError)
            {
              return Center(child: Text('Something went wrong !'));
            }
            if(snapshot.hasData)
            {
              return Home();
            }
            else
            {
              return Auth();
            }
          }
      ),
    );
  }
}
