import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sevad_mobile/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import 'package:sevad_mobile/ui/input_decorations.dart';
import 'package:sevad_mobile/widgets/card_container.dart';
import 'package:sevad_mobile/widgets/widgets.dart';
import 'package:sevad_mobile/services/services.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        //mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 435),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 5),
              Text('Iniciar sessió',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              //style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 10),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nom d\'usuari',
                    labelText: 'Nom d\'usuari',
                    prefixIcon: Icons.account_box),
                onChanged: (value) => loginForm.username = value),

            // JJFH: At this moment we don't control anything about data enter
            //validator: (value) {
            //   String pattern =
            //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            //   RegExp regExp = new RegExp(pattern);

            //   return regExp.hasMatch(value ?? '')
            //       ? null
            //       : 'El valor ingresado no luce como un correo';
            //},
            SizedBox(height: 25),
            TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*****',
                    labelText: 'Contrasenya',
                    prefixIcon: Icons.vpn_key), //Icons.lock_outline),
                onChanged: (value) => loginForm.password = value),
            //validator: (value) {
            // JJFH: At this moment we don't control anything about data enter
            //   return (value != null && value.length >= 6)
            //       ? null
            //       : 'La contrasenya debe de ser de 6 caracteres';
            //},
            SizedBox(height: 45),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Entra',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        checkLogin(
                            loginForm.username, loginForm.password, context);

                        // await Future.delayed(Duration(seconds: 2));

                        // // TODO: validar si el login es correcto
                        // //NotificationsService.showSnackbar('Error al fer login');
                        // loginForm.isLoading = false;

                        // print(loginForm.username);
                        // print(loginForm.password);

                        // mostrarAlert(context);

                        // Navigator.pushReplacementNamed(context, 'home');
                      })
          ],
        ),
      ),
    );
  }

  void checkLogin(
      String valuerId, String password, BuildContext context) async {
    print('Abans http.xx');

    //HTTP.GET example without parameters
    //var response = await http.get(Uri.parse("http://192.168.0.36:8080/goodDay")

    //HTTP.POST example with parameters
    var response = await http.post(
      Uri.parse("http://192.168.0.36:8080/login"),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(
          <String, String>{"valuer_id": valuerId, "password": password}),
    );
    if (response.statusCode != 201) {
      mostrarAlert(context);
    } else {
      // var response2 = await http
      //     .get(Uri.parse("http://192.168.0.36:8080/proceeding/000091463"));
      // print(response2.body);

      Navigator.pushReplacementNamed(context, 'list');
    }

    print('Després http.xx');
    print('El resultat de la crida a la funció es:');
    print(response.statusCode);
    print(response.body);
  }

  void mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Missatge d\'error: '),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    'Combinació usuari/contrasenya errònia. Si us plau, provi amb uns altres valors'),
                //FlutterLogo( size: 100.0 )
              ],
            ),
            actions: <Widget>[
              /*
            MaterialButton(
              child: Text('Cancelar'),
              onPressed: ()=> Navigator.of(context).pop(),
            ),
            */
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.red,
                height: 40,
                child: Center(
                  child:
                      Container(height: 20, width: 50, child: Text('D\'acord')),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
