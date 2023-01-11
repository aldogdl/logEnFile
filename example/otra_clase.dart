import 'package:log_en_file/log_en_file.dart';

class OtraClase {

  ///
  static void pErr() {

    DD(trace: StackTrace.current, log: 'Ok todo bien');
  }
}