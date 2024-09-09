import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/reserva_anfitrion/sitioAnf.dart';

// Contenedor el cual encapsula la vista previa de todos los sitios del anfitrión

class MisSitios extends StatelessWidget {
  const MisSitios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: isDark?secondaryColor:const Color(0xFFFF2F0F2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mis Sitios",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 435,
            width: 400,
            child: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const SitioAnfCard();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
