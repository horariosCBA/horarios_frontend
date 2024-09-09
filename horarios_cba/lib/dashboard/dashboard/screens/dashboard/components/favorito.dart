import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';

// Card donde estaran los sitios favoritos del usuario

class FavoritoCard extends StatelessWidget {
  const FavoritoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: primaryColor, blurRadius: 30, offset: Offset(10, 10))
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: NetworkImage(
                        "https://hips.hearstapps.com/hmg-prod/images/casa-de-diseno-contemporaneo26-1637602658.jpg?crop=1xw:0.9066731141199227xh;center,top&resize=1200:*"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Guatavita, Colombia",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Text(
                  "4.9",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "\$311,856 COP",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10,),
            const Text("noche"),
          ],
        ),
      ],
    );
  }
}
