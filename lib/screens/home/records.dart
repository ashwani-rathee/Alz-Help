import 'package:alzhelp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:alzhelp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:alzhelp/models/users.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  final _formkey = GlobalKey<FormState>();
  final List<String> gender = ['female', 'male', 'non-binary'];

  //form values
  String _currentName = "";
  String _currentDob = "";
  String _currentGender = "";
  String _currentPlace = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your data',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'dd/mm/yyyy'),
            validator: (val) => val.length == 10 ? 'Please enter the correct format' : null,
            onChanged: (val) => setState(() => _currentDob = val),
          ),
          SizedBox(
            height: 20.0,
          ),
          DropdownButtonFormField(
              items: gender.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text('$gender'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentGender = val)),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'hometown'),
            validator: (val) => val.isEmpty ? 'Please enter a place' : null,
            onChanged: (val) => setState(() => _currentPlace = val),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
            },
          )
        ],
      ),
    );
  }
}
