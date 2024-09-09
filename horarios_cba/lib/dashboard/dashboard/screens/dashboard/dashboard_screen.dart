import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/cards.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/misPagos.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/misSitios.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/reserva_activa_anf.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/reserva_cancelada_anf.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/reserva_finalizada_anf.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/reserva_pendiente_anf.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/Sitios.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/listaUsuarios_todo.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/reserva_activa_todo.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/reserva_cancelada_todo.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/reserva_finalizada_todo.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/reserva_pendiente_todo.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_todo/totalPagos.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_usuario/reserva_cancelada_usu.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_usuario/reserva_finalizada_usu.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_usuario/reserva_pendiente_usu.dart';
import 'package:horarios_cba/responsive.dart';
import 'components/header.dart';

import 'components/reserva_usuario/reserva_activa_usu.dart';
import 'components/favorito_details.dart';

// Vista donde se llaman todos los componentes del dashboard y tambien direcciona estos componentes para que
// tengan diferentes comportamientos al momento de adaptarlos a diferentes dispositivos

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  child: Column(
                    children: [
                      Container(
                        height: 1300,
                        child: const SingleChildScrollView(
                          child: Column(
                            children: [
                              Cards(),
                              SizedBox(height: defaultPadding),
                              ReservaActivaU(),
                              SizedBox(height: defaultPadding),
                              ReservaCanceladaU(),
                              SizedBox(height: defaultPadding),
                              ReservaPendienteU(),
                              SizedBox(height: defaultPadding),
                              ReservaFinalizadaU(),
                              SizedBox(height: defaultPadding),
                              MisSitios(),
                              SizedBox(height: defaultPadding),
                              PagosAnf(),
                              SizedBox(height: defaultPadding),
                              ReservaActivaA(),
                              SizedBox(height: defaultPadding),
                              ReservaCanceladaA(),
                              SizedBox(height: defaultPadding),
                              ReservaPendienteA(),
                              SizedBox(height: defaultPadding),
                              ReservaFinalizadaA(),
                              SizedBox(height: defaultPadding),
                              Sitios(),
                              SizedBox(height: defaultPadding),
                              PagosTotal(),
                              SizedBox(height: defaultPadding),
                              ListaUsuario(),
                              SizedBox(height: defaultPadding),
                              ReservaActivaT(),
                              SizedBox(height: defaultPadding),
                              ReservaCanceladaT(),
                              SizedBox(height: defaultPadding),
                              ReservaPendienteT(),
                              SizedBox(height: defaultPadding),
                              ReservaFinalizadaT(),
                            ],
                          ),
                        ),
                      ),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const FavoritoDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: FavoritoDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
