// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:horarios_cba/Dashboard/Listas/aulas.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Administrador/aulaCard.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/responsive.dart';


// Vista que muestra las tarjetas de aulas, adaptándose a diferentes dispositivos.
class AulasAdministrador extends StatelessWidget {
  const AulasAdministrador({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Encabezado de las tarjetas de aulas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Aulas",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontFamily: 'Calibri-Bold'),
            ),
            // Botón "Añadir Aula" visible solo en dispositivos no móviles
            if (!Responsive.isMobile(context))
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      botonClaro, // Verde más claro
                      botonOscuro, // Verde más oscuro
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: botonSombra, // Sombra en tono verde claro
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Añadir',
                          style: TextStyle(
                            color: background1,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Calibri-Bold',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        // Espacio adicional en dispositivos móviles
        if (Responsive.isMobile(context))
          const SizedBox(height: defaultPadding),
        // Botón "Añadir Aula" visible solo en dispositivos móviles
        if (Responsive.isMobile(context))
          Center(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    botonClaro, // Verde más claro
                    botonOscuro, // Verde más oscuro
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: botonSombra, // Sombra en tono verde claro
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Añadir',
                        style: TextStyle(
                          color: background1,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Calibri-Bold',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        // Espacio adicional antes del listado de tarjetas de aulas
        const SizedBox(height: defaultPadding),
        // Contenedor que muestra las tarjetas de aulas
        SizedBox(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listaAulas.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: AulaCard(
                aula: listaAulas[index],
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
