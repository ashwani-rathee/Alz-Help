import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alzhelp/controllers/naming_controller.dart';
import 'package:alzhelp/screens/Naming/flip_card.dart';

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
      body: Flip_Section_State(),
    );
  }
}

class Flip_Section_State extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 0.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            decoration: BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Front', style: Theme.of(context).textTheme.headline),
                Text('Click here to flip back',
                    style: Theme.of(context).textTheme.body1),
              ],
            ),
          ),
          back: Body()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _renderBg(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _renderAppBar(context),
            Expanded(
              flex: 4,
              child: _renderContent(context),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        )
      ],
    ));
  }
}
