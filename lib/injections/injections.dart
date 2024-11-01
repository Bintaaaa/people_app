import 'package:common/core/di/dependecy.dart';
import 'package:main_domain/injection/domain_injection.dart';

class Injections {
  Injections() {
    initialize();
  }
  initialize() {
    _registerSharedDependencies();
    _domainDependencies();
  }

  _registerSharedDependencies() {
    RegisterCoreModule();
  }

  _domainDependencies() {
    DomainInjection();
  }
}
