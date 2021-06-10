import 'package:flutter/material.dart';
import 'package:pl_table/Provider/UniversityProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Consumer<UniversityProvider>(builder: (context, university, _){
        university.fetchUniversity();
        return Center(
            child: Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                constraints: BoxConstraints.expand(),
                color: Colors.white,
                child: Image.asset(
                  'assets/images/pl_logo.png',
                  fit: BoxFit.fitWidth,
                )
            )
        );
      });
  }
}

