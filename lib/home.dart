import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX StateManagement"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(
              id: "follower_widget",
              builder: (_) {
                if (kDebugMode) {
                  print("Followers widget builds");
                }
                return Text("${_controller.followers}");
              },
            ),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              id: "status_widget",
              builder: (_) {
                if (kDebugMode) {
                  print("Status widget builds");
                }
                return Column(
                  children: [
                    Text(_controller.status ? "Online" : "Offline"),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _controller.updateStatus();
                      },
                      child: Text(_controller.status ? "Logout" : "Login"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
