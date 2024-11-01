import 'package:common/core/di/dependecy.dart';

class Injections {
  Injections() {
    initialize();
  }
  initialize() {
    _registerSharedDependencies();
  }

  _registerSharedDependencies() {
    RegisterCoreModule();
  }
}
