import 'package:alzhelp/models/alz.dart';
import 'package:alzhelp/models/users.dart';
import 'package:alzhelp/screens/home/records.dart';
import 'package:alzhelp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:alzhelp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alzhelp/screens/home/data.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

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
    return StreamProvider<List<Alz>>.value(
      value: DatabaseService().alz,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Alz Help'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.bookmark_border),
              label: Text('records'),
              onPressed: () => _showRecordsPanel(),
            ),
            FlatButton.icon(
              icon: Icon(Icons.data_usage),
              label: Text('data'),
              onPressed: () => _showDataPanel(),
            )
          ],
        ),
        // body: Data(),
        body: Stack(
          children: [
            WebsafeSvg.asset("package:alzhelp/assets/icons/bg.svg", fit: BoxFit.fill),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 2), //2/6
                    Text(
                      "Let's Play Quiz,",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(), // 1/6
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20 * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Lets Start The Test",
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
      ),
    );
  }
}
