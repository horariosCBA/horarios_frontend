// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names, file_names, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:horarios_cba/AsignacionCoordinador/desplegablesAsignacionCoordinador.dart';
import 'package:horarios_cba/AsignacionCoordinador/tablaCoordinador.dart';
import 'package:horarios_cba/constantsDesign.dart';

class AsignacionCoordinadorFormulario extends StatefulWidget {
  const AsignacionCoordinadorFormulario({super.key});

  @override
  State<AsignacionCoordinadorFormulario> createState() =>
      _AsignacionCoordinadorFormularioState();
}

class _AsignacionCoordinadorFormularioState
    extends State<AsignacionCoordinadorFormulario> {
  TextEditingController _coordinadorController = TextEditingController();

  List<Coordinador> coordinadoresFiltrados = [];

  @override
  void initState() {
    super.initState();
    // Inicializa la lista filtrada con todas las coordinadores al principio.
    coordinadoresFiltrados = listaCoordinadores;
  }

  void _filtrarCoordinadores(String query) {
    if (query.isNotEmpty) {
      setState(() {
        coordinadoresFiltrados = listaCoordinadores
            .where((coordinador) =>
                coordinador.titulo.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        coordinadoresFiltrados = listaCoordinadores;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/img/fondoFormularioCoordinador.webp'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                // Capa verde semitransparente
                Container(
                  color: primaryColor.withOpacity(
                      0.5), // Ajusta el nivel de opacidad según sea necesario
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: // Botón de retroceso
                      GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: background1,
                      ),
                      child: Center(
                        child: Transform.translate(
                          offset:
                              const Offset(-2, 0), // adjust the offset as needed
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: primaryColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color(0x2ADAD7D7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Center(
                                  child: SingleChildScrollView(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Asignación Coordinadores",
                                          style: TextStyle(
                                              fontSize: 45,
                                              fontFamily: 'Calibri-Bold',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        Tooltip(
                                          message: "Se requiere este campo.",
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border:
                                                  Border.all(color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 2.0, right: 2.0),
                                              child: TextFormField(
                                                controller:
                                                    _coordinadorController,
                                                obscureText: false,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  labelStyle: const TextStyle(
                                                      fontSize: 13),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  hintText: "Coordinador",
                                                  fillColor: Colors.grey[200],
                                                  filled: true,
                                                ),
                                                onChanged: (value) {
                                                  _filtrarCoordinadores(value);
                                                },
                                                // Validación del campo
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Se requiere este campo.";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        // Mostramos la lista filtrada si hay resultados
                                        if (coordinadoresFiltrados.isNotEmpty)
                                          Container(
                                            height:
                                                150, // Limitamos el tamaño de la lista desplegable
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  coordinadoresFiltrados.length,
                                              itemBuilder: (context, index) {
                                                final coordinador =
                                                    coordinadoresFiltrados[index];
                                                return ListTile(
                                                  title: Text(
                                                    coordinador.titulo,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    coordinador.subtitulo,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      _coordinadorController
                                                              .text =
                                                          coordinador.titulo;
                                                      // Oculta el desplegable después de seleccionar
                                                      coordinadoresFiltrados = [];
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        const SizedBox(height: 15),
                                        const TablaCoordinador(),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                              Expanded(
                                  flex: -1,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 90,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 8.0,
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Guardar",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )))
                            ],
                          )),
                    )),
              ],
            )),
      ),
    );
  }
}
