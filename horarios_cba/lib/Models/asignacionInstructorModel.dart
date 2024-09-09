// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../source.dart';

// modelo para las asignacion de instructores
class AsignacionInstructorModel {
  // id de la asignacion
  final int id;
  // id del usuario instructor
  final int usuarioInstructor;
  // id del usuario coordinador
  final int usuarioCoordinador;

  // constructor requiriendo todos los atributos
  AsignacionInstructorModel({
    required this.id,
    required this.usuarioInstructor,
    required this.usuarioCoordinador,
  });
}

// lista de la asignacion de instructores
List<AsignacionInstructorModel> asignacionesInstructor = [];

// funcion para obtener las asignaciones de instructores de la base de datos
Future<List<AsignacionInstructorModel>> getAsignacionesInstructor() async {
  // URL para obtener los datos de las asignaciones de instructores de la API.
  String url = "";

  url = "$sourceApi/api/asignacion_instructor/".trimRight();

  // Realizar una solicitud GET a la URL para obtener los datos de las asignaciones de instructores
  final response = await http.get(Uri.parse(url));

  // Verificar el código de estado de la respuesta
  if (response.statusCode == 200) {
    // Limpiar la lista antes de llenarla con datos actualizados
    asignacionesInstructor.clear();

    // Decodificar la respuesta JSON a UTF-8
    String responseBodyUtf8 = utf8.decode(response.bodyBytes);
    List<dynamic> decodedData = jsonDecode(responseBodyUtf8);

    // Llenar la lista con los datos decodificados
    for (var asignacionInstructordata in decodedData) {
      asignacionesInstructor.add(AsignacionInstructorModel(
        id: asignacionInstructordata['id'] ?? 0,
        usuarioInstructor: asignacionInstructordata['usuarioInstructor'] ?? 0,
        usuarioCoordinador: asignacionInstructordata['usuarioCoordinador'] ?? 0,
      ));
    }

    // retornar la lista de asignaciones de instructores
    return asignacionesInstructor;
  } else {
    // Si la respuesta no es exitosa, lanza una excepción
    throw Exception(
        'Fallo la solicitud HTTP con código ${response.statusCode}');
  }
}
