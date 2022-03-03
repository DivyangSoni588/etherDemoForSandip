import 'package:flutter/material.dart';

class TextWithRadio extends StatelessWidget {
  const TextWithRadio({Key? key,required this.text,required this.radio}) : super(key: key);

  final String text;
  final Widget radio;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width - 40,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF656565)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'OpenSansSemiBold'),
              ),
              radio,
            ],
          ),
        ));
  }
}
