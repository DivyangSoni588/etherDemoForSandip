import 'dart:math';

import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/models/user.dart';
import 'package:ether_app/screens/whats_your_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:ether_app/services/service_dio.dart';

int? pinw;
User user = User();
String? otp1, otp2, otp3, otp4, finalOtp;

// final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//   borderRadius: BorderRadius.circular(8),
// );
// final defaultPinTheme = PinTheme(
//   width: 43,
//   height: 53,
//   //textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(
//     border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//     borderRadius: BorderRadius.circular(10),
//
//   ),
// );
class MobileNumberVerification extends StatelessWidget {
  const MobileNumberVerification({Key? key, required this.mobileNumber})
      : super(key: key);
  final int mobileNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(99),
              Row(
                children: [
                  addHorizontalSpace(38),
                  const Text(
                    'Verify your number',
                    style: TextStyle(
                        color: Color.fromRGBO(172, 172, 172, 1),
                        fontSize: 28,
                        fontFamily: 'OpenSans'),
                  )
                ],
              ),
              addVerticalSpace(25),
              Row(
                children: [
                  addHorizontalSpace(38),
                  Text(
                    'Enter the code we\'ve sent by text to\n+91 $mobileNumber',
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontFamily: 'OpenSansRegular'),
                  )
                ],
              ),
              addVerticalSpace(43),
              Row(
                children: [
                  addHorizontalSpace(43),
                  Container(
                    width: 200,
                    color: Colors.grey,
                    child: OtpTextField(
                      numberOfFields: 4,
                      obscureText: true,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        pinw = int.parse(verificationCode);
                      }, // end onSubmit
                    ),
                  ),
                ],
              ),
              addVerticalSpace(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                     //verifyOtp(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return WhatsYourName(mobileNumber: mobileNumber, OTP: pinw!);
                      }));
                    },
                    child: nextButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context) {
    if (pinw != null) {
      print('pinw is $pinw');
      Network().postOtpNumber(mobileNumber, pinw!,context);

    } else {
      null;
    }
  }


}
