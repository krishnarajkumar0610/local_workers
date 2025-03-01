import 'package:mobx/mobx.dart';
part 'RoleSelectingScreenModel.g.dart';

class RoleSelectingScreenModel = _RoleSelectingScreenModelBase
    with _$RoleSelectingScreenModel;

abstract class _RoleSelectingScreenModelBase with Store {
  @observable
  late String selectedRole;
  @observable
  late bool isRoleSelected;
  @action
  void setIsRoleSelected(bool value) {
    isRoleSelected = value;
  }

  @action
  void setRole(String value) {
    selectedRole = value;
  }
}
