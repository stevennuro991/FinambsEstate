import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/utils/constants.dart';
import '../screens/locationForHouseDetails.dart';

Stack customCarousal(BuildContext context) {
  return Stack(
    children: [
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Carousel(
              dotSize: 4,
              dotBgColor: Colors.transparent,
              borderRadius: false,
              showIndicator: true,
              noRadiusForIndicator: false,
              images: const [
                ExactAssetImage(
                  'assets/images/carousal1.jpg',
                ),
                ExactAssetImage('assets/images/carousal2.jpg'),
                ExactAssetImage('assets/images/carousal3.jpg'),
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Biệt Thự',
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
                  'Thành Phố Hà Nội ',
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
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            child: const Icon(
              Icons.favorite,
              color: primaryColor,
            ),
            backgroundColor: Colors.grey[100],
          ),
        ),
      )
    ],
  );
}

Container firstCompOfDetails(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.28,
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Giá',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Text(
          '\$ 335,900',
          style: TextStyle(
              color: primaryColor, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/bed.svg',
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '3 beds',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: VerticalDivider(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/washroom.svg',
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '5 baths',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: VerticalDivider(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/kitchen.svg',
                        height: 20,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '2 kitchens',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    ),
  );
}

Container secondComponentOfDetails(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 8.0),
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Mô Tả',
          style: kh1,
        ),
        Text(
            'Bán gấp biệt thự song lập mặt phố đường rộng 40m tại Thành Phố Hà Nội.'),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    ),
  );
}

Container thirdComponentOfPhotos(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.28,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Photos',
            style: kh1,
          ),
        ),
        Container(
          height: 100,
          child: listForThirdComp(),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        )
      ],
    ),
  );
}

ListView listForThirdComp() {
  List<String> urlImages = [
    'assets/images/house.jpg',
    'assets/images/house1.jpg',
    'assets/images/house2.jpg',
    'assets/images/house3.jpg',
    'assets/images/house4.jpg',
    'assets/images/house5.jpg'
  ];
  return ListView.builder(
      itemCount: urlImages.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            index == 0
                ? const SizedBox(
                    width: 8,
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(urlImages[index - 1]))),
                  ),
          ],
        );
      });
}

Container fourthComponent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chi Tiết',
          style: kh1,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            const Text(
              '    BosPhorus Views',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            const Text(
              '    Telephone',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            const Text(
              '    Family Villa',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            const Text(
              '    Internet',
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ],
    ),
  );
}

Container fifthComponent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vị Trí',
          style: kh1,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red,
          ),
          child: LocationForHouseDetails(),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider()
      ],
    ),
  );
}

Container sixthComponent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.35,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Liên Hệ',
          style: kh1,
        ),
        const SizedBox(
          height: 15,
        ),
        const Center(
          child: CircleAvatar(
            maxRadius: 45,
            backgroundImage: AssetImage('assets/images/person2.jpeg'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
            child: Text(
          'Xuân Hiếu',
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
        )),
        const Center(
            child: Text(
          '0334859652',
          style: TextStyle(color: Colors.black, fontSize: 14),
        )),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.phone_in_talk,
                    color: primaryColor,
                    size: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Call',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.mail,
                    color: primaryColor,
                    size: 17,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Message',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
