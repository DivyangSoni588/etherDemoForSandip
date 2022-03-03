import 'package:ether_app/screens/gender_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ether_app/custom_function/custom_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';

int? date, month, year;

class YourDOB extends StatelessWidget {
  const YourDOB(
      {Key? key,
      required this.mobileNumber,
      required this.OTP,
      required this.fName})
      : super(key: key);
  final int mobileNumber, OTP;
  final String fName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(

          children: [
            addVerticalSpace(99),
            const Text(
              'When\'s your birthday?',
              style: TextStyle(
                  color: Color(0xFFA6A6A6),
                  fontSize: 28,
                  fontFamily: 'OpenSans'),
            ),
            addVerticalSpace(85),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 12),
                    ),
                    addVerticalSpace(12),
                    createDOBTextField(60, 2, 'DD', (dates) {
                      if (dates!.length > 1) {
                        date = int.parse(dates);
                      }
                    }),
                  ],
                ),
                addHorizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Month',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 12),
                    ),
                    addVerticalSpace(12),
                    createDOBTextField(60, 2, 'MM', (months) {
                      if (months!.length > 1) {
                        month = int.parse(months);
                      }
                    }),
                  ],
                ),
                addHorizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Year',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSansSemiBold',
                          fontSize: 12),
                    ),
                    addVerticalSpace(12),
                    createDOBTextField(100, 4, 'YYYY', (years) {
                      if (years!.length > 3) {
                        year = int.parse(years);
                      }
                    }),
                  ],
                ),
              ],
            ),
            addVerticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: nextButton(),
                  onTap: () {
                    // print(DOB);
                    if (date != null && month != null && year != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GenderSelection(
                            mobileNumber: mobileNumber,
                            OTP: OTP,
                            fName: fName,
                            date: date!,
                            month: month!,
                            year: year!);
                      }));
                    } else {
                      //  Navigator.push(context, route);
                     showToast('Please Provide correct DateOfBirth');

                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
