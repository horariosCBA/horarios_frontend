// ignore_for_file: use_full_hex_values_for_flutter_colors, file_names
import 'package:flutter/material.dart';
import 'package:horarios_cba/CSV/csvScreen.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/usuarios.dart';
import 'package:horarios_cba/responsive.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:universal_platform/universal_platform.dart';

class UsuariosAdministrador extends StatefulWidget {
  const UsuariosAdministrador({super.key});

  @override
  State<UsuariosAdministrador> createState() => _UsuariosAdministradorState();
}

class _UsuariosAdministradorState extends State<UsuariosAdministrador> {
  late UsuariosAdministradorDataGridSource _dataGridSource;

  List<Usuarios> usuariosAdministrador = [];

  @override
  void initState() {
    super.initState();

    usuariosAdministrador = listaUsuarios;

    _dataGridSource =
        UsuariosAdministradorDataGridSource(usuarios: usuariosAdministrador);
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
            "Usuarios",
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
                      width: 300,
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
                      columnName: 'Teléfono Celular',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Teléfono Celular'),
                      ),
                    ),
                    GridColumn(
                      width: 140,
                      columnName: 'Rol',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Rol'),
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
                      width: 150,
                      columnName: 'Fecha Registro',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text('Fecha Registro'),
                      ),
                    ),
                    GridColumn(
                      allowSorting: false,
                      allowFiltering: false,
                      columnName: 'Cambiar Rol',
                      label: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: const Text(''),
                      ),
                    ),
                    GridColumn(
                      allowSorting: false,
                      allowFiltering: false,
                      columnName: 'Cambiar Estado',
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
          if (UniversalPlatform.isIOS || UniversalPlatform.isAndroid)
            Center(
              child: Column(
                children: [
                  buildButton('Imprimir Reporte', () {}),
                ],
              ),
            )
          else if (!Responsive.isMobile(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton('Imprimir Reporte', () {}),
                const SizedBox(
                  width: defaultPadding,
                ),
                buildButton('Añadir', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UploadUsersCSV()));
                }),
              ],
            )
          else if (Responsive.isMobile(context))
            Center(
              child: Column(
                children: [
                  buildButton('Imprimir Reporte', () {}),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  buildButton('Añadir', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UploadUsersCSV()));
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class UsuariosAdministradorDataGridSource extends DataGridSource {
  UsuariosAdministradorDataGridSource({required List<Usuarios> usuarios}) {
    _usuariosAdministradorData = usuarios.map<DataGridRow>((usuario) {
      return DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'Nombre Completo', value: usuario.nombresApellidos),
        DataGridCell<String>(
            columnName: 'Tipo Documento', value: usuario.tipoDocumento),
        DataGridCell<String>(
            columnName: 'Número Documento', value: usuario.numeroDocumento),
        DataGridCell<String>(
            columnName: 'Correo Electrónico', value: usuario.correoElectronico),
        DataGridCell<String>(
            columnName: 'Teléfono Celular', value: usuario.telefonoCelular),
        DataGridCell<String>(columnName: 'Rol', value: usuario.rol),
        DataGridCell<String>(columnName: 'Estado', value: usuario.activo),
        DataGridCell<String>(
            columnName: 'Fecha Registro', value: usuario.fechaRegistro),
        DataGridCell<Widget>(
            columnName: 'Cambiar Rol',
            value: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor)),
              child: const Text("Cambiar Rol"),
            )),
        DataGridCell<Widget>(
            columnName: 'Cambiar Estado',
            value: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor)),
              child: const Text("Cambiar Estado"),
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

  List<DataGridRow> _usuariosAdministradorData = [];

  @override
  List<DataGridRow> get rows => _usuariosAdministradorData;

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
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 18,
                  child: Text(
                    row.getCells()[0].value[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
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
              ? row.getCells()[i].value // Texto normal
              : Text(row
                  .getCells()[i]
                  .value
                  .toString()), // Texto modificado para valores enteros
        ),
    ]);
  }
}
