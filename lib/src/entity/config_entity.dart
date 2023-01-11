import '../log_en_file_config.dart';

class ConfigEntity {

  String packageName = '';
  String folderName = '';
  String fileName = '';

  ///
  void fromClass(LogEnFileConfig cnf) {
    packageName = cnf.packageName;
    folderName  = cnf.folderName;
    fileName    = cnf.fileName;
  }

  ///
  void fromJson(Map<String, dynamic> data) {
    packageName = data['package_name'];
    folderName = data['folder_name'];
    fileName = data['file_name'];
  }

  ///
  Map<String, String> toJson() {

    return {
      'package_name': packageName,
      'folder_name': folderName,
      'file_name': fileName,
    };
  }

  ///
  bool check() {

    try {
      if(folderName.isEmpty) {
        throw 'No hay ninguna configuración para el paquete de LogEnFile';
      }
      return true;
    } catch (e) {
      print(e.toString());
      print(StackTrace.current);
    }
    return false;
  }
}