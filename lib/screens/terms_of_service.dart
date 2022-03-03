import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/models/create_button.dart';
import 'package:ether_app/screens/referal_code.dart';
import 'package:ether_app/services/service_dio.dart';
import 'package:flutter/material.dart';

class TermsAndService extends StatelessWidget {
  const TermsAndService(
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
    var date = Dob['date'];
    var month = Dob['month'];
    var year = Dob['year'];
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(135),
            const Center(
              child: Text(
                'Terms of Service',
                style: TextStyle(
                    color: Color.fromRGBO(212, 212, 212, 1),
                    fontSize: 24,
                    fontFamily: 'OpenSans'),
              ),
            ),
            addVerticalSpace(45),
            Container(
              height: 94,
              width: 300,
              child: const Text(
                'By clicking on the below button which reads, “I agree”, you agree to our terms of service and privacy policies.',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15,
                    fontFamily: 'HelveticaRegular'),
              ),
            ),
            addVerticalSpace(10),
            CreateButton(
              height: 48,
              width: 174,
              onPressed: () {
               // Network().registerUser(
                //    fName, mobileNumber, gender, '$date/$month/$year', 'null');

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReferralCode(
                      mobileNumber: mobileNumber,
                      OTP: OTP,
                      fName: fName,
                      gender: gender,
                      Dob: Dob);
                }));
              },
              text: 'I Agree',
              color: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(35, 100, 159, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
