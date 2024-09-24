
import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/desplegableFichas.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/asigAulasCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/calendarioCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/fichasCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/instructoresCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/planeacionesCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/programacionesCoordinador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/coordinador/programasCoordinador.dart';


import 'components/header.dart';

class DashboardScreenCoordinador extends StatefulWidget {
  const DashboardScreenCoordinador({super.key});

  @override
  State<DashboardScreenCoordinador> createState() =>
      _DashboardScreenCoordinadorState();
}

class _DashboardScreenCoordinadorState
    extends State<DashboardScreenCoordinador> {
  int? _fichaInicial = fichasDesplegables.first.id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 30.0, right: 30.0, top: 16.0, bottom: 16.0),
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Panel Coordinador",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontFamily: 'Calibri-Bold'),
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Elija una ficha',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: DropdownButton<int>(
                                        dropdownColor: background1,
                                        isExpanded: true,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        value: _fichaInicial,
                                        items: fichasDesplegables
                                            .map((Desplegablefichas item) {
                                          return DropdownMenuItem<int>(
                                            value: item.id,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.codigo,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                Text(
                                                  item.programa,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (int? value) {
                                          setState(() {
                                            _fichaInicial =
                                                value; // Actualiza el valor seleccionado.
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: defaultPadding),
                        const CalendarioCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const ProgramacionesCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const PlaneacionesCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const FichasCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const InstructoresCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const AsignacionAulasCoordinador(),
                        const SizedBox(height: defaultPadding),
                        const ProgramasCoordinador(),
                        const SizedBox(height: defaultPadding),
                      ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
