class Programacion {

  final int planeacion;

  final String nombreResultado;

  final String nombreInstructor;

  final String codigoFicha;

  final String nombreTrimestre;

  final String nombrePrograma;

  final String nombreCompetencia;

  final int diasAsignados;

  final String estadoTrimestre;

  final String fechaInicio;

  final String fechaFinal;

  final int duracionTotal;

  final String lugar;

  final String tipoPrograma;

  final String liderFicha;

  final String tipoInstructor;

  Programacion({
    required this.planeacion,
    required this.nombreResultado,
    required this.nombreInstructor,
    required this.codigoFicha,
    required this.nombreTrimestre,
    required this.nombrePrograma,
    required this.nombreCompetencia,
    required this.diasAsignados,
    required this.estadoTrimestre,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.duracionTotal,
    required this.lugar,
    required this.tipoPrograma,
    required this.liderFicha,
    required this.tipoInstructor,
  });
}

List<Programacion> listaProgramacion = [
  Programacion(
      planeacion: 1001,
      nombreResultado: "Rap.1",
      nombreInstructor: "Viviana Castro",
      codigoFicha: "2693571",
      nombreTrimestre: "Trimeste 3",
      nombrePrograma: "Analisis y desarrolo de software",
      nombreCompetencia: "Modelado",
      diasAsignados: 2,
      estadoTrimestre: "Finalizado",
      fechaInicio: "22/01/2024",
      fechaFinal: "22/04/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnico",
      liderFicha: "Juliana Pardo",
      tipoInstructor: "planta"),
  Programacion(
      planeacion: 1002,
      nombreResultado: "Rap 2",
      nombreInstructor: "Liliana Sabogal",
      codigoFicha: "9845201",
      nombreTrimestre: "trimestre 1",
      nombrePrograma: "Gestión organizacional",
      nombreCompetencia: "Bilinguismo",
      diasAsignados: 3,
      estadoTrimestre: "finalizado",
      fechaInicio: "05/05/2024",
      fechaFinal: "05/08/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnologo",
      liderFicha: "Liliana Sabogal",
      tipoInstructor: "contratista"),
  Programacion(
      planeacion: 1003,
      nombreResultado: "Rap 3",
      nombreInstructor: "Fernando Bermudez",
      codigoFicha: "2693572",
      nombreTrimestre: "trimestre 5",
      nombrePrograma: "Agroindustrial",
      nombreCompetencia: "Psicolgia",
      diasAsignados: 4,
      estadoTrimestre: "Activo",
      fechaInicio: "22/01/2024",
      fechaFinal: "22/04/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnologo",
      liderFicha: "Fernando Bermudez",
      tipoInstructor: "planta"),
  Programacion(
      planeacion: 1004,
      nombreResultado: "Rap 4",
      nombreInstructor: "Linda Herrera",
      codigoFicha: "1002328",
      nombreTrimestre: "trimestre 2",
      nombrePrograma: "Especies menores",
      nombreCompetencia: "Estilos de vida saludable",
      diasAsignados: 5,
      estadoTrimestre: "Activo",
      fechaInicio: "05/05/2024",
      fechaFinal: "05/08/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnico",
      liderFicha: "Ana lopez",
      tipoInstructor: "contratista"),
  Programacion(
      planeacion: 1005,
      nombreResultado: "Rap 5",
      nombreInstructor: "Santiago Villa",
      codigoFicha: "7845412",
      nombreTrimestre: "trimestre 6",
      nombrePrograma: "Gestión documental",
      nombreCompetencia: "Bilinguismo",
      diasAsignados: 6,
      estadoTrimestre: "Activo",
      fechaInicio: "22/01/2024",
      fechaFinal: "22/04/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnologo",
      liderFicha: "Santiago Villa",
      tipoInstructor: "planta"),
  Programacion(
      planeacion: 1006,
      nombreResultado: "Rap 1",
      nombreInstructor: "laura Villamil",
      codigoFicha: "7456498",
      nombreTrimestre: "trimestre 4",
      nombrePrograma: "Producción pecuaria",
      nombreCompetencia: "Investigacion",
      diasAsignados: 3,
      estadoTrimestre: "Activo",
      fechaInicio: "01/05/2024",
      fechaFinal: "01/08/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnico",
      liderFicha: "Camila Ocampo",
      tipoInstructor: "contratista"),
  Programacion(
      planeacion: 1007,
      nombreResultado: "Rap 2",
      nombreInstructor: "Jairo Anzola",
      codigoFicha: "2693989",
      nombreTrimestre: "trimestre 1",
      nombrePrograma: "Sistema de Gestión de Seguridad y Salud en el Trabajo",
      nombreCompetencia: "Estilos de vida saludable",
      diasAsignados: 3,
      estadoTrimestre: "Finalizado",
      fechaInicio: "22/01/2024",
      fechaFinal: "22/04/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnologo",
      liderFicha: "Sandra Chaves",
      tipoInstructor: "planta"),
  Programacion(
    planeacion: 1008,
      nombreResultado: "Rap 3",
      nombreInstructor: "Ana Rodriguez",
      codigoFicha: "3579510",
      nombreTrimestre: "trimestre 2",
      nombrePrograma: "Recursos humanos",
      nombreCompetencia: "Investigacion ",
      diasAsignados: 2,
      estadoTrimestre: "Activo",
      fechaInicio: "05/05/2024",
      fechaFinal: "05/08/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnico",
      liderFicha: "Pedro Iregui",
      tipoInstructor: "contratista"),
  Programacion(
      planeacion: 1009,
      nombreResultado: "Rap 4",
      nombreInstructor: "Maria Panche",
      codigoFicha: "7412365",
      nombreTrimestre: "trimestre 6",
      nombrePrograma: "Cocina",
      nombreCompetencia: "Bilinguismo",
      diasAsignados: 3,
      estadoTrimestre: "Activo",
      fechaInicio: "22/01/2024",
      fechaFinal: "22/04/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnologo",
      liderFicha: "Danna Poveda",
      tipoInstructor: "planta"),
  Programacion(
      planeacion: 1010,
      nombreResultado: "Rap 5",
      nombreInstructor: "Kevin Villa",
      codigoFicha: "895562",
      nombreTrimestre: "trimestre 4",
      nombrePrograma: "Operadores de maquinaria",
      nombreCompetencia: "Psicologia",
      diasAsignados: 2,
      estadoTrimestre: "Activo",
      fechaInicio: "05/05/2024",
      fechaFinal: "05/08/2024",
      duracionTotal: 3,
      lugar: "CBA mosquera-Cund",
      tipoPrograma: "Tecnico",
      liderFicha: "Kevin Villa",
      tipoInstructor: "contratista"),
];
