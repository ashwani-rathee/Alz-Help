import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/controllers/naming_controller.dart';

import 'components/body.dart';

class NamingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NamingController _controller = Get.put(NamingController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}
