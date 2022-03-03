import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/models/text_with_radio.dart';
import 'package:ether_app/screens/demo_app.dart';
import 'package:ether_app/screens/profile.dart';
import 'package:flutter/material.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile(
      {Key? key,
      required this.mobileNumber,
      required this.OTP,
      required this.fName,
      required this.Dob,
      required this.gender})
      : super(key: key);
  final int mobileNumber, OTP;
  final String fName, gender;
  final Map<String, dynamic> Dob;

  @override
  _BuildProfileState createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var gende = widget.gender;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(100),
          const Center(
            child: Text(
              'Build your profile?',
              style: TextStyle(
                  color: Color.fromRGBO(212, 212, 212, 1),
                  fontSize: 28,
                  fontFamily: 'OpenSans'),
            ),
          ),
          addVerticalSpace(72),
          TextWithRadio(
            text: 'Do it now',
            radio: Transform.scale(
              scale: 1.5,
              child: Radio(
                onChanged: (value) {
                  setState(() {
                    selectedValue = 1;
                  });
                },
                activeColor: Color(0xFFC1C1C1),
                value: 1,
                groupValue: selectedValue,
              ),
            ),
          ),
          addVerticalSpace(15),
          TextWithRadio(
            text: 'Go to the app first',
            radio: Transform.scale(
              scale: 1.5,
              child: Radio(
                onChanged: (value) {
                  setState(() {
                    selectedValue = 2;
                  });
                },
                value: 2,
                activeColor: Color(0xFFC1C1C1),
                groupValue: selectedValue,
              ),
            ),
          ),
          addVerticalSpace(114),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: nextButton(),
                onTap: () {
                  print(selectedValue);
                  if(selectedValue == 0){
                    showToast('Kaik to select karvu padse bhura');
                  }
                  if (selectedValue == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile(
                          mobileNumber: widget.mobileNumber,
                          OTP: widget.OTP,
                          fName: widget.fName,
                          gender: widget.gender,
                          Dob: widget.Dob);
                    }));
                  } else if (selectedValue == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DemoApp();
                    }));
                  }
                },
              ),
              addHorizontalSpace(15)
            ],
          )
        ],
      ),
    ));
  }
}
