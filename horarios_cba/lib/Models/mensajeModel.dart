// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../source.dart';

// modelo para los mensajes
class MensajeModel {
  // id del mensaje
  final int id;
  // id del usuario receptor
  final int usuarioReceptor;
  // id del usuario emisor
  final int usuarioEmisor;
  // fecha de envio
  final String? fechaEnviado;
  // fecha de lectura
  String fechaLeido;
  // bandera si el mensaje es una imagen
  final bool imagen;
  // contenido del mensaje
  final String contenido;
  // tipo del mensaje
  final String tipo;

  // constructor de la clase requiriendo la mayoria de atributos
  MensajeModel(
      {required this.id,
      required this.usuarioReceptor,
      required this.usuarioEmisor,
      this.fechaEnviado,
      required this.fechaLeido,
      required this.imagen,
      required this.contenido,
      required this.tipo});

  // factory para convertir el json en una instancia de la clase
  factory MensajeModel.fromJson(Map<String, dynamic> json) {
    return MensajeModel(
      id: json['id'],
      usuarioEmisor: json['usuarioEmisor'],
      usuarioReceptor: json['usuarioReceptor'],
      fechaEnviado: json['fechaEnviado'],
      fechaLeido: json['fechaLeido'] ?? "",
      imagen: json['imagen'],
      contenido: json['contenido'],
      tipo: json['tipo'],
    );
  }

  // convertir la instancia de la clase en un json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'usuarioEmisor': usuarioEmisor,
      'usuarioReceptor': usuarioReceptor,
      'fechaEnviado': fechaEnviado,
      'fechaLeido': fechaLeido,
      'imagen': imagen,
      'contenido': contenido,
      'tipo': tipo,
    };
  }
}

// lista de mensajes
List<MensajeModel> mensajes = [];

// funcion para obtener los mensajes de la base de datos
Future<List<MensajeModel>> getMensajes() async {
  // URL para obtener los datos de los mensajes de la API.
  String url = "";

  url = "$sourceApi/api/mensajes/".trimRight();

  // Realizar una solicitud GET a la URL para obtener los datos de los mensajes
  final response = await http.get(Uri.parse(url));

  // Verificar el código de estado de la respuesta
  if (response.statusCode == 200) {
    // Limpiar la lista antes de llenarla con datos actualizados
    mensajes.clear();

    // Decodificar la respuesta JSON a UTF-8
    String responseBodyUtf8 = utf8.decode(response.bodyBytes);

    List<dynamic> decodedData = jsonDecode(responseBodyUtf8);

    // Llenar la lista con los datos decodificados
    for (var mensajedata in decodedData) {
      mensajes.add(MensajeModel(
          id: mensajedata['id'] ?? 0,
          usuarioReceptor: mensajedata['usuarioReceptor'] ?? 0,
          usuarioEmisor: mensajedata['usuarioEmisor'] ?? 0,
          fechaEnviado: mensajedata['fechaEnviado'] ?? "",
          fechaLeido: mensajedata['fechaLeido'] ?? "",
          imagen: mensajedata['imagen'] ?? false,
          contenido: mensajedata['contenido'] ?? "",
          tipo: mensajedata['tipo'] ?? ""));
    }

    // retornar la lista de mensajes
    return mensajes;
  } else {
    // Lanzar una excepción si la respuesta no es exitosa
    throw Exception(
        'Fallo la solicitud HTTP con código ${response.statusCode}');
  }
}
