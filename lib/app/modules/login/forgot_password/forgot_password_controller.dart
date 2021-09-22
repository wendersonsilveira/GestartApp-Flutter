import 'package:Gestart/di/di.dart';
import 'package:Gestart/domain/entities/user/update_password_entity.dart';
import 'package:Gestart/domain/usecases/user/update_password_use_case.dart';
import 'package:Gestart/domain/utils/resource_data.dart';
import 'package:Gestart/domain/utils/status.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'forgot_password_controller.g.dart';

@Injectable()
class ForgotPasswordController = _ForgotPasswordControllerBase with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  final _updatePassword = getIt.get<UpdatePasswordUseCase>();
  ResourceData updatePassord;

  @observable
  bool loading = false;

  @action
  Future<ResourceData> updatePassword(UpdatePasswordEntity usuario) async {
    loading = true;
    updatePassord = ResourceData(status: Status.loading);
    updatePassord = await _updatePassword(usuario);
    loading = false;
    return updatePassord;
  }

  @action
  stopLoading() {
    loading = false;
  }
}
