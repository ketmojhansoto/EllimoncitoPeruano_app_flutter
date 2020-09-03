import 'package:flutter/material.dart';
import 'package:ellimoncito_peruano/src/ui/inicioSesion.dart';

import 'app.dart';

class Registrarse extends StatefulWidget {
  @override
  _RegistrarseState createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  GlobalKey<FormState> _key = GlobalKey();

  RegExp emailRegExp =
      new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String _nombre;
  String _apellidoP;
  String _apellidoM;
  String _correo;
  String _contrasenia;
  String _contrasenia2;
  bool _logueado = false;
  bool checkbook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(children: [
        Align(
          alignment: Alignment.topRight,
          child: RaisedButton(
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.10,
              child: Center(
                child: Text(
                  'omitir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => App(),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Text(
                  'Ya falta poco!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                color: Colors.white),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo es requerido";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su Nombre',
                      labelText: 'Nombre',
                      counterText: '',
                    ),
                    onSaved: (text) => _correo = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo es requerido";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su Apellido Paterno',
                      labelText: 'Apellido Paterno',
                      counterText: '',
                    ),
                    onSaved: (text) => _correo = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo es requerido";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su Apellido Materno',
                      labelText: 'Apellido Materno',
                      counterText: '',
                    ),
                    onSaved: (text) => _correo = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo correo es requerido";
                      } else if (!emailRegExp.hasMatch(text)) {
                        return "El formato para correo no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 50,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su Correo',
                      labelText: 'Correo',
                      counterText: '',
                    ),
                    onSaved: (text) => _correo = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo es requerido";
                      } else if (text.length <= 5) {
                        return "Su contraseña debe ser al menos de 5 caracteres";
                      } else if (!contRegExp.hasMatch(text)) {
                        return "El formato para contraseña no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Ingrese su Contraseña',
                      labelText: 'Contraseña',
                      counterText: '',
                    ),
                    onSaved: (text) => _contrasenia = text,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text.length == 0) {
                        return "Este campo es requerido";
                      } else if (text.length <= 5) {
                        return "Su contraseña debe ser al menos de 5 caracteres";
                      } else if (!contRegExp.hasMatch(text)) {
                        return "El formato para contraseña no es correcto";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Repetir Contraseña',
                      labelText: 'Repetir Contraseña',
                      counterText: '',
                    ),
                    onSaved: (text) => _contrasenia = text,
                  ),
                  SizedBox(height: 10.0),
                  Row(children: <Widget>[
                    Checkbox(
                      activeColor: Colors.green,
                      value: checkbook,
                      onChanged: (bool value) {
                        setState(() {
                          checkbook = value;
                        });
                      },
                    ),
                    Text(
                      'Recordarme',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ]),
                  RaisedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Text(
                          'aceptar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'registrate con:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.17,
                    child: Row(children: [
                      Image(
                        image: AssetImage('assets/images/google.png'),
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      SizedBox(width: 20.0),
                      Image(
                        image: AssetImage('assets/images/facebook.png'),
                        height: MediaQuery.of(context).size.height * 0.06,
                      )
                    ]),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(children: [
              SizedBox(height: 10.0),
              Text(
                '¿ya tienes una cuenta?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              RaisedButton(
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: Center(
                    child: Text(
                      'iniciar sesión',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                color: Colors.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InicioSesion(),
                    ),
                  );
                },
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
