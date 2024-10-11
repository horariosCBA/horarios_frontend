// ignore_for_file: file_names

class ProgramaFicha {
  final String titulo;
  final String tipo;
  final String modalidad;
  final int valor;

  ProgramaFicha(
      {required this.titulo,
      required this.tipo,
      required this.modalidad,
      required this.valor});
}

List<ProgramaFicha> programasFicha = [
  ProgramaFicha(
      titulo: "Análisis y desarrollo de software",
      tipo: "Tecnico",
      modalidad: "Mixta",
      valor: 1),
  ProgramaFicha(
      titulo: "Programación orientada a objetos",
      tipo: "Tecnico",
      modalidad: "Mixta",
      valor: 2),
  ProgramaFicha(
      titulo: "Mantenimiento de equipos de cómputo",
      tipo: "Tecnico",
      modalidad: "Mixta",
      valor: 3),
];

class LiderFicha {
  final String titulo;
  final String subtitulo;
  final int valor;

  LiderFicha(
      {required this.titulo, required this.subtitulo, required this.valor});
}

List<LiderFicha> lideresFicha = [
  LiderFicha(titulo: "Juan Pablo Pérez Gómez", subtitulo: "Software", valor: 1),
  LiderFicha(titulo: "Juan Carlos Gómez", subtitulo: "Software", valor: 2),
  LiderFicha(titulo: "María Pérez", subtitulo: "Software", valor: 3),
];
