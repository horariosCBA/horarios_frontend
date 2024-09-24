// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/competencias.dart';
import 'package:horarios_cba/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompetenciasAdministrador extends StatefulWidget {
  const CompetenciasAdministrador({super.key});

  @override
  State<CompetenciasAdministrador> createState() =>
      _CompetenciasAdministradorState();
}

class _CompetenciasAdministradorState extends State<CompetenciasAdministrador> {
  late CompetenciasAdministradorDataGridSource _dataGridSource;

  List<Competencias> competenciasAdministrador = [];

  @override
  void initState() {
    super.initState();

    competenciasAdministrador = listaCompetencia;

    _dataGridSource = CompetenciasAdministradorDataGridSource(
        competencias: competenciasAdministrador);
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
            "Competencias",
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
                      columnName: 'Nombre',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Nombre'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Código',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Código'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Duración',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Duración'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Norma',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Norma'),
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

class CompetenciasAdministradorDataGridSource extends DataGridSource {
  CompetenciasAdministradorDataGridSource(
      {required List<Competencias> competencias}) {
    _competenciasAdministradorData =
        competencias.map<DataGridRow>((competencia) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Nombre', value: competencia.nombre),
        DataGridCell<String>(columnName: 'Código', value: competencia.codigo),
        DataGridCell<String>(
            columnName: 'Duración', value: "${competencia.duracion} Horas"),
        DataGridCell<String>(columnName: 'Norma', value: competencia.norma),
        DataGridCell<String>(
            columnName: 'Programa', value: competencia.programa),
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

  List<DataGridRow> _competenciasAdministradorData = [];

  @override
  List<DataGridRow> get rows => _competenciasAdministradorData;

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
                "assets/icons/competencias.svg",
                height: 30,
                width: 30,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF04B4AE), BlendMode.srcIn),
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
