import 'package:flutter/material.dart';
import 'package:horarios_cba/constantsDesign.dart';

class ReservaInfo {
  final String? svgSrc, title, totalReservas;
  final int? percentage;
  final Color? color;

  ReservaInfo({
    this.svgSrc,
    this.title,
    this.totalReservas,
    this.percentage,
    this.color,
  });
}

List demoMyReservas = [
  ReservaInfo(
    title: "Mis Reservas",
    svgSrc: "assets/icons/reserva.svg",
    totalReservas: "13",
    color: primaryColor,
    percentage: 13,
  ),
  ReservaInfo(
    title: "Reservas Activas",
    svgSrc: "assets/icons/check.svg",
    totalReservas: "6",
    color: Colors.green,
    percentage: 6,
  ),
  ReservaInfo(
    title: "Reservas Canceladas",
    svgSrc: "assets/icons/cancel.svg",
    totalReservas: "4",
    color: Colors.red,
    percentage: 4,
  ),
  ReservaInfo(
    title: "Reservas Pendientes",
    svgSrc: "assets/icons/pendiente.svg",
    totalReservas: "3",
    color: const Color(0xFF007EE5),
    percentage: 3,
  ),
];
