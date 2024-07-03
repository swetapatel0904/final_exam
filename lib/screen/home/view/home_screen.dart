import 'package:final_exam/screen/home/controller/home_controller.dart';
import 'package:final_exam/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  List<Map<String, dynamic>> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
    controller.getUserData();
  }

  Future<void> fetchUsers() async {
    List<Map<String, dynamic>>? users =
        (await DBHelper.helper.readUser()).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Expanded(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${controller.userList[index].name}"),
                subtitle: Text("${controller.userList[index].email}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
