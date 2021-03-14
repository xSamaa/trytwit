import 'package:flutter/material.dart';
import 'package:twitsam/src/api/my_api.dart';
import 'package:twitsam/src/utils/dialogs.dart';

class LoginPage extends StatelessWidget {
  final controllerName = TextEditingController();
  final controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 180,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      offset: Offset(0.0, 5.0)),
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _crearEmail(),
                SizedBox(
                  height: 10,
                ),
                _crearPassword(),
                SizedBox(
                  height: 25,
                ),
                _crearBoton(context),
                SizedBox(
                  height: 10,
                ),
                Text('¿Olvidó la contraseña?')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: controllerName,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
          ),
        ));
  }

  Widget _crearPassword() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          obscureText: true,
          controller: controllerPass,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
            labelText: 'Contraseña',
          ),
        ));
  }

  Widget _crearFondo(BuildContext context) {
// Medimos la pantalla..
    final size = MediaQuery.of(context).size;

    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90, left: 30, child: circulo),
        Positioned(top: -40, left: -30, child: circulo),
        Positioned(bottom: -50, left: -10, child: circulo),
        Positioned(bottom: 100, left: 170, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(
                height: 1,
                width: double.infinity,
              ),
              Text(
                'TwitSam',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _crearBoton(BuildContext context) {
    MyApi myApi = new MyApi();
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0.0,
          primary: Colors.deepPurple),
      onPressed: () async {
        // myApi.register();

        await myApi.login(context, controllerName.text, controllerPass.text);
        // progressDialog.dismiss();
      },
    );
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerPass.dispose();
  }
}
