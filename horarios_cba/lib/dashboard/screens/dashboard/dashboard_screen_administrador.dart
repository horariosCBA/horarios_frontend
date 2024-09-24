
import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/aprendicesAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/asigAulasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/aulasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/competenciasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/coordinadoresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/fichasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/instructoresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/programasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/resultadosAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/trimestresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/administrador/usuariosAdministrador.dart';


import 'components/header.dart';

class DashboardScreenAdministrador extends StatelessWidget {
  const DashboardScreenAdministrador({super.key});

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
                              "Panel Administrador",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontFamily: 'Calibri-Bold'),
                            ),
                          ],
                        ),
                      ])),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const ResultadosAdministrador(),
              const SizedBox(height: defaultPadding),
              const TrimestresAdministrador(),
              const SizedBox(height: defaultPadding),
              const AsignacionAulasAdministrador(),
              const SizedBox(height: defaultPadding),
              const AprendicesAdministrador(),
              const SizedBox(height: defaultPadding),
              const InstructoresAdministrador(),
              const SizedBox(height: defaultPadding),
              const FichasAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              const CoordinadoresAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              const CompetenciasAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              const ProgramasAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              const AulasAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              const UsuariosAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
