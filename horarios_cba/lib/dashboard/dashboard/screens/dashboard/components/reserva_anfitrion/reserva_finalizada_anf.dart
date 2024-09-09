import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/models/ReservaSitio.dart';

// Tabla de todas las reservas finalizadas que se han hecho en los sitios del anfitrión

class ReservaFinalizadaA extends StatelessWidget {
  const ReservaFinalizadaA({
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
            "Reservas finalizadas de mis sitios",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
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
                    label: Text("Fecha"),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                  DataColumn(
                    label: Text(""),
                  ),
                ],
                rows: List.generate(
                  demoReservaAnfF.length,
                  (index) => ReservaFaDataRow(demoReservaAnfF[index], context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow ReservaFaDataRow(ReservaAnfFinal reservaFInfo, BuildContext context) {

  bool isDark = Theme.of(context).brightness == Brightness.dark;

  return DataRow(
    cells: [
      DataCell(
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SvgPicture.asset(
                reservaFInfo.icon!,
                height: 30,
                width: 30,
                color: Colors.orange,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(reservaFInfo.sitio!),
              ),
            ],
          ),
        ),
      ),
      DataCell(Text(reservaFInfo.usuario!)),
      DataCell(Text(reservaFInfo.fecha!)),
      DataCell(ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: const Text("Ver"),
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
