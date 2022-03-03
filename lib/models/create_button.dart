import 'package:flutter/material.dart';

typedef OnPressed = void Function();

class CreateButton extends StatelessWidget {
  const CreateButton(
      {Key? key, required this.height, required this.width, required this.onPressed, required this.text, required this.color})
      : super(key: key);
  final double height, width;
  final OnPressed onPressed;
  final String text;
  final MaterialStateProperty<Color> color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(242, 242, 242, 1),
              fontSize: 17,
              fontFamily: 'OpenSans'),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            backgroundColor: color),
      ),
    );

  }
}
