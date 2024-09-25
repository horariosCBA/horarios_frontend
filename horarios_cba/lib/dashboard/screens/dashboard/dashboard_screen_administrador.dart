import 'package:flutter/material.dart';
import 'package:horarios_cba/Models/usuarioModel.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/aprendicesAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/asigAulasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/aulasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/competenciasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/coordinadoresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/fichasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/instructoresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/programasAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/resultadosAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/trimestresAdministrador.dart';
import 'package:horarios_cba/dashboard/screens/dashboard/components/Administrador/usuariosAdministrador.dart';

import 'components/header.dart';

class DashboardScreenAdministrador extends StatelessWidget {
  final UsuarioModel usuarioAutenticado;
  const DashboardScreenAdministrador(
      {super.key, required this.usuarioAutenticado});

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
              ResultadosAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(height: defaultPadding),
              TrimestresAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(height: defaultPadding),
              AsignacionAulasAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(height: defaultPadding),
              AprendicesAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(height: defaultPadding),
              InstructoresAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(height: defaultPadding),
              FichasAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              CoordinadoresAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              CompetenciasAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              ProgramasAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              const AulasAdministrador(),
              const SizedBox(
                height: defaultPadding,
              ),
              UsuariosAdministrador(
                usuarioAutenticado: usuarioAutenticado,
              ),
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
