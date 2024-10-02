import 'package:flutter/material.dart';
import 'package:horarios_cba/Dashboard/Listas/desplegableFichas.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/asigAulasCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/calendarioCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/fichasCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/instructoresCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/planeacionesCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/programacionesCoordinador.dart';
import 'package:horarios_cba/Dashboard/Screens/Dashboard/Components/Coordinador/programasCoordinador.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/constantsDesign.dart';

import 'Components/header.dart';

class DashboardScreenCoordinador extends StatefulWidget {
  final UsuarioModel usuarioAutenticado;
  const DashboardScreenCoordinador(
      {super.key, required this.usuarioAutenticado});

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
                        ProgramacionesCoordinador(
                          usuarioAutenticado: widget.usuarioAutenticado,
                        ),
                        const SizedBox(height: defaultPadding),
                        const PlaneacionesCoordinador(),
                        const SizedBox(height: defaultPadding),
                        FichasCoordinador(
                          usuarioAutenticado: widget.usuarioAutenticado,
                        ),
                        const SizedBox(height: defaultPadding),
                        InstructoresCoordinador(
                          usuarioAutenticado: widget.usuarioAutenticado,
                        ),
                        const SizedBox(height: defaultPadding),
                        AsignacionAulasCoordinador(
                          usuarioAutenticado: widget.usuarioAutenticado,
                        ),
                        const SizedBox(height: defaultPadding),
                        ProgramasCoordinador(
                          usuarioAutenticado: widget.usuarioAutenticado,
                        ),
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
