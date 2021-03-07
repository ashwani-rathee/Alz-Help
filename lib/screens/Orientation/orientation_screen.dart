import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/controllers/orientation_controller.dart';

import 'components/body.dart';

class OrientationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrientationController _controller = Get.put(OrientationController());
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
