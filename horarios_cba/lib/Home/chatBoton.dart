// ignore_for_file: unnecessary_null_comparison, file_names

import 'package:flutter/material.dart';
import 'package:horarios_cba/Auth/authScreen.dart';
import 'package:horarios_cba/Chat/Responsive/responsive_chat.dart';
import 'package:horarios_cba/Chat/Screens/mobile_screen_chat.dart';
import 'package:horarios_cba/Chat/Screens/web_screen_chat.dart';
import 'package:horarios_cba/Home/homePage.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/provider.dart';
import 'package:provider/provider.dart';

// Clase ChatBoton, la cual contendra el botón para ir al chat en línea.
class ChatBoton extends StatelessWidget {
  const ChatBoton({super.key});

  @override
  Widget build(BuildContext context) {
    // Uso de Consumer para acceder al estado de la aplicación.
    return Consumer<AppState>(
      builder: (context, appState, _) {
        // Obtengo el usuario autenticado.
        final usuarioAutenticado = appState.usuarioAutenticado;
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          child: Container(
            color: primaryColor, // Color de fondo del botón.
            child: IconButton(
              // Botón de chat.
              onPressed: () {
                // Verifico que el usuario este autenticado.
                if (usuarioAutenticado != null) {
                  // Si el usuario no tiene rol, llamar a la función logoutRol para cerrar la sesión.
                  if (usuarioAutenticado.rol == "" ||
                      usuarioAutenticado.rol == null) {
                    logoutRol(context);
                  } else {
                    // Navegar al chat si el usuario tiene un rol
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResponsiveChat(
                          mobileScreenLayout: MobileScreenChat(
                            usuarioAutenticado: usuarioAutenticado,
                          ),
                          webScreenLayout: WebLayoutChat(
                            usuarioAutenticado: usuarioAutenticado,
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  // Si el usuario no se encuentra autenticado, mostrar una ventana modal para iniciar sesión.
                  iniciarSesionChat(context);
                }
              },
              icon: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  // Función de ventana modal para iniciar sesión.
  void iniciarSesionChat(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Título del diálogo
          title: const Center(
              child: Text(
            "¡No ha iniciado sesión!",
            textAlign: TextAlign.center,
          )),
          alignment: Alignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Mensaje informativo para el usuario
              const Text(
                "Para acceder al chat, debe iniciar sesión.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              // Contenedor circular con la imagen del logo de la aplicación
              ClipOval(
                child: Container(
                  width: 100, // Ajusta el tamaño según sea necesario
                  height: 100, // Ajusta el tamaño según sea necesario
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  // Muestra la imagen del logo en el contenedor.
                  child: Image.asset(
                    "assets/img/logo.png",
                    fit: BoxFit.cover, // Ajusta la imagen al contenedor
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                // Botón para cancelar la operación.
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: buildButton("Cancelar", () {
                    Navigator.pop(context);
                  }),
                ),
                // Botón para iniciar sesión.
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: buildButton("Iniciar Sesión", () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  }),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  // Función de ventana modal para notificar al usuario que no tiene un rol.
  void logoutRol(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Título del diálogo
          title: const Center(
              child: Text(
            "¿No tiene un rol en el aplicativo?",
            textAlign: TextAlign.center,
          )),
          alignment: Alignment.center,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Mensaje informativo para el usuario
              const Text(
                "En este momento, su usuario no tiene un rol asignado en la aplicación, por lo que no puede ingresar al chat. Recibirá una notificación por correo electrónico una vez que se le haya otorgado un rol.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              // Contenedor circular con la imagen del logo de la aplicación
              ClipOval(
                child: Container(
                  width: 100, // Ajusta el tamaño según sea necesario
                  height: 100, // Ajusta el tamaño según sea necesario
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  // Muestra la imagen del logo en el contenedor.
                  child: Image.asset(
                    "assets/img/logo.png",
                    fit: BoxFit.cover, // Ajusta la imagen al contenedor
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: [
                // Botón para cancelar la operación.
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: buildButton("Cancelar", () {
                    Navigator.pop(context);
                  }),
                ),
                // Botón para salir de la sesión.
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: buildButton("Cerrar Sesión", () {
                    Navigator.pop(context);
                    Provider.of<AppState>(context, listen: false).logout();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
