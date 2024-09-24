// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/asignacion_aulas.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AsignacionAulasCoordinador extends StatefulWidget {
  const AsignacionAulasCoordinador({super.key});

  @override
  State<AsignacionAulasCoordinador> createState() =>
      _AsignacionAulasCoordinadorState();
}

class _AsignacionAulasCoordinadorState
    extends State<AsignacionAulasCoordinador> {
  late AsignacionAulasCoordinadorDataGridSource _dataGridSource;

  List<AsignacionAulas> asignacionesCoordinador = [];

  @override
  void initState() {
    super.initState();

    asignacionesCoordinador = listaAsignacionAulas;

    _dataGridSource = AsignacionAulasCoordinadorDataGridSource(
        asignaciones: asignacionesCoordinador);
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
            "Aulas",
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
                      width: 140,
                      columnName: 'Aula',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Aula'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Estado Aula',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Estado Aula'),
                      ),
                    ),
                    GridColumn(
                      width: 145,
                      columnName: 'Capacidad',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Capacidad'),
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
                      width: 150,
                      columnName: 'Tipo Programa',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Tipo Programa'),
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
          // Botón de imprimir
          Center(
            child: Column(
              children: [
                buildButton('Imprimir Reporte', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AsignacionAulasCoordinadorDataGridSource extends DataGridSource {
  AsignacionAulasCoordinadorDataGridSource(
      {required List<AsignacionAulas> asignaciones}) {
    _asignacionesCoordinadorData = asignaciones.map<DataGridRow>((asignacion) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Aula', value: asignacion.aula),
        DataGridCell<String>(
            columnName: 'Estado Aula', value: asignacion.estadoAula),
        DataGridCell<String>(
            columnName: 'Capacidad', value: "${asignacion.capacidad} Personas"),
        DataGridCell<String>(
            columnName: 'Programa', value: asignacion.nombrePrograma),
        DataGridCell<String>(
            columnName: 'Tipo Programa', value: asignacion.tipoPrograma),
      ]);
    }).toList();
  }

  List<DataGridRow> _asignacionesCoordinadorData = [];

  @override
  List<DataGridRow> get rows => _asignacionesCoordinadorData;

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
                "assets/icons/asignacion aulas.svg",
                height: 30,
                width: 30,
                colorFilter:
                    const ColorFilter.mode(Color(0xFFA16DCC), BlendMode.srcIn),
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
