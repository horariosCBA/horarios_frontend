// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/programacion.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProgramacionesAprendiz extends StatefulWidget {
  const ProgramacionesAprendiz({super.key});

  @override
  State<ProgramacionesAprendiz> createState() => _ProgramacionesAprendizState();
}

class _ProgramacionesAprendizState extends State<ProgramacionesAprendiz> {
  late ProgramacionesAprendizDataGridSource _dataGridSource;

  List<Programacion> programacion = [];

  @override
  void initState() {
    super.initState();

    programacion = listaProgramacion;

    _dataGridSource =
        ProgramacionesAprendizDataGridSource(programaciones: programacion);
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
            "Programaciones",
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
                      width: 150,
                      columnName: 'Planeación',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Planeación'),
                      ),
                    ),
                    GridColumn(
                      width: 150,
                      columnName: 'Resultado Aprendizaje',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Resultado Aprendizaje'),
                      ),
                    ),
                    GridColumn(
                      columnName: 'Instructor',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Instructor'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Ficha',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Ficha'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Trimestre',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Trimestre'),
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
                      columnName: 'Competencia',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Competencia'),
                      ),
                    ),
                    GridColumn(
                      width: 145,
                      columnName: 'Días Asignados',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Días Asignados'),
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
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
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

class ProgramacionesAprendizDataGridSource extends DataGridSource {
  ProgramacionesAprendizDataGridSource(
      {required List<Programacion> programaciones}) {
    _programacionData = programaciones.map<DataGridRow>((programacion) {
      return DataGridRow(cells: [
        DataGridCell<int>(
            columnName: 'Planeación', value: programacion.planeacion),
        DataGridCell<String>(
            columnName: 'Resultado Aprendizaje',
            value: programacion.nombreResultado),
        DataGridCell<String>(
            columnName: 'Instructor', value: programacion.nombreInstructor),
        DataGridCell<String>(
            columnName: 'Ficha', value: programacion.codigoFicha),
        DataGridCell<String>(
            columnName: 'Trimestre', value: programacion.nombreTrimestre),
        DataGridCell<String>(
            columnName: 'Programa', value: programacion.nombrePrograma),
        DataGridCell<String>(
            columnName: 'Competencia', value: programacion.nombreCompetencia),
        DataGridCell<String>(
            columnName: 'Días Asignados',
            value: "${programacion.diasAsignados} Días"),
        DataGridCell<Widget>(
            columnName: 'Ver',
            value: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor)),
              child: const Text("Ver"),
            )),
      ]);
    }).toList();
  }

  List<DataGridRow> _programacionData = [];

  @override
  List<DataGridRow> get rows => _programacionData;

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
                "assets/icons/programacion.svg",
                height: 30,
                width: 30,
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 206, 51, 204), BlendMode.srcIn),
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
