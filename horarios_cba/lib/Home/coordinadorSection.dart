// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:horarios_cba/Home/coordinadorCard.dart';
import 'package:horarios_cba/constantsDesign.dart';

// Clase CoordinadorSection, que representa la sección de coordinadores.
class CoordinadorSection extends StatefulWidget {
  const CoordinadorSection({super.key});

  @override
  State<CoordinadorSection> createState() => _CoordinadorSectionState();
}

class _CoordinadorSectionState extends State<CoordinadorSection> {
  @override
  Widget build(BuildContext context) {
    // Contenedor para la sección de coordinadores.
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Coordinadores",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Calibri-Bold',
                shadows: [
                  Shadow(
                    color: Colors.black
                        .withOpacity(0.5), // Color y opacidad de la sombra
                    offset: const Offset(2,
                        2), // Desplazamiento de la sombra (horizontal, vertical)
                    blurRadius: 3, // Radio de desenfoque de la sombra
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        // Lista de tarjetas de coordinadores.
        SizedBox(
          height: 350,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CoordinadorCard();
            },
          ),
        ),
      ],
    );
  }
}
