import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final user = FirebaseAuth.instance.currentUser;
    var name = user?.displayName?? 'Keep smiling';

    return Scaffold(
      backgroundColor: HexColor('#ebeff5'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(44.0, 60.0, 0.0, 0.0),
              child: Text(
                "Hello !",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Recoleta',
                    color: HexColor('#091945')
                ),
              ),
            ),
            SizedBox(height: 0.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(44.0, 0.0, 0.0, 0.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Recoleta',
                    color: HexColor('#091945')
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
              child: Container(
                height: size.height*0.70,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius: BorderRadius.circular(10.0) ,
                  image: DecorationImage(
                    image: AssetImage("assests/new.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(42.0,0.0, 0.0, 0.0),
              child: Container(
                height: 40,
                width: 40,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        offset: Offset(0.0,2.0),
                      )]
                  ),
                  child: IconButton(
                    onPressed: ()=>FirebaseAuth.instance.signOut(),
                    icon: Icon(
                      Icons.logout_rounded,
                      color: HexColor("#091945"),
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
