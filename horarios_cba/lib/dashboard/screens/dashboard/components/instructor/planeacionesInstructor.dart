// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:horarios_cba/Dashboard/Listas/planeaciones.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Instructor/planeacionCardInstructor.dart';
import 'package:horarios_cba/constantsDesign.dart';

// Vista que muestra las tarjetas de planeaciones, adaptándose a diferentes dispositivos.
class PlaneacionesInstructor extends StatelessWidget {
  const PlaneacionesInstructor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Encabezado de las tarjetas de planeaciones
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Planeaciones Pedagógicas",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontFamily: 'Calibri-Bold'),
            ),
          ],
        ),
        // Espacio adicional antes del listado de tarjetas de planeaciones
        const SizedBox(height: defaultPadding),
        // Contenedor que muestra las tarjetas de planeaciones
        SizedBox(
          height: 600,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listaPlaneaciones.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: PlaneacionCardInstructor(
                planeacion: listaPlaneaciones[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
