import 'dart:io' show Platform, Directory, File;
import 'package:path/path.dart' as mpath;

class LogEnFileEm {

  static final mpath.Style estiloPlatform = mpath.Style.windows;

  /// Obtenemos el separador del sistema
  static String getSep() {
    var context = mpath.Context(style: estiloPlatform);
    return context.separator;
  }

  /// Obtenemos el path a root del proyecto
  static String _getPathRoot(String package) {

    var context = mpath.Context(style: estiloPlatform);
    return context.join(
      Platform.environment['APPDATA']!, 'com.$package'
    );
  }

  ///
  static void registrar(Map<String, dynamic> config, String err) {

    final s = getSep();
    final root = _getPathRoot(config['package_name']);
    Directory dir = Directory(root);
    if(!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    dir = Directory('${dir.path}$s${config['folder_name']}');
    if(!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    List<String> lines = [];
    final file = File('${dir.path}$s${config['file_name']}.txt');
    if(file.existsSync()) {
      lines = file.readAsLinesSync().toList();
      if(lines.isNotEmpty) {
        lines.insert(0, err);
      }
    }else{
      lines.add(err);
    }
    file.writeAsStringSync(lines.join('\n'));
  }

}