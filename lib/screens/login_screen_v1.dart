import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 75.0),
        Center(
            child: Text('SEVAD',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.red))),
        SizedBox(height: 25.0),
        Center(
            child: SvgPicture.asset(
          'assets/sevad_picture.svg',
          semanticsLabel: 'Imatge Sevad',
          fit: BoxFit.contain,
        )),
        SizedBox(height: 100.0),
        Text('FI SEVAD'),
      ]),
      // FadeInImage(
      //     image: AssetImage('assets/img-1.svg'),
      //     placeholder: AssetImage('assets/jar-loading.gif'),
      //     fadeInDuration: Duration(milliseconds: 200)),
    );
  }
}
