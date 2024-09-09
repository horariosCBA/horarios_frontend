import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/models/Pagos.dart';

// Tabla de los pagos pendientes o realizados a los anfitriones

class PagosTotal extends StatelessWidget {
  const PagosTotal({
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
            "Todos los pagos",
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
                    label: Text("Sitio"),
                  ),
                  DataColumn(
                    label: Text("Usuario"),
                  ),
                  DataColumn(
                    label: Text("Fecha Pago"),
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
                  listaPagos.length,
                  (index) => PagosDataRow(listaPagos[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow PagosDataRow(Pagos PagosInfo, BuildContext context) {

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
                PagosInfo.icon!,
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(PagosInfo.sitio!),
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(PagosInfo.usuario!)),
      DataCell(Text(PagosInfo.fecha!)),
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
