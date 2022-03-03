import 'package:ether_app/models/user.dart';
import 'package:ether_app/screens/your_dateofbirth.dart';
import 'package:flutter/material.dart';
import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? fName;
User user = User();

class WhatsYourName extends StatelessWidget {
  const WhatsYourName({Key? key, required this.mobileNumber, required this.OTP})
      : super(key: key);
  final int mobileNumber, OTP;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            addVerticalSpace(99),
            Row(
              children: [
                addHorizontalSpace(36),
                const Text(
                  'What\'s your name?',
                  style: TextStyle(
                      color: Color.fromRGBO(172, 172, 172, 1),
                      fontSize: 28,
                      fontFamily: 'OpenSans'),
                ),
              ],
            ),
            addVerticalSpace(50),
            Row(
              children: [
                addHorizontalSpace(37),
                Container(
                  width: 200,
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'OpenSansSemiBold'),
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle( fontSize: 15,
                          fontFamily: 'OpenSansSemiBold',),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: const Color(0xFF676767),
                    ),
                    onChanged: (value) {
                      print(value);
                      fName = value;
                    },
                  ),
                ),
              ],
            ),
            addVerticalSpace(140),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: nextButton(),
                  onTap: () {
                    print(fName);
                    if (fName != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return YourDOB(
                            mobileNumber: mobileNumber,
                            OTP: OTP,
                            fName: fName!);
                      }));
                    } else {
                      showToast('Please Provide Fisrt Name');
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
