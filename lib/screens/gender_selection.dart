import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/models/text_with_radio.dart';
import 'package:ether_app/screens/build_profile.dart';
import 'package:ether_app/screens/your_dateofbirth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection(
      {Key? key,
      required this.mobileNumber,
      required this.OTP,
      required this.fName,
      required this.date,
      required this.month,
      required this.year})
      : super(key: key);
  final int mobileNumber, OTP;
  final String fName;
  final int date, month, year;

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Map<String, dynamic> DOB = {};
  int selectedValue = 0;
  String? gender;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addVerticalSpace(99),
          const Center(
            child: Text(
              'How do you identify?',
              style: TextStyle(
                  color: Color.fromRGBO(172, 172, 172, 1),
                  fontSize: 28,
                  fontFamily: 'OpenSans'),
            ),
          ),
          addVerticalSpace(25),
          Row(
            children: [
              addHorizontalSpace(42),
              const Text(
                'Everyone\'s welcome on Ether!',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: 'OpenSans'),
              )
            ],
          ),
          addVerticalSpace(100),
          TextWithRadio( text: 'Woman', radio: Transform.scale(
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
          ),),
          addVerticalSpace(15),
         TextWithRadio( text: 'Man', radio: Transform.scale(
           scale: 1.5,
           child: Radio(
             onChanged: (value) {
               setState(() {
                 selectedValue = 2;
               });
             }, activeColor: Color(0xFFC1C1C1),
             value: 2,
             groupValue: selectedValue,
           ),
         ),),
          addVerticalSpace(15),
            TextWithRadio( text: 'Non-Binary', radio: Transform.scale(
              scale: 1.5,
              child: Radio(
                onChanged: (value) {
                  setState(() {
                    selectedValue = 3;
                  });
                }, activeColor: Color(0xFFC1C1C1),
                value: 3,
                groupValue: selectedValue,
              ),
            ),),
          addVerticalSpace(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: nextButton(),
                onTap: () {
                  DOB['date'] = widget.date;
                  DOB['month'] = widget.month;
                  DOB['year'] = widget.year;

                  if (selectedValue == 0) {
                    showToast('Please select correct Gender');
                  } else if (selectedValue == 1) {
                    gender = 'Woman'.toUpperCase();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BuildProfile(
                        mobileNumber: widget.mobileNumber,
                        OTP: widget.OTP,
                        fName: widget.fName,
                        Dob: DOB,
                        gender: gender!,
                      );
                    }));
                  } else if (selectedValue == 2) {
                    gender = 'Man'.toUpperCase();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BuildProfile(
                        mobileNumber: widget.mobileNumber,
                        OTP: widget.OTP,
                        fName: widget.fName,
                        Dob: DOB,
                        gender: gender!,
                      );
                    }));
                  } else {
                    gender = 'Non-Binary'.toUpperCase();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BuildProfile(
                        mobileNumber: widget.mobileNumber,
                        OTP: widget.OTP,
                        fName: widget.fName,
                        Dob: DOB,
                        gender: gender!,
                      );
                    }));
                  }

                },
              ),
              addHorizontalSpace(10)
            ],
          ),

        ],
      ),
    ));
  }
}
