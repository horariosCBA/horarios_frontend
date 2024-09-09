import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';
import 'package:horarios_cba/dashboard/dashboard/screens/dashboard/components/favorito.dart';

// Contenedor el cual almacenara las cards de los sitios favoritos del usuario

class FavoritoDetails extends StatelessWidget {
  const FavoritoDetails({
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
      child: Container(
        height: 1250,
        child: const SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sitios Favoritos",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
                SizedBox(height: defaultPadding),
                FavoritoCard(),
              ],
            ),
        ),
      ),
    );
  }
}
