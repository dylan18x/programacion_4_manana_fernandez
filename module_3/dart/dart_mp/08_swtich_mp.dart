void main() {
  String estadoPrestamo = '404';

  switch (estadoPrestamo) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('Petición incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('Código desconocido');
  }

  String descripcion = switch (estadoPrestamo) {
    '200' => 'OK — solicitud exitosa',
    '201' => 'Created — recurso creado',
    '204' => 'No Content — sin contenido',
    '400' => 'Bad Request — datos inválidos',
    '401' => 'Unauthorized — sin autenticación',
    '403' => 'Forbidden — sin permiso',
    '404' => 'Not Found — recurso no existe',
    '500' => 'Internal Server Error',
    '503' => 'Service Unavailable',
    _     => 'Código HTTP desconocido',
  };

  print(descripcion);

  int codigoNumerico = 404;

  String categoria = switch (codigoNumerico) {
    200 || 201 || 204        => 'Éxito (2xx)',
    301 || 302 || 307        => 'Redirección (3xx)',
    400 || 401 || 403 || 404 => 'Error del cliente (4xx)',
    500 || 502 || 503        => 'Error del servidor (5xx)',
    _                        => 'Desconocido',
  };

  print(categoria);

  double diasRetraso = 10.0;

  String alerta = switch (diasRetraso) {
    double d when d >= 30.0 => '🚨 CRÍTICO — libro dado de baja',
    double d when d >= 15.0 => '🔴 RETRASO GRAVE — notificar socio',
    double d when d >= 7.0  => '🟡 RETRASO LEVE — enviar aviso',
    double d when d >= 1.0  => '🟢 RETRASO MÍNIMO',
    _                       => '🔵 ENTREGADO A TIEMPO',
  };

  print(alerta);

  Object respuestaApi = {'id': 1, 'titulo': 'Sapiens', 'precio': 29.99};

  String resultado = switch (respuestaApi) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error: ${m['error']}',
    Map<String, dynamic> m =>
        'Libro: ${m['titulo']} — \$${m['precio']}',
    List<dynamic> lista =>
        '${lista.length} libros en el catálogo',
    String texto =>
        'Texto recibido: $texto',
    _ =>
        'Respuesta desconocida',
  };

  print(resultado);
}