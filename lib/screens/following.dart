import 'package:flutter/material.dart';
import 'package:estate/utils/colorscheme.dart';

class Following extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: const Color(0xff979696)),
          backgroundColor: Colors.white,
          elevation: 2,
          title: const Text(
            'Following',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*..................Text of Friend List...................*/
            Expanded(
              child: Container(
                child: followingList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListView followingList() {
    List<String> images = [
      
      'assets/images/person10.jpg',
    ];
    List<String> personNames = [
      
      'Nnuro ',
      
    ];

    return ListView.builder(
        itemCount: images.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                image: AssetImage(images[index]),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            right: 2,
                            bottom: 12,
                            child: CircleAvatar(
                              maxRadius: 6,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Color(0xff51ce6a),
                                maxRadius: 5,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      personNames[index],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: primaryColor)),
                      child: const Center(
                          child: const Text(
                        'UNFOLLOW',
                        style: TextStyle(color: primaryColor),
                      )),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
