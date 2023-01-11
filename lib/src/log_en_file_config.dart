import 'config/singletons.dart';
import 'entity/config_entity.dart';

class LogEnFileConfig {

  String packageName = '';
  String folderName = '';
  String fileName = '';

  LogEnFileConfig({
    required this.packageName,
    required this.folderName,
    required this.fileName,
  }){
    setupGetIt();
    _init();
  }

  ///
  void _init(){

    final cfgE = cfg.get<ConfigEntity>();

    String er = '';
    if(fileName.isNotEmpty) {
      
      cfgE.fromClass(this);
      final isOk = cfgE.check();
      if(!isOk) {
        er = 'No hay ninguna configuración para el paquete de LogEnFile';
      }
    }else{
      er = 'No se enviaron argumentos para la configuración de LogEnFile';
    }
    
    if(er.isNotEmpty) {
      print(er);
    }
  }

}