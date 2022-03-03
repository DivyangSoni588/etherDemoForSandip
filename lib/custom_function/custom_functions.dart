import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef OnValueChange = Function(String? value);

TextEditingController controller = TextEditingController();

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget nextButton() {
  return Container(
    height: 73,
    width: 73,
    alignment: AlignmentDirectional.bottomEnd,
    decoration:
        const BoxDecoration(color: Color(0xFF434343), shape: BoxShape.circle),
    child: Center(
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 65,
        color: Colors.white,
      ),
    ),
  );
}

Widget getRoundButton() {
  return Container(
    height: 96,
    width: 96,
    alignment: AlignmentDirectional.bottomEnd,
    decoration: const BoxDecoration(
        color: Color.fromRGBO(125, 125, 125, 1), shape: BoxShape.circle),
    child: Center(
      child: const Icon(
        Icons.add_circle_outline_sharp,
        size: 50,
        color: Colors.white,
      ),
    ),
  );
}

Widget createDOBTextField(
    double width, int maxLength, String hintText, OnValueChange valueChange) {
  return Container(
    width: width,
    height: 100,
    child: TextField(
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      style: const TextStyle(
          textBaseline: TextBaseline.alphabetic,
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'OpenSansSemiBold'),
      decoration: InputDecoration(
        hintText: hintText,
        counterText: '',
        hintStyle: TextStyle(
            fontSize: 18, fontFamily: 'OpenSansSemiBold', color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        fillColor: const Color(0xFF676767),
      ),
      onChanged: valueChange,
    ),
  );
}

Widget createPhoneTextField(
    double width, int maxLength, String hintText, OnValueChange valueChange) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.blue,
    ),
    height: 38,
    child: Padding(
      padding: EdgeInsets.all(1),
      child: TextField(
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            //textBaseline: TextBaseline.alphabetic,
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'OpenSansRegular'),
        onChanged: valueChange,
      ),
    ),
  );
}

Widget getOtpTextField(OnValueChange valueChange) {
  return Container(
    height: 53,
    width: 43,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Color(0xFF434343)),
    child: Center(
      child: TextField(
        controller: controller,
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        showCursor: false,
        textAlign: TextAlign.center,
        obscureText: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        onChanged: valueChange,
      ),
    ),
  );
}

showToast(String msg) {
  Fluttertoast.showToast(
    backgroundColor: Colors.pink,
    fontSize: 14,
    msg: msg.toUpperCase(),
  );
}
