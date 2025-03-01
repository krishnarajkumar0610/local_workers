import 'package:workers_app/Pages/RoleSelectingScreen/RoleSelectingScreenModel.dart';

class RoleSelectingScreenVM extends RoleSelectingScreenModel {
  RoleSelectingScreenVM() {
    try {
      setRole("");
      setIsRoleSelected(false);
    } catch (ex) {
      print(ex);
    }
  }
  void updateUserRole(String value) {
    try {
      setRole(value);
      setIsRoleSelected(true);
    } catch (ex) {
      print(ex);
    }
  }
}
