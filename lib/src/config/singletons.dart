import 'package:get_it/get_it.dart';

import '../entity/config_entity.dart';

final cfg = GetIt.instance;

void setupGetIt() {
  cfg.registerSingleton<ConfigEntity>(ConfigEntity());
}