import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';

// diseño de la card de vista previa de todos los sitios del anfitrion

class SitioAnfCard extends StatelessWidget {
  const SitioAnfCard({
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
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/fc/c6/ba/briceno-18-campo-de-golf.jpg?w=1200&h=1200&s=1"),
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
              "Sopo, Colombia",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Text(
                  "4.8",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "\$210,856 COP",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("noche"),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: primaryColor,
                    offset: Offset(
                      2.0,
                      2.0,
                    ),
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: primaryColor,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                color: Colors.white,
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, size: 25, color: Colors.black)),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: primaryColor,
                      offset: Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: primaryColor,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  color: Colors.white,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 25, color: Colors.black)))
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
