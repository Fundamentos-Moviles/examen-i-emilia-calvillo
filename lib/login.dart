import 'package:flutter/material.dart';
import 'package:examen1/utils/constants.dart' as con;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Variables user and password
  final user = TextEditingController();
  final pass = TextEditingController();

  String? errorMessage; // Mensaje de error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.background,
      body: Stack(
        children: [
          Column(
            //  BACKGROUND  //
            children: [
              //First Row
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background2,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background3,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background4,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                    ],
                  )
              ),

              //Second Row
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background4,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background3,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background2,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                    ],
                  )
              ),

              //Third Row
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background3,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background4,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: con.background2,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                          )
                      ),
                    ],
                  )
              )
            ],
          ),
          Center(
              child: LayoutBuilder(builder: (context, constraints){
                return Container(
                  width: constraints.maxWidth * 0.8,  // 80% del ancho de la vista
                  height: constraints.maxHeight * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white38.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bienvenido a tu primer EXAMEN',
                        style: TextStyle(
                            color: con.titles,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 25.0,),

                      //TextField User
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: user,
                          decoration: InputDecoration(
                              hintText: 'Correo/Usuario',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 5,
                                      style:BorderStyle.solid)
                              )
                          ),
                        ),
                      ),

                      const SizedBox(height: 25.0,),

                      //TextField Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 5,
                                      style:BorderStyle.solid)
                              )
                          ),
                          obscureText: true,
                        ),
                      ),

                      const SizedBox(height: 25.0,),

                      // Error Message
                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            errorMessage!,
                            style: const TextStyle(color: Colors.red, fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      //Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: con.buttons,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),  // Bordes redondeados
                            ),
                          ),
                          onPressed: () {
                            verifyUser();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,  // Centrar el texto
                            children: const [
                              Text(
                                'Iniciar Sesión',
                                style: TextStyle(
                                  color: Colors.white,  // Texto blanco
                                  fontSize: 18.0,  // Tamaño de la fuente
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 25.0),

                      const Text('Mi primer examen, ¿estará sencillo?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.07),
                      ),
                    ],
                  ),
                );
              }
              )
          )
        ],
      ),
    );
  }

  // Función de verificación
  void verifyUser() {
    setState(() {
      print('Usuario: ${user.text}');
      print("Contraseña:"+pass.text);
      // user=test pass=FDM1
      if (user.text.isEmpty || pass.text.isEmpty) {
        errorMessage = 'Datos incompletos';
        print('Datos Vacíos');
      } else if (user.text != 'test' && pass.text != 'FDM1') {
        errorMessage = 'Usuario y contraseña incorrectos';
        print('Datos Incorrectos');
      } else if (user.text != 'test') {
        errorMessage = 'Usuario incorrecto';
        print('Usuario Incorrecto');
      } else if (pass.text != 'FDM1') {
        errorMessage = 'Contraseña incorrecta';
        print('Contraseña Incorrecta');
      } else {
        errorMessage = null;
        print('Datos correctos');
        // Acción al ingresar los datos correctamente
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }
}

