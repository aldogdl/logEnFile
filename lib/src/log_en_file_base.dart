
import 'config/singletons.dart';
import 'entity/config_entity.dart';
import 'entity/trace_entity.dart';
import 'log_en_file_em.dart';

class DD {
  
  final cfgE = cfg.get<ConfigEntity>();

  final StackTrace trace;
  final String log;

  DD({
    required this.trace,
    required this.log
  }) { pfull(); }

  ///
  void pfull() {

    cfgE.check();
    final res = trace.toString().split('#');
    res.map((e) {
      if(e.startsWith('0')) {
        final resTwo = e.split(' ');
        if(resTwo.isNotEmpty) {
          resTwo.map((e2) {
            if(e2.trim().startsWith('(')) {
              final entity = TraceEntity();
              entity.error = log;
              entity.fromString(e2);
              LogEnFileEm.registrar(cfgE.toJson(), entity.toLine());
              return;
            }
          }).toList();
        }
      }
    }).toList();
  }

}
