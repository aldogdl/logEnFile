import 'package:log_en_file/log_en_file.dart';

import 'otra_clase.dart';

void main() {

  LogEnFileConfig(
    packageName: 'autoparnet', folderName: 'logs', fileName: 'scp_log'
  );
  _otroMetodo();  
}

///
void _otroMetodo() {

  OtraClase.pErr();
}
