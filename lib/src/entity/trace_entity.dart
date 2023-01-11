class TraceEntity {

  String error = '';
  String path = '';
  String line = '';
  String col = '';
  String file = '';
  String created = '';

  void fromString(String linea) {

    if(linea.startsWith('(')) {
      linea = _clean(linea);
    }

    final partes = linea.split(':');
    col = partes.removeLast();
    line = partes.removeLast();
    path = partes.join(':');
    file = path.split('/').toList().removeLast();
    created = DateTime.now().toIso8601String();
  }

  ///
  Map<String, dynamic> toJson() {

    return {
      'error': error,
      'path': path,
      'line': line,
      'col': col,
      'file': file,
      'created': created,
    };
  }

  ///
  String toLine() {

    return '$created, $error, L-$line, C-$col, En $file, $path';
  }

  ///
  String _clean(String li) {

    li = li.replaceAll('(', '');
    li = li.replaceAll(')', '');
    if(li.startsWith('file:')) {
      li = li.replaceAll('file:///', '');
    }
    return li.trim();
  }
}