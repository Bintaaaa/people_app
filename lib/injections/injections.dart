import 'package:common/core/di/dependecy.dart';

class Injections {
  initialize() {
    _registerSharedDependencies();
  }

  _registerSharedDependencies() {
    RegisterCoreModule();
  }
}
