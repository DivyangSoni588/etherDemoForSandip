import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:ether_app/screens/mobile_number_verification.dart';
import 'package:flutter/material.dart';

import '../screens/phone_number_entry.dart';
import '../screens/whats_your_name.dart';

class Network {
  late Dio _dio;
  String urlPhoneSubmit = 'https://ethersocial.app/auth/login';
  String urlOtpSubmit = 'https://ethersocial.app/auth/otp';
  String urlRegisterUser = 'https://ethersocial.app/auth/register';

  Network() {
    _dio = Dio();
  }

  Future<bool> postPhoneNumber(int phoneNumber) async {
    //Response response = await _dio.post(url);
    var params = {
      "phone": '+91$phoneNumber',
    };

    Response response = await _dio.post(
      urlPhoneSubmit,
      data: jsonEncode(params),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postOtpNumber(
      int phoneNumber, int otp, BuildContext context) async {
    print('postOtpCalled');
    var params = {"phone": '+91$phoneNumber', "otp": "$otp"};

    Response response = await _dio.post(
      urlPhoneSubmit,
      data: jsonEncode(params),
    );
    print("response.statusCode in otp = ${response.statusCode}");
    if (response.statusCode == 200) {
      moveToOtherPage(context, phoneNumber);
      return true;
    } else {
      showToast('Wrong Otp');
      return false;
    }
  }

  Future<bool> registerUser(String name, int phoneNumber, String gender,
      String DOB, String email) async {
    print('RegisterUser');
    var params = {
      "name": "$name",
      "phone": '+91$phoneNumber',
      "gender": "$gender",
      "dateOfBirth": "$DOB",
      "recoveryEmail": "$email"
    };

    Response response = await _dio.post(
      urlRegisterUser,
      data: jsonEncode(params),
    );
    print("response.statusCode in register User = ${response.statusCode}");
    if (response.statusCode == 200) {
      // moveToOtherPage(context, phoneNumber);
      showToast('Registered Succesfully');
      return true;
    } else {
      showToast('Something Wrong');
      return false;
    }
  }
}

void moveToOtherPage(BuildContext context, int mobileNumber) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return WhatsYourName(mobileNumber: mobileNumber, OTP: pinw!);
  }));
}
