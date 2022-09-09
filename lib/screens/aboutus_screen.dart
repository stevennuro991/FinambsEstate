import 'package:flutter/material.dart';
import 'package:estate/components/aboutus_componetns.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              bannerForAboutUS(context),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Finambs Estate',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: listViewAboutUs(),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'CopyRight ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                        child: const Text(
                      'C',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
                    )),
                  ),
                  const Text(
                    ' 2022 BDS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'FlexSolutions',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
