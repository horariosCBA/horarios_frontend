// ignore_for_file: file_names

class TipoPrograma {
  String titulo;
  String valor;
  TipoPrograma({required this.titulo, required this.valor});
}

List<TipoPrograma> tiposPrograma = [
  TipoPrograma(
    titulo: 'Técnico',
    valor: 'Técnico',
  ),
  TipoPrograma(
    titulo: 'Tecnólogo',
    valor: 'Tecnólogo',
  ),
  TipoPrograma(
      titulo: 'Especialización Técnica', valor: 'Especialización Técnica'),
  TipoPrograma(
      titulo: 'Especialización Tecnológica',
      valor: 'Especialización Tecnológica'),
  TipoPrograma(titulo: 'Curso Corto', valor: 'Curso Corto'),
  TipoPrograma(titulo: 'Formación Continua', valor: 'Formación Continua'),
  TipoPrograma(titulo: 'Capacitación a Medida', valor: 'Capacitación a Medida'),
  TipoPrograma(titulo: 'Curso Virtual', valor: 'Curso Virtual'),
  TipoPrograma(titulo: 'Curso de Idiomas', valor: 'Curso de Idiomas'),
  TipoPrograma(titulo: 'Emprendimiento', valor: 'Emprendimiento'),
];

class TipoCertificacionPrograma {
  String titulo;
  String valor;
  TipoCertificacionPrograma({required this.titulo, required this.valor});
}

List<TipoCertificacionPrograma> tipoCertificacionesPrograma = [
  TipoCertificacionPrograma(
    titulo: 'Certificado Técnico',
    valor: 'Certificado Técnico',
  ),
  TipoCertificacionPrograma(
    titulo: 'Certificado Tecnólogo',
    valor: 'Certificado Tecnólogo',
  ),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Especialización Técnica',
      valor: 'Certificado de Especialización Técnica'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Especialización Tecnológica',
      valor: 'Certificado de Especialización Tecnológica'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Curso Corto',
      valor: 'Certificado de Curso Corto'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Formación Continua',
      valor: 'Certificado de Formación Continua'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Capacitación a Medida',
      valor: 'Certificado de Capacitación a Medida'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Curso Virtual',
      valor: 'Certificado de Curso Virtual'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Idiomas', valor: 'Certificado de Idiomas'),
  TipoCertificacionPrograma(
      titulo: 'Certificado de Emprendimiento',
      valor: 'Certificado de Emprendimiento'),
];

class TipoOfertaPrograma {
  String titulo;
  String valor;
  TipoOfertaPrograma({required this.titulo, required this.valor});
}

List<TipoOfertaPrograma> tipoOfertasPrograma = [
  TipoOfertaPrograma(
    titulo: 'Oferta',
    valor: 'Oferta',
  ),
  TipoOfertaPrograma(
    titulo: 'Cadena de Formación',
    valor: 'Cadena de Formación',
  ),
];

class ModalidadPrograma {
  String titulo;
  String valor;
  ModalidadPrograma({required this.titulo, required this.valor});
}

List<ModalidadPrograma> modalidadesPrograma = [
  ModalidadPrograma(
    titulo: 'Presencial',
    valor: 'Presencial',
  ),
  ModalidadPrograma(
    titulo: 'Virtual',
    valor: 'Virtual',
  ),
  ModalidadPrograma(
    titulo: 'A Distancia',
    valor: 'A Distancia',
  ),
  ModalidadPrograma(
    titulo: 'Mixta (B-Learning)',
    valor: 'Mixta (B-Learning)',
  ),
  ModalidadPrograma(
    titulo: 'Contrato de Aprendizaje',
    valor: 'Contrato de Aprendizaje',
  ),
  ModalidadPrograma(
    titulo: 'Articulación con la Media',
    valor: 'Articulación con la Media',
  ),
  ModalidadPrograma(
    titulo: 'Escuela-Taller',
    valor: 'Escuela-Taller',
  ),
];
