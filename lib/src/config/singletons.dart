import 'package:get_it/get_it.dart';

import '../entity/config_entity.dart';

final cfg = GetIt.instance;

void setupGetIt() {
  print('llego');
  cfg.registerSingleton<ConfigEntity>(ConfigEntity());
}