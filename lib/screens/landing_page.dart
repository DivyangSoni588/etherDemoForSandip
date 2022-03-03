import 'package:ether_app/screens/phone_number_entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(16, 16, 16, 1),
              Color.fromRGBO(28, 28, 28, 1),
              Color.fromRGBO(43, 43, 43, 1),
              Color.fromRGBO(88, 88, 88, 1),
              Color.fromRGBO(95, 95, 95, 1),

            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                // SizedBox(
                //   height: 50,
                // ),
                const Text(
                  'E T H E R',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'HelveticaRoundedBold',
                      color: Color.fromRGBO(172, 172, 172, 1)),
                ),
                CardForEther(
                  colour: const Color(0xFF3F3F3F),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xFF2E2E2E),
                        foregroundColor: Color(0xFF2E2E2E),
                        backgroundImage: AssetImage('images/image111.jpg'),
                      )
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      'Meet new People',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 22,
                        fontFamily: 'HelveticaRoundedBold',
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Pursue common interests',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 22,
                          fontFamily: 'HelveticaRoundedBold'),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return PhoneNumberEntry();
                  })),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: size.width - 50,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF626262),
                      //border: new Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign up/Login via Mobile',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontFamily: 'NunitoBold'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardForEther extends StatelessWidget {
  const CardForEther({Key? key, this.colour, this.cardChild}) : super(key: key);
  final Color? colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 120,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D0D0D),
            Color(0xFF2E2E2E),
            Color(0xFF303030),
          ],
          stops: [0.2, 0.5, 0.3],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        //borderRadius: BorderRadius.circular(30),
      ),
      child: cardChild,
    );
  }
}
