import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kitakerja/Screens/Dashboard/Dash.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Image.asset('assets/images/4457 1.png'),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              "Registration",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Text(
              "Email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: (Color(0xff000000)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email...',
                hintText: 'Enter Email',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Color(0xff0948EA),
                      width: (2.0),
                    )),
                suffixIcon: Icon(IconData(0xe081, fontFamily: 'MaterialIcons'),
                    color: Color(0xFF0948EA)),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: (Color(0xff000000)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Password..',
                hintText: 'Enter Password',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color(0xff0948EA), width: (2.0))),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: (Color(0xFF0948EA)),
                ),
              ),
              onChanged: (String value) {},
              validator: (value) {},
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
            child: Text(
              "Re-enter Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: (Color(0xff000000)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Re-enterPassword..',
                hintText: 'Re-enter Password',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color(0xff0948EA), width: (2.0))),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: (Color(0xFF0948EA)),
                ),
              ),
              onChanged: (String value) {},
              validator: (value) {},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Color(0xff4D7EFA),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
              ],
            ),
        ));
  }
}
