// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horarios_cba/Dashboard/Listas/programa.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/PDF/AdministradorPDF/pdfProgramasAdministrador.dart';
import 'package:horarios_cba/PDF/modalsPdf.dart';
import 'package:horarios_cba/Programa/programaView.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProgramasAdministrador extends StatefulWidget {
  final UsuarioModel usuarioAutenticado;
  const ProgramasAdministrador({super.key, required this.usuarioAutenticado});

  @override
  State<ProgramasAdministrador> createState() => _ProgramasAdministradorState();
}

class _ProgramasAdministradorState extends State<ProgramasAdministrador> {
  late ProgramasAdministradorDataGridSource _dataGridSource;

  List<Programa> programaAdministrador = [];

  List<DataGridRow> registros = [];

  @override
  void initState() {
    super.initState();

    programaAdministrador = listaProgramas;

    _dataGridSource = ProgramasAdministradorDataGridSource(
        programas: programaAdministrador, context: context);
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
            "Programas",
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
                      width: 300,
                      columnName: 'Nombre',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Nombre'),
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
                      width: 150,
                      columnName: 'Duración Lectiva',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Duración Lectiva'),
                      ),
                    ),
                    GridColumn(
                      width: 150,
                      columnName: 'Duración Productiva',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Duración Productiva'),
                      ),
                    ),
                    GridColumn(
                      width: 150,
                      columnName: 'Duración Total',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Duración Total'),
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
                buildButton('Imprimir Reporte', () {
                  if (registros.isEmpty) {
                    noHayPDFModal(context);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PdfProgramasAdministradorScreen(
                                    usuario: widget.usuarioAutenticado,
                                    registros: registros)));
                  }
                }),
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
                  buildButton('Imprimir Reporte', () {
                    if (registros.isEmpty) {
                      noHayPDFModal(context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PdfProgramasAdministradorScreen(
                                      usuario: widget.usuarioAutenticado,
                                      registros: registros)));
                    }
                  }),
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

class ProgramasAdministradorDataGridSource extends DataGridSource {
  ProgramasAdministradorDataGridSource(
      {required List<Programa> programas, required BuildContext context}) {
    _programaAdministradorData = programas.map<DataGridRow>((programa) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'Nombre', value: programa.nombre),
        DataGridCell<String>(
            columnName: 'Fecha Inicio', value: programa.fechaInicio),
        DataGridCell<String>(
            columnName: 'Fecha Final', value: programa.fechaFinal),
        DataGridCell<String>(
            columnName: 'Duración Lectiva',
            value: "${programa.duracionLectiva} Horas"),
        DataGridCell<String>(
            columnName: 'Duración Productiva',
            value: "${programa.duracionProductiva} Horas"),
        DataGridCell<String>(
            columnName: 'Duración Total',
            value: "${programa.duracionTotal} Horas"),
        DataGridCell<Widget>(
            columnName: 'Ver',
            value: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProgramaView()));
              },
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

  List<DataGridRow> _programaAdministradorData = [];

  @override
  List<DataGridRow> get rows => _programaAdministradorData;

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
                "assets/icons/programas.svg",
                height: 30,
                width: 30,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF642EFE), BlendMode.srcIn),
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
