import 'package:ether_app/models/user.dart';
import 'package:ether_app/services/service_dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'mobile_number_verification.dart';

int? mobileNumber;
final myController = TextEditingController();
User user = User();

class PhoneNumberEntry extends StatelessWidget {
  const PhoneNumberEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              addVerticalSpace(70),
              const Center(
                child: Text(
                  'What\'s Your Number?',
                  style: TextStyle(
                      color: Color.fromRGBO(172, 172, 172, 1),
                      fontSize: 28,
                      fontFamily: 'OpenSans'),
                ),
              ),
              addVerticalSpace(25),
              Row(
                children: [
                  addHorizontalSpace(17),
                  Container(
                    child: Text(
                      'Mobile phone number verification is ',
                      style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 15,
                          fontFamily: 'OpenSansRegular'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  addHorizontalSpace(17),
                  Container(
                    child: const Text(
                      'essential for ensuring that everyone on ',
                      style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 15,
                          fontFamily: 'OpenSansRegular'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  addHorizontalSpace(17),
                  Container(
                    child: Text(
                      'Ether is real.',
                      style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 15,
                          fontFamily: 'OpenSansRegular'),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(50),
              Flexible(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.baseline,
                  // textBaseline: TextBaseline.ideographic,
                  // crossAxisAlignment: CrossAxisAlignment.stre,
                  children: [
                    addHorizontalSpace(12),
                    Container(
                      width: 88,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF434343),
                      ),
                      child: const Center(
                          child: Text(
                        'IN +91',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'OpenSansRegular'),
                      )),
                    ),
                    addHorizontalSpace(6),
                    // createDOBTextField(206, 10, 'Phone number', (value){
                    //
                    // }),
                    // createPhoneTextField(206, 10, 'Phone number', (value) {
                    //   mobileNumber = int.parse(value!);
                    // }),
                    Container(
                      width: 206,
                      height: 38,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'OpenSansRegular'),
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            fontFamily: 'OpenSansRegular',
                          ),
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
                          if (value.length >= 10) {
                            mobileNumber = int.parse(value);
                            print('$mobileNumber mobile number');
                          }

                          // fName = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(43),
              Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    color: Colors.white,
                  ),
                  addHorizontalSpace(10),
                  const Text(
                    'We never share this with anyone and it won\'t \nbe on your profile.',
                    style: TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 13,
                        fontFamily: 'OpenSansRegular'),
                  )
                ],
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('hello');
                      if (mobileNumber != null) {
                        print(mobileNumber);
                        //Network().postPhoneNumber(mobileNumber!);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MobileNumberVerification(
                            mobileNumber: mobileNumber!,
                          );
                        }));
                        myController.clear();
                      } else {
                        showToast('Please Provide Correct Number');
                      }
                    },
                    child: nextButton(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// TextField(
//
// style: const TextStyle(
// color: Colors.white,
// fontSize: 15,
// fontFamily: 'OpenSansRegular'),
//
// maxLengthEnforcement: MaxLengthEnforcement.enforced,
// onChanged: (value) {
// print('value is $value');
// print(value.length);
//
// if (value.length >= 10) {
// mobileNumber = int.parse(value);
// // var abc = mobileNumber!.bitLength;
// // print(mobileNumber);
// }
// },
// decoration: InputDecoration(
// hintText: 'Phone number',
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(30.0),
// borderSide: const BorderSide(
// width: 0,
// style: BorderStyle.none,
// ),
// ),
// filled: true,
// contentPadding: const EdgeInsets.all(16),
// fillColor: const Color(0xFF434343),
// ),
// ),
