import 'package:alzhelp/models/alz.dart';
import 'package:alzhelp/models/users.dart';
import 'package:alzhelp/screens/home/records.dart';
import 'package:alzhelp/screens/quiz/quiz_screen.dart';
import 'package:alzhelp/services/auth.dart';
import 'package:alzhelp/services/location.dart';
import 'package:flutter/material.dart';
import 'package:alzhelp/services/database.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alzhelp/screens/home/data.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:alzhelp/shared/constants.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showRecordsPanel() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Data();
          });
    }

    void _showDataPanel() {
      showModalBottomSheet<dynamic>(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Records();
          });
    }

    // final user = Provider.of<Users>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Alz Help'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.bookmark_border,
              size: 20,
            ),
            label: Text('records', textScaleFactor: 0.95),
            onPressed: () => _showRecordsPanel(),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.data_usage,
              size: 20,
            ),
            label: Text('data', textScaleFactor: 0.95),
            onPressed: () => _showDataPanel(),
          ),
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              size: 20,
            ),
            label: Text(
              'logout',
              textScaleFactor: 0.95,
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      // body: Data(),
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Alzheimer's Screening test",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.brown[600], fontWeight: FontWeight.bold),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () async {
                      return Navigator.pushNamed(context, 'quizscreen');
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Start Now",
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
