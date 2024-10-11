// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/Dashboard/Listas/trimestres.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/PDF/CoordinadorPDF/pdfTrimestresCoordinador.dart';
import 'package:horarios_cba/PDF/modalsPdf.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TrimestresCoordinador extends StatefulWidget {
  final UsuarioModel usuarioAutenticado;
  const TrimestresCoordinador({super.key, required this.usuarioAutenticado});

  @override
  State<TrimestresCoordinador> createState() => _TrimestresCoordinadorState();
}

class _TrimestresCoordinadorState extends State<TrimestresCoordinador> {
  late TrimestresCoordinadorDataGridSource _dataGridSource;

  List<Trimestres> trimestresCoordinador = [];

  List<DataGridRow> registros = [];

  @override
  void initState() {
    super.initState();

    trimestresCoordinador = listaTrimestres;

    _dataGridSource =
        TrimestresCoordinadorDataGridSource(trimestres: trimestresCoordinador);
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
            "Trimestres",
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
                  showHorizontalScrollbar: true,
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
                      List<DataGridRow> removedRows) {
                    setState(() {
                      // Añadir filas a la lista de registros seleccionados
                      registros.addAll(addedRows);

                      // Eliminar filas de la lista de registros seleccionados
                      for (var row in removedRows) {
                        registros.remove(row);
                      }
                    });
                  },
                  // Columnas de la tabla
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'Código Ficha',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Código Ficha'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Número Trimestre',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Número Trimestre'),
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
                      columnName: 'Fecha Fin',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Fecha Fin'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Estado',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Estado'),
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
                buildButton('Imprimir Reporte', () {
                  if (registros.isEmpty) {
                    noHayPDFModal(context);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PdfTrimestresCoordinadorScreen(
                                    usuario: widget.usuarioAutenticado,
                                    registros: registros)));
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrimestresCoordinadorDataGridSource extends DataGridSource {
  TrimestresCoordinadorDataGridSource({required List<Trimestres> trimestres}) {
    _trimestresCoordinadorData = trimestres.map<DataGridRow>((trimestre) {
      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'Código Ficha', value: trimestre.ficha),
        DataGridCell<String>(
            columnName: 'Número Trimestre', value: trimestre.numeroTrimestre),
        DataGridCell<String>(
            columnName: 'Fecha Inicio', value: trimestre.fechaInicio),
        DataGridCell<String>(
            columnName: 'Fecha Fin', value: trimestre.fechaFinal),
        DataGridCell<String>(columnName: 'Estado', value: trimestre.estado),
      ]);
    }).toList();
  }

  List<DataGridRow> _trimestresCoordinadorData = [];

  @override
  List<DataGridRow> get rows => _trimestresCoordinadorData;

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
                "assets/icons/trimestre.svg",
                height: 30,
                width: 30,
                colorFilter:
                    const ColorFilter.mode(Color(0xFFF781BE), BlendMode.srcIn),
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
