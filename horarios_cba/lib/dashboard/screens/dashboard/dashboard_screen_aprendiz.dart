import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/listas/desplegableFichas.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/aprendiz/calendarioAprendiz.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/aprendiz/fichasAprendiz.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/aprendiz/programacionesAprendiz.dart';
import 'components/header.dart';

class DashboardScreenAprendiz extends StatefulWidget {
  const DashboardScreenAprendiz({super.key});

  @override
  State<DashboardScreenAprendiz> createState() =>
      _DashboardScreenAprendizState();
}

class _DashboardScreenAprendizState extends State<DashboardScreenAprendiz> {
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
                              "Panel Aprendiz",
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
                        const CalendarioAprendiz(),
                        const SizedBox(height: defaultPadding),
                        const ProgramacionesAprendiz(),
                        const SizedBox(height: defaultPadding),
                        const FichasAprendiz(),
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
