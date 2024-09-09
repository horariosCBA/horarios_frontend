import 'package:flutter/material.dart';
import 'package:horarios_cba/Chat/screens/mobile_chat_screen.dart';
import 'package:horarios_cba/Models/mensajeModel.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/constantsDesign.dart';

// Lista de contactos.
class ContactsList extends StatefulWidget {
  // propiedades para poder generar la conversación
  final UsuarioModel usuarioAutenticado;
  final List<UsuarioModel> contactos;
  // constructor requiriendo el usuario autenticado y la lista de contactos
  const ContactsList(
      {super.key, required this.contactos, required this.usuarioAutenticado});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  // lista de mensajes
  List<MensajeModel> mensajes = [];
  // variable para controlar el estado de carga
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Cargar mensajes inicialmente.
    cargarMensajes();
    // Actualizar periódicamente.
    actualizarMensajesPeriodicamente();
  }

  // Cargar los mensajes.
  Future<void> cargarMensajes() async {
    // recibir los nuevos mensajes obtenidos de la API
    try {
      List<MensajeModel> nuevosMensajes = await getMensajes();
      if (mounted) {
        setState(() {
          mensajes = nuevosMensajes;
          isLoading = false;
        });
      }
      // Manejar error si es necesario
    } catch (error) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // Actualizar los mensajes periódicamente en un intervalo de tiempo.
  void actualizarMensajesPeriodicamente() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 1));
      cargarMensajes();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Si el estado de carga es verdadero, mostrar un indicador de carga.
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Si el estado de carga es falso, mostrar la lista de contactos.
    return SingleChildScrollView(
      child: Column(
        children: [
          // Buscar contactos
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: background1,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(Icons.search, size: 20),
                ),
                hintStyle: const TextStyle(fontSize: 14),
                hintText: 'Buscar o iniciar una nueva conversación',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
          // Lista de contactos
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.contactos.length,
              itemBuilder: (context, index) {
                // Obtener el último mensaje de la conversación entre el usuario autenticado y el contacto
                MensajeModel? ultimoMensaje = mensajes.lastWhere(
                  (mensaje) =>
                      (mensaje.usuarioReceptor ==
                              widget.usuarioAutenticado.id &&
                          mensaje.usuarioEmisor ==
                              widget.contactos[index].id) ||
                      (mensaje.usuarioEmisor == widget.usuarioAutenticado.id &&
                          mensaje.usuarioReceptor ==
                              widget.contactos[index].id),
                  orElse: () => MensajeModel(
                    id: 0,
                    usuarioReceptor: 0,
                    usuarioEmisor: 0,
                    contenido: '',
                    fechaEnviado: '',
                    fechaLeido: '',
                    imagen: false,
                    tipo: '',
                  ),
                );

                // Tarjeta del contacto
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navegar a la pantalla de la conversación
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MobileChatScreen(
                              usuario: widget.contactos[index],
                              usuarioAutenticado: widget.usuarioAutenticado,
                            ),
                          ),
                        );
                      },
                      // Nombre del contacto
                      child: ListTile(
                        title: Text(
                          "${widget.contactos[index].nombres} ${widget.contactos[index].apellidos}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        // Ultimo mensaje de la conversación
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            ultimoMensaje
                                    .imagen // Verificar si el último mensaje es una imagen
                                ? "Imagen"
                                : ultimoMensaje.contenido,
                            style: ultimoMensaje.fechaLeido == "" &&
                                    ultimoMensaje.usuarioReceptor ==
                                        widget.usuarioAutenticado
                                            .id // Verificar si el último mensaje fue leido
                                ? const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)
                                : const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        // Imagen del contacto
                        leading: Stack(
                          children: [
                            // Condicional para mostrar la imagen del contacto
                            if (widget.contactos[index].foto != '')
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  widget.contactos[index].foto,
                                ),
                                radius: 30,
                              )
                            // Si no hay imagen, mostrar un avatar de usuario
                            else
                              CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 20,
                                child: Text(
                                  widget.contactos[index].nombres[0]
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            // Verificar si el contacto se encuentra en línea
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: widget.contactos[index].enLinea
                                      ? primaryColor
                                      : Colors.grey,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Hora del último mensaje
                        trailing: Text(
                          formatHora(ultimoMensaje.fechaEnviado!),
                          style: ultimoMensaje.fechaLeido == "" &&
                                  ultimoMensaje.usuarioReceptor ==
                                      widget.usuarioAutenticado.id
                              ? const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)
                              : const TextStyle(
                                  color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey, indent: 85),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
