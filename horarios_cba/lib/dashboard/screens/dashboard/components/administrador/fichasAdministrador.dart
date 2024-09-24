// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/fichas.dart';
import 'package:horarios_cba/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FichasAdministrador extends StatefulWidget {
  const FichasAdministrador({super.key});

  @override
  State<FichasAdministrador> createState() => _FichasAdministradorState();
}

class _FichasAdministradorState extends State<FichasAdministrador> {
  late FichasAdministradorDataGridSource _dataGridSource;

  List<Fichas> fichasAdministrador = [];

  @override
  void initState() {
    super.initState();

    fichasAdministrador = listaFichas;

    _dataGridSource =
        FichasAdministradorDataGridSource(fichas: fichasAdministrador);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Color(0xFFFF2F0F2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo de la tabla
          Text(
            "Fichas",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontFamily: 'Calibri-Bold'),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          // Tabla
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SfDataGrid(
                  verticalScrollPhysics: const AlwaysScrollableScrollPhysics(),
                  frozenRowsCount: 0,
                  showVerticalScrollbar: true,
                  defaultColumnWidth: 200,
                  shrinkWrapColumns: true,
                  shrinkWrapRows: true,
                  rowsPerPage: 10,
                  source:
                      _dataGridSource, // Carga los datos de las producciones
                  selectionMode: SelectionMode.multiple,
                  showCheckboxColumn: true,
                  allowSorting: true,
                  allowFiltering: true,
                  // Cambia la firma del callback
                  onSelectionChanged: (List<DataGridRow> addedRows,
                      List<DataGridRow> removedRows) {},
                  // Columnas de la tabla
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'Código ',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Código'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Fecha Inicio',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Fecha Inicio'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Fecha Final',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Fecha Final'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Modalidad',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Modalidad'),
                      ),
                    ),
                    GridColumn(
                      width: 145,
                      columnName: 'Estado',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Estado'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Lider',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Lider'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Programa',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Programa'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Tipo Programa',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Tipo Programa'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Coordinador',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Coordinador'),
                      ),
                    ),
                    GridColumn(
                      allowSorting: false,
                      allowFiltering: false,
                      width: 130,
                      columnName: 'Ver',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(''),
                      ),
                    ),
                    GridColumn(
                      allowSorting: false,
                      allowFiltering: false,
                      width: 130,
                      columnName: 'Editar',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(''),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          // Botón de imprimir y añadir
          if (!Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('Imprimir Reporte', () {}),
                const SizedBox(
                  width: defaultPadding,
                ),
                buildButton('Añadir', () {}),
              ],
            ),
          if (Responsive.isMobile(context))
            Center(
              child: Column(
                children: [
                  buildButton('Imprimir Reporte', () {}),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  buildButton('Añadir', () {}),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class FichasAdministradorDataGridSource extends DataGridSource {
  FichasAdministradorDataGridSource({required List<Fichas> fichas}) {
    _FichasAdministradorData = fichas.map<DataGridRow>((ficha) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Código', value: ficha.codigoFicha),
        DataGridCell<String>(
            columnName: 'Fecha Inicio', value: ficha.fechaInicio),
        DataGridCell<String>(
            columnName: 'Fecha Final', value: ficha.fechaFinal),
        DataGridCell<String>(columnName: 'Modalidad', value: ficha.modalidad),
        DataGridCell<String>(columnName: 'Estado', value: ficha.estado),
        DataGridCell<String>(columnName: 'Lider', value: ficha.liderFicha),
        DataGridCell<String>(columnName: 'Programa', value: ficha.programa),
        DataGridCell<String>(
            columnName: 'Tipo Programa', value: ficha.tipoPrograma),
        DataGridCell<String>(
            columnName: 'Coordinador', value: ficha.nombreCoordinador),
        DataGridCell<Widget>(
            columnName: 'Ver',
            value: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor)),
              child: const Text("Ver"),
            )),
        DataGridCell<Widget>(
            columnName: 'Editar',
            value: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor)),
              child: const Text("Editar"),
            )),
      ]);
    }).toList();
  }

  List<DataGridRow> _FichasAdministradorData = [];

  @override
  List<DataGridRow> get rows => _FichasAdministradorData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/fichas.svg",
                height: 30,
                width: 30,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF3333CC), BlendMode.srcIn),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(row.getCells()[0].value.toString()),
              ),
            ],
          ),
        ),
      ),
      for (int i = 1; i < row.getCells().length; i++)
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: (row.getCells()[i].value is Widget)
              ? row.getCells()[i].value
              : Text(row.getCells()[i].value.toString()), // Formato Texto
        ),
    ]);
  }
}
