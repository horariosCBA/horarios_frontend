// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/Dashboard/Listas/aprendiz.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/PDF/InstructorPDF/pdfAprendicesInstructor.dart';
import 'package:horarios_cba/PDF/modalsPdf.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AprendicesInstructor extends StatefulWidget {
  final UsuarioModel usuarioAutenticado;
  const AprendicesInstructor({super.key, required this.usuarioAutenticado});

  @override
  State<AprendicesInstructor> createState() => _AprendicesInstructorState();
}

class _AprendicesInstructorState extends State<AprendicesInstructor> {
  late AprendicesInstructorDataGridSource _dataGridSource;

  List<Aprendiz> aprendicesInstructor = [];

  List<DataGridRow> registros = [];

  // Controlador del scroll.
  final ScrollController _scrollController1 = ScrollController();

  @override
  void initState() {
    super.initState();

    aprendicesInstructor = listaAprendiz;

    _dataGridSource = AprendicesInstructorDataGridSource(
      aprendices: aprendicesInstructor,
    );
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
            "Aprendices",
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
              child: Scrollbar(
                controller: _scrollController1,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController1,
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
                        columnName: 'Nombre Completo',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Nombre Completo'),
                        ),
                      ),
                      GridColumn(
                        width: 150,
                        columnName: 'Tipo Documento',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Tipo Documento'),
                        ),
                      ),
                      GridColumn(
                        width: 150,
                        columnName: 'Número Documento',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Número Documento'),
                        ),
                      ),
                      GridColumn(
                        columnName: 'Correo Electrónico',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Correo Electrónico'),
                        ),
                      ),
                      GridColumn(
                        width: 145,
                        columnName: 'Teléfono Celular',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Teléfono Celular'),
                        ),
                      ),
                      GridColumn(
                        width: 140,
                        columnName: 'Vocero',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Vocero'),
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
                        columnName: 'Lider Ficha',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const Text('Lider Ficha'),
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
                        width: 180,
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
          ),
          const SizedBox(
            height: defaultPadding,
          ),
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
                            builder: (context) => PdfAprendicesInstructorScreen(
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

class AprendicesInstructorDataGridSource extends DataGridSource {
  AprendicesInstructorDataGridSource({required List<Aprendiz> aprendices}) {
    _aprendicesInstructorData = aprendices.map<DataGridRow>((aprendiz) {
      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'Nombre Completo', value: aprendiz.nombresApellidos),
        DataGridCell<String>(
            columnName: 'Tipo Documento', value: aprendiz.tipoDocumento),
        DataGridCell<String>(
            columnName: 'Número Documento', value: aprendiz.numeroDocumento),
        DataGridCell<String>(
            columnName: 'Correo Electrónico',
            value: aprendiz.correoElectronico),
        DataGridCell<String>(
            columnName: 'Teléfono Celular', value: aprendiz.telefonoCelular),
        DataGridCell<String>(columnName: 'Vocero', value: aprendiz.vocero),
        DataGridCell<String>(columnName: 'Ficha', value: aprendiz.codigoFicha),
        DataGridCell<String>(
            columnName: 'Lider Ficha', value: aprendiz.liderFicha),
        DataGridCell<String>(columnName: 'Programa', value: aprendiz.programa),
        DataGridCell<String>(
            columnName: 'Tipo Programa', value: aprendiz.tipoPrograma),
      ]);
    }).toList();
  }

  List<DataGridRow> _aprendicesInstructorData = [];

  @override
  List<DataGridRow> get rows => _aprendicesInstructorData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    // Controlador del scroll.
    final ScrollController _scrollController2 = ScrollController();
    return DataGridRowAdapter(cells: [
      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Scrollbar(
          controller: _scrollController2,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController2,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/aprendiz2.svg",
                  height: 30,
                  width: 30,
                  colorFilter:
                      const ColorFilter.mode(Color(0xFFED3736), BlendMode.srcIn),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(row.getCells()[0].value.toString()),
                ),
              ],
            ),
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
