// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../source.dart';

// modelo para los usuarios
class UsuarioModel {
  /// Identificador único del usuario.
  final int id;

  /// Nombres del usuario.
  final String nombres;

  /// Apellidos del usuario.
  final String apellidos;

  /// Tipo de documento del usuario.
  final String tipoDocumento;

  /// Número de documento del usuario.
  final String numeroDocumento;

  /// Correo electronico del usuario.
  final String correoElectronico;

  /// Telefono del usuario.
  final String telefono;

  /// Celular del usuario.
  final String telefonoCelular;

  /// Rol del usuario.
  final String rol;

  // Cargo del usuario.
  final String cargo;

  /// Especialidad del usuario.
  final String especialidad;

  /// Foto del usuario.
  final String foto;

  /// Si es vocero el aprendiz.
  final bool vocero;

  // Titulacion del usuario.
  final String titulacion;

  // Estado del usuario.
  final bool estado;

  // En linea
  final bool enLinea;

  final String fechaRegistro;

  /// Crea un nuevo objeto [UsuarioModel] con los parámetros proporcionados.
  UsuarioModel({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.correoElectronico,
    required this.telefono,
    required this.telefonoCelular,
    required this.rol,
    required this.cargo,
    required this.especialidad,
    required this.foto,
    required this.vocero,
    required this.titulacion,
    required this.estado,
    required this.enLinea,
    required this.fechaRegistro,
  });

  // Método para actualizar el estado en línea en la base de datos
  Future<void> actualizarEstadoEnLinea(bool enLinea) async {
    String url = "$sourceApi/api/usuarios/$id/";

    final response = await http.patch(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, bool>{
        'enLinea': enLinea,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar el estado en línea');
    }
  }
}

/// Clase que representa un modelo de registro de usuario.
///
/// Esta clase contiene los atributos necesarios para el registro de un usuario,
/// como nombres, apellidos, correo electrónico, tipo de documento, número de documento,
/// y teléfono.
class UsuarioRegisterModel {
  /// Nombre del usuario.
  final String nombres;

  /// Apellidos del usuario.
  final String apellidos;

  /// Correo electrónico del usuario.
  final String correo;

  /// Tipo de documento del usuario.
  final String tipoDocumento;

  /// Número de documento del usuario.
  final String noDocumento;

  /// Teléfono del usuario.
  final String telefonoCelular;

  /// Crea un nuevo objeto [UsuarioRegisterModel] con los parámetros proporcionados.
  UsuarioRegisterModel({
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.tipoDocumento,
    required this.noDocumento,
    required this.telefonoCelular,
  });

  /// Factory para crear un [UsuarioRegisterModel] a partir de una lista de datos de CSV.
  ///
  /// Si el valor de algún atributo es nulo, se coloca una cadena vacía.
  /// Utiliza el método [toString] para convertir los valores de los atributos numéricos a cadenas.
  factory UsuarioRegisterModel.fromCsv(List<dynamic> row) {
    return UsuarioRegisterModel(
      nombres: row.isNotEmpty ? row[0].toString() : '',
      apellidos: row.length > 1 ? row[1].toString() : '',
      telefonoCelular: row.length > 2 ? row[2].toString() : '',
      tipoDocumento: row.length > 3 ? row[3].toString() : '',
      noDocumento: row.length > 4 ? row[4].toString() : '',
      correo: row.length > 5 ? row[5].toString() : '',
    );
  }

  /// Indica si todos los atributos del modelo son completos.
  ///
  /// Un modelo es completo si tiene valores para todos los atributos.
  bool get isComplete {
    return nombres.isNotEmpty &&
        apellidos.isNotEmpty &&
        telefonoCelular.isNotEmpty &&
        tipoDocumento.isNotEmpty &&
        noDocumento.isNotEmpty &&
        correo.isNotEmpty;
  }
}

/// Lista que almacena todos los objetos [UsuarioModel].
///
/// Esta lista se utiliza para almacenar todos los usuarios
/// que se han creado en la aplicación.
/// Los elementos de esta lista son de tipo [UsuarioModel].
/// Puedes agregar elementos a esta lista utilizando el método [add],
/// y puedes iterar sobre sus elementos utilizando un bucle [for] o el método [index].

List<UsuarioModel> usuarios = [];

// Método para obtener los datos de los usuarios
Future<List<UsuarioModel>> getUsuarios() async {
  /// URL para obtener los datos de los usuarios de la API.
  ///
  /// Esta URL se utiliza para realizar una solicitud GET a la API y obtener los datos de los usuarios.
  String url = "";

  // Construir la URL de la API utilizando la variable de configuración [sourceApi]
  url = "$sourceApi/api/usuarios/".trimRight();

  // Realizar una solicitud GET a la URL para obtener los datos de los usuarios
  // El método [http.get] devuelve una promesa que se resuelve en una instancia de la clase [http.Response].
  // La respuesta de la solicitud se almacena en la variable [response].
  final response = await http.get(Uri.parse(url));

  // Verificar el código de estado de la respuesta
  if (response.statusCode == 200) {
    // Limpiar la lista antes de llenarla con datos actualizados
    usuarios.clear();

    // Decodificar la respuesta JSON a UTF-8
    String responseBodyUtf8 = utf8.decode(response.bodyBytes);
    List<dynamic> decodedData = jsonDecode(responseBodyUtf8);

    // Llenar la lista con los datos decodificados
    for (var usuariodata in decodedData) {
      usuarios.add(
        UsuarioModel(
          id: usuariodata['id'] ?? 0,
          nombres: usuariodata['nombres'] ?? "",
          apellidos: usuariodata['apellidos'] ?? "",
          tipoDocumento: usuariodata['tipoDocumento'] ?? "",
          numeroDocumento: usuariodata['numeroDocumento'] ?? "",
          correoElectronico: usuariodata['correoElectronico'] ?? "",
          telefono: usuariodata['telefono'] ?? "",
          telefonoCelular: usuariodata['telefonoCelular'] ?? "",
          rol: usuariodata['rol'] ?? "",
          cargo: usuariodata['cargo'] ?? "",
          especialidad: usuariodata['especialidad'] ?? "",
          foto: usuariodata['foto'] ?? "",
          vocero: usuariodata['vocero'] ?? false,
          titulacion: usuariodata['titulacion'] ?? "",
          estado: usuariodata['estado'] ?? false,
          enLinea: usuariodata['enLinea'] ?? false,
          fechaRegistro: usuariodata['fechaRegistro'] ?? "",
        ),
      );
    }

    // Devolver la lista de usuarios
    return usuarios;
  } else {
    // Si la respuesta no fue exitosa, se lanza una excepción
    throw Exception(
        'Fallo la solicitud HTTP con código ${response.statusCode}');
  }
}
