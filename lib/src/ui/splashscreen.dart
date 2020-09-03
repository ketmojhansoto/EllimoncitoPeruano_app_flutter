import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/ui/inicioSesion.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:lapergola_app_flutter/src/ui/app.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      image: new Image.asset('assets/images/logonombre.png'),
      backgroundColor: Colors.green,
      photoSize: 100.0,
      loaderColor: Colors.white,
      navigateAfterSeconds: InicioSesion(),
    );
  }
}
