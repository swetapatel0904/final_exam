import 'package:final_exam/screen/home/controller/home_controller.dart';
import 'package:final_exam/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  HomeController controller = Get.put(HomeController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                DBHelper.helper.insertUser(
                    usernameController.text, passwordController.text);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  // Future<List<HomeModel>?> authenticateUser() async {
  //   List<Map<String, dynamic>> users = await DBHelper.helper.readUser();
  //   String username = usernameController.text;
  //   String password = passwordController.text;
  //
  //   for (var user in users) {
  //     if (user['username'] == username && user['password'] == password) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Login Successful')),
  //       );
  //       return ;
  //     }
  //   }
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text('Invalid username or password')),
  //   );
  // }
}
