import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:estate/utils/colorscheme.dart';

import '../components/house_details_components.dart';

class HouseDetails extends StatefulWidget {
  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

List<String> prices = [
  '\$567,900',
  '\$335,900',
  '\$289,700',
  '\$470,000',
  '\$224,670',
  '\$490,270',
  '\$300,600',
  '\$651,230',
  '\$980,000',
  '\$300,000',
];
List<String> addresses = [
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
  '26th 2nd Street Odeneho Kwadaso',
];
List<String> houseImg = [
  'assets/images/house.jpg',
  'assets/images/house1.jpg',
  'assets/images/house2.jpg',
  'assets/images/house3.jpg',
  'assets/images/house4.jpg',
  'assets/images/house5.jpg',
  'assets/images/house6.jpg',
  'assets/images/house7.jpg',
  'assets/images/house8.jpg',
  'assets/images/house9.jpg'
];

class _HouseDetailsState extends State<HouseDetails> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Carousel(
                          dotSize: 4,
                          dotBgColor: Colors.transparent,
                          borderRadius: false,
                          showIndicator: true,
                          noRadiusForIndicator: false,
                          images: [
                            const ExactAssetImage(
                              'assets/images/carousal1.jpg',
                            ),
                            const ExactAssetImage('assets/images/carousal2.jpg'),
                            const ExactAssetImage('assets/images/carousal3.jpg'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                        Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: primaryColor),
                          child: const Center(
                              child: Text(
                            'For Sale',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Furnished',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Apartment  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            SvgPicture.asset(
                              'assets/icons/squareft.svg',
                              color: Colors.white,
                            ),
                            const Text(
                              '  750 (Sq Fts)',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.32,
                    left: MediaQuery.of(context).size.width - 50,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          child: selected
                              ? const Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: primaryColor,
                                ),
                          backgroundColor: Colors.grey[100],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              firstCompOfDetails(context),
              secondComponentOfDetails(context),
              thirdComponentOfPhotos(context),
              fourthComponent(context),
              fifthComponent(context),
              sixthComponent(context),
              Container(
                height: 150,
                child: houseDetailsList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  houseDetailsList() {
    return ListView.builder(
        itemCount: houseImg.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              index == 0
                  ? const SizedBox(
                      width: 8,
                    )
                  : Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      margin:
                          const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 140,
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.only(right: 6),
                                height: double.infinity,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(houseImg[index]))),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      prices[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          Text(
                                            addresses[index],
                                            maxLines: 2,
                                            overflow: TextOverflow.fade,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 11,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          const Text(
                                            '3 ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          const Text(
                                            'bds ',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const VerticalDivider(
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                          const Text(
                                            '5 ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          const Text(
                                            'baths ',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const VerticalDivider(
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                          const Text(
                                            '1750 ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          const Text(
                                            'sqft',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Agent: ',
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 13),
                                        ),
                                        const Text(
                                          'Trung Nguyen',
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        const Icon(Icons.star,
                                            size: 16, color: Colors.orange),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        const Text(
                                          '(0 Reviews)',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
  }
}
