import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:ether_app/models/create_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReferralCode extends StatelessWidget {
  const ReferralCode({Key? key,
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
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            addVerticalSpace(99),
            Row(
              children: [
                addHorizontalSpace(31),
                const Text(
                  'Got a referral code?',
                  style: TextStyle(
                      color: Color.fromRGBO(172, 172, 172, 1),
                      fontSize: 28,
                      fontFamily: 'OpenSans'),
                ),
              ],
            ),
            addVerticalSpace(45),
            Row(
              children: [
                addHorizontalSpace(31),
                Container(
                  width: 293,
                  height: 53,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'OpenSansSemiBold'),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: const Color(0xFF676767),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            addVerticalSpace(63),
            Row(
              children: [
                addHorizontalSpace(43),
                CreateButton(height: 59,
                  width: 168,
                  onPressed: () {},
                  text: 'Yes, submit',
                  color: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(60, 139, 139, 1),),),
              ],
            ),
            addVerticalSpace(22),
            Row(
              children: [
                addHorizontalSpace(43),
                CreateButton(
                  height: 59,
                  width: 168,
                  onPressed: () {},
                  text: 'No, skip',
                  color: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(106, 106, 106, 1),),)

              ],
            ),
          ],
        ),
      ),
    );
  }
}
