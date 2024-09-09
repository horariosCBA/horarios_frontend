import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';

// Clase SenderMessageCard, que representa una tarjeta de mensaje recibido.
class SenderMessageCard extends StatefulWidget {
  // contructor requiriendo las propiedades
  const SenderMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.imagen,
  });

  // Propiedades
  final String message;
  final String date;
  final bool imagen;

  @override
  State<SenderMessageCard> createState() => _SenderMessageCardState();
}

class _SenderMessageCardState extends State<SenderMessageCard> {
  // Diseño de la tarjeta de mensaje recibido
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: primaryColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                // Contenido de la tarjeta
                child: widget.imagen // Verifica si el mensaje es una imagen
                    ? GestureDetector(
                        onTap: () {
                          modalAmpliacion(
                              context, widget.message); // amplia la imagen
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            widget.message,
                            fit: BoxFit.fill, // Ajuste de la imagen
                            width: 200,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              // Error al cargar la imagen
                              return const Text(
                                "Error al cargar la imagen.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    // Contenido de la tarjeta si no es una imagen
                    : Text(
                        widget.message,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
              ),

              // Fecha de envio del mensaje
              Positioned(
                bottom: 2,
                right: 10,
                child: Text(
                  formatHora(widget.date),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
