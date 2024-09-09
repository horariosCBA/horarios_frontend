import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horarios_cba/Home/homePage.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "assets/icons/home.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Mi Perfil",
            svgSrc: "assets/icons/persona.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Categorías",
            svgSrc: "assets/icons/hotel.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Comentarios",
            svgSrc: "assets/icons/comentarios.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Mis Chats",
            svgSrc: "assets/icons/chat.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Nuevo Sitio",
            svgSrc: "assets/icons/addsitio.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Explorar",
            svgSrc: "assets/icons/explorar.svg",
            press: () {},
          ),
          DrawerListTile(
            title: isDark ? "Modo Claro" : "Modo Oscuro",
            svgSrc: isDark ? "assets/icons/Light.svg" : "assets/icons/dark.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Cerrar Sesión",
            svgSrc: "assets/icons/logout.svg",
            press: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }
}

/// Muestra un diálogo para confirmar si el usuario desea cerrar sesión.
///
/// [context] es el contexto de la aplicación donde se mostrará el diálogo.
void logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // Título del diálogo
        title: const Center(
            child: Text("¿Seguro que quiere cerrar sesión?",
                textAlign: TextAlign.center)),
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
          ButtonBar(
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
                child: buildButton("Salir", () {
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

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: isDark
            ? const ColorFilter.mode(Colors.white54, BlendMode.srcIn)
            : const ColorFilter.mode(primaryColor, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: isDark
            ? const TextStyle(color: Colors.white54)
            : const TextStyle(color: primaryColor),
      ),
    );
  }
}
