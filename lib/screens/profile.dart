import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/screens/terms_of_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(
      {Key? key,
      required this.mobileNumber,
      required this.OTP,
      required this.fName,
      required this.gender,
      required this.Dob})
      : super(key: key);
  final int mobileNumber, OTP;
  final String fName, gender;
  final Map<String, dynamic> Dob;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 45, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'P R O F I L E',
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'OpenSans',
              color: Color.fromRGBO(172, 172, 172, 1)),
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 13, 10, 0),
              child: Text(
                'Done',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(172, 172, 172, 1),
                    fontFamily: 'OpenSans'),
              ))
        ],
        backgroundColor: const Color.fromRGBO(61, 61, 61, 1),
      ),
      body: Column(
        children: [
          addVerticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundButton(),
              getRoundButton(),
              getRoundButton(),
            ],
          ),
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              getRoundButton(),
              getRoundButton(),
              getRoundButton(),
            ],
          ),
          addVerticalSpace(25),
          const Text(
            'Hold & drag your photo to change the border',
            style: TextStyle(
                color: Color.fromRGBO(152, 152, 152, 1),
                fontSize: 12,
                fontFamily: 'OpenSans'),
          ),
          addVerticalSpace(41),
          SizedBox(
            width: size.width - 30,
            height: 59,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TermsAndService(
                      mobileNumber: mobileNumber,
                      OTP: OTP,
                      fName: fName,
                      gender: gender,
                      Dob: Dob);
                }));
              },
              child: const Text(
                'Verify your profile',
                style: TextStyle(fontSize: 17, fontFamily: 'OpenSans'),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          addVerticalSpace(70),
          Row(
            children: [
              addHorizontalSpace(38),
              const Text(
                'About me',
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'OpenSans'),
              )
            ],
          ),
          addVerticalSpace(10),
          Container(
            height: 180,
            width: size.width - 30,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(88, 88, 88, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'A free bird who loves to contemplate life, society and future. Gray is my favorite color and is also my way of life. Looking to meet fun and interesting people',
                style: TextStyle(
                    fontSize: 16.5,
                    fontFamily: 'OpenSansSemiBold',
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
