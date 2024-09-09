import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/models/Usuarios.dart';

// Tabla de todos los usuarios del aplicativo

class ListaUsuario extends StatelessWidget {
  const ListaUsuario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: isDark?secondaryColor:const Color(0xFFFF2F0F2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Todos los usuarios",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: InteractiveViewer(
              constrained: false,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: const [
                  DataColumn(
                    label: Text("Nombre"),
                  ),
                  DataColumn(
                    label: Text("Correo"),
                  ),
                  DataColumn(
                    label: Text("Rol"),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                ],
                rows: List.generate(
                  listaUsuario.length,
                  (index) => UsuariosDataRow(listaUsuario[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow UsuariosDataRow(Usuarios usuariosInfo, BuildContext context) {

  bool isDark = Theme.of(context).brightness == Brightness.dark;

  return DataRow(
    cells: [
      DataCell(
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SvgPicture.asset(
                usuariosInfo.icon!,
                height: 30,
                width: 30,
                color: Colors.deepPurple,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(usuariosInfo.nombre!),
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(usuariosInfo.correo!)),
      DataCell(Text(usuariosInfo.rol!)),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: const Text("Ver"),
      )),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: const Text("Actualizar"),
      )),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: const Text("Eliminar"),
      )),
      DataCell(IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/pdf.svg",
            color: isDark?Colors.white:primaryColor,
            width: 20,
            height: 20,
          ))),
    ],
  );
}
