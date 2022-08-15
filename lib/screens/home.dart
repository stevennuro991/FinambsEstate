import 'package:flutter/material.dart';
import 'package:estate/components/carousal.dart';
import 'package:estate/components/home_componets.dart';
import 'package:estate/components/textfield_with_filter.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/utils/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          textFieldWithFilter(context: context, callback: null),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New project',
                    style: kh3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'SeeAllScreen');
                    },
                    child: const Text(
                      'All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  )
                ],
              ),
            ),
            listForSecondComponent(),

            /*.............Carousal..........................*/

            appCarousal(context),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 30.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Project view more',
                    style: kh3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'SeeAllScreen');
                    },
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: listForThirdComponent(),
            )
          ],
        ),
      ),
    );
  }
}
