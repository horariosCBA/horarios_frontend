// ignore_for_file:avoid_print, use_build_context_synchronously, prefer_final_fields, avoid_unnecessary_containers, file_names
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:horarios_cba/Horario/Crear/desplegablesHorario.dart';
import 'package:horarios_cba/constantsDesign.dart';

class HorarioFormularioCrear extends StatefulWidget {
  const HorarioFormularioCrear({super.key});

  @override
  State<HorarioFormularioCrear> createState() => _HorarioFormularioCrearState();
}

class _HorarioFormularioCrearState extends State<HorarioFormularioCrear> {
  TextEditingController _programacionController = TextEditingController();
  TextEditingController _aulaController = TextEditingController();
  TextEditingController _diaController = TextEditingController();
  TextEditingController _horaInicioController = TextEditingController();
  TextEditingController _horaFinController = TextEditingController();

  String? _programacionSeleccionada;

  String? _aulaSeleccionada;

  String? _diaSeleccionado;

  Future<void> _selectHoraInicio(BuildContext context) async {
    // Se muestra un diálogo para seleccionar la hora
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        // Personaliza el estilo del diálogo para que coincida con el resto del app
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            colorScheme: const ColorScheme.light(primary: primaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    // Si se seleccionó una hora válida, se almacena en _selectedTime
    if (pickedTime != null) {
      setState(() {
        // Se almacena la hora seleccionada en el controlador
        final now = DateTime.now();
        final selectedDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _horaInicioController.text = selectedDateTime.toString();
      });
    }
  }

  Future<void> _selectHoraFin(BuildContext context) async {
    // Se muestra un diálogo para seleccionar la hora
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        // Personaliza el estilo del diálogo para que coincida con el resto del app
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            colorScheme: const ColorScheme.light(primary: primaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    // Si se seleccionó una hora válida, se almacena en _selectedTime
    if (pickedTime != null) {
      setState(() {
        // Se almacena la hora seleccionada en el controlador
        final now = DateTime.now();
        final selectedDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _horaFinController.text = selectedDateTime.toString();
      });
    }
  }

  // Liberar recursos al cerrar la pantalla
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, responsive) {
          // Verifica si el ancho de la pantalla es menor o igual 970
          if (responsive.maxWidth <= 970) {
            return Column(
              children: [
                Expanded(
                    child: Container(
                  child: Stack(children: [
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
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Transform.translate(
                              offset: const Offset(
                                  -2, 0), // adjust the offset as needed
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: background1,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Agregar Horario",
                                        style: TextStyle(
                                            fontFamily: 'Calibri-Bold',
                                            fontSize: 40,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 30),
                                      Form(
                                          child: Column(
                                        children: [
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Programación",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: programacionesHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      4.0), // Espaciado opcional
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Instructor: ${item.titulo}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Planeación: ${item.subtitulo}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value:
                                                      _programacionSeleccionada,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _programacionSeleccionada =
                                                          value;
                                                      _programacionController
                                                              .text =
                                                          _programacionSeleccionada!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_programacionSeleccionada ==
                                                            null ||
                                                        _programacionSeleccionada!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 60,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Aula",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: aulasHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Text(
                                                              item.titulo,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value: _aulaSeleccionada,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _aulaSeleccionada = value;
                                                      _aulaController.text =
                                                          _aulaSeleccionada!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_aulaSeleccionada ==
                                                            null ||
                                                        _aulaSeleccionada!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Día",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: diasHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Text(
                                                              item.titulo,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value: _diaSeleccionado,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _diaSeleccionado = value;
                                                      _diaController.text =
                                                          _diaSeleccionado!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_diaSeleccionado ==
                                                            null ||
                                                        _diaSeleccionado!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _selectHoraInicio(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Expanded(
                                                          child: Text(
                                                            "Seleccione hora de inicio",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "La hora seleccionada es: ${formatHora(_horaInicioController.text)}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _selectHoraFin(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Expanded(
                                                          child: Text(
                                                            "Seleccione hora de finalización",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "La hora seleccionada es: ${formatHora(_horaFinController.text)}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: Image.asset(
                                              "assets/img/logo.png",
                                              width: 100,
                                              height: 100,
                                              color: primaryColor,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Vista por defecto
            return Column(
              children: [
                Expanded(
                    child: Container(
                  child: Stack(children: [
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
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Transform.translate(
                              offset: const Offset(
                                  -2, 0), // adjust the offset as needed
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: background1,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Container(
                      width: 950,
                      height: 550,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      child: Row(
                        children: [
                          // Vista previa de la imagen seleccionada
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/img/fondoFormularioHorario.webp'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Agregar Horario",
                                      style: TextStyle(
                                          fontFamily: 'Calibri-Bold',
                                          fontSize: 40,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 30),
                                    Form(
                                      child: Column(
                                        children: [
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Programación",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: programacionesHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      4.0), // Espaciado opcional
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Instructor: ${item.titulo}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Planeación: ${item.subtitulo}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value:
                                                      _programacionSeleccionada,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _programacionSeleccionada =
                                                          value;
                                                      _programacionController
                                                              .text =
                                                          _programacionSeleccionada!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_programacionSeleccionada ==
                                                            null ||
                                                        _programacionSeleccionada!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 60,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Aula",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: aulasHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Text(
                                                              item.titulo,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value: _aulaSeleccionada,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _aulaSeleccionada = value;
                                                      _aulaController.text =
                                                          _aulaSeleccionada!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_aulaSeleccionada ==
                                                            null ||
                                                        _aulaSeleccionada!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Seleccione Día",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: diasHorario
                                                      .map((item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: item.valor
                                                                .toString(),
                                                            child: Text(
                                                              item.titulo,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ))
                                                      .toList(),
                                                  // Valor seleccionado actualmente en el menú desplegable
                                                  value: _diaSeleccionado,
                                                  // Manejar el cambio de selección
                                                  onChanged: (String? value) {
                                                    // Actualizar el estado con la nueva selección
                                                    setState(() {
                                                      _diaSeleccionado = value;
                                                      _diaController.text =
                                                          _diaSeleccionado!;
                                                    });

                                                    // Realizar acciones adicionales según sea necesario cuando se selecciona un elemento
                                                    if (_diaSeleccionado ==
                                                            null ||
                                                        _diaSeleccionado!
                                                            .isEmpty) {
                                                      return;
                                                    }
                                                  },
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14,
                                                            right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                        color: Colors.black26,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  iconStyleData:
                                                      const IconStyleData(
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_ios_outlined,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor:
                                                        Colors.black,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    maxHeight: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      color: Colors.white,
                                                    ),
                                                    scrollbarTheme:
                                                        ScrollbarThemeData(
                                                      radius:
                                                          const Radius.circular(
                                                              40),
                                                      thickness:
                                                          WidgetStateProperty
                                                              .all<double>(6),
                                                      thumbVisibility:
                                                          WidgetStateProperty
                                                              .all<bool>(true),
                                                    ),
                                                  ),
                                                  menuItemStyleData:
                                                      const MenuItemStyleData(
                                                    height: 40,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _selectHoraInicio(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Expanded(
                                                          child: Text(
                                                            "Seleccione hora de inicio",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "La hora seleccionada es: ${formatHora(_horaInicioController.text)}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Tooltip(
                                            message: "Se requiere este campo.",
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _selectHoraFin(context);
                                                },
                                                child: Container(
                                                  height: 50,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 14, right: 14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    border: Border.all(
                                                      color: Colors.black26,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25,
                                                            right: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Expanded(
                                                          child: Text(
                                                            "Seleccione hora de finalización",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Container(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "La hora seleccionada es: ${formatHora(_horaFinController.text)}",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      // Botón para guardar la categoría
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_programacionController.text.isNotEmpty &&
              _aulaController.text.isNotEmpty &&
              _diaController.text.isNotEmpty &&
              _horaInicioController.text.isNotEmpty &&
              _horaFinController.text.isNotEmpty) {
          } else {
            modalCamposRequeridos();
          }
        },
        label: const Text(
          "Guardar",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontFamily: 'Calibri-Bold'),
        ),
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }

  void modalCamposRequeridos() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Campos Requeridos!', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Por favor, complete todos los campos requeridos.",
                  style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              ClipOval(
                child: Container(
                  width: 100, // Ajusta el tamaño según sea necesario
                  height: 100, // Ajusta el tamaño según sea necesario
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: Image.asset(
                    "assets/img/logo.png",
                    fit: BoxFit.cover, // Ajusta la imagen al contenedor
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              alignment: MainAxisAlignment.center,
              children: [
                // Botón de aceptar
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: buildButton("Aceptar", () {
                    Navigator.pop(context);
                  }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
