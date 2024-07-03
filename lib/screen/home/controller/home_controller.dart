import 'package:final_exam/screen/home/model/home_model.dart';
import 'package:final_exam/utils/database_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isHide = true.obs;
  void showPassword() {
    isHide.value = !isHide.value;
  }

  RxList<HomeModel> userList = <HomeModel>[].obs;

  void getUserData() async {
    List<HomeModel> l1 = await DBHelper.helper.readUser();
    if (l1 != null) {
      userList.value = l1;
    }
  }
}
