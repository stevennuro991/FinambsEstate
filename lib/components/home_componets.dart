import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/utils/constants.dart';
import 'package:estate/widgets/heart_container.dart';

List images = [
  'assets/images/house.jpg',
  'assets/images/carousal1.jpg',
  'assets/images/carousal2.jpg',
  'assets/images/carousal3.jpg',
  'assets/images/house.jpg',
  'assets/images/room1.jpg',
  'assets/images/apartement.jpg',
  'assets/images/carousal1.jpg',
  'assets/images/carousal2.jpg',
  'assets/images/carousal3.jpg',
  'assets/images/house.jpg',
  'assets/images/room1.jpg',
];
List<String> prices = [
  '₵50000',
  '₵335,900',
  '₵289,700',
  '₵470,000',
  '₵224,670',
  '₵490,270',
  '₵300,600',
  '₵651,230',
  '₵980,000',
  '₵300,000',
];
List<String> addresses = [
  '16523 Choke Cherry Dr,Victorville,CA 8728',
  'Station,Hampton,GA 23423',
  '129 Hoper Ln,Folsom,CA 95300',
  '13598 Lagrone St,Powder Springs,GA 30127',
  '4625 Careyback Ave,Elk Grove,CA 7689',
  '4592 Eldywood Ln Batavia,OH 45103',
  '4028 Timber Creek Dr, Cincinnati,OH45623',
  '11456 57th St E Parrish,Fl 341219',
  '67 Marvin Park,Powder Springs,GA 30178',
  '24019 Doverwick Dr Tomball,Tx'
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

Container firstComponent(BuildContext context) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
    decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(30.0)),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'SearchProperty');
            },
            child: Row(
              children: const[
                 SizedBox(
                  width: 10,
                ),
                  Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                Text(
                  'Tìm kiếm',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'Filters');
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, top: 12.0, bottom: 12.0),
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                height: 20,
                width: 20,
                color: primaryColor,
              ),
            )),
      ],
    ),
  );
}

Container listForSecondComponent() {
  return Container(
    height: 250,
    child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return index == 0
              ? const SizedBox(
                  width: 10,
                )
              : Card(
                  margin: const EdgeInsets.only(right: 8.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 230,
                    width: 155,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'HouseDetails');
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(images[index])),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                )),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'HOME FOR SALE',
                                style: kh4,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                addresses[index],
                                style:
                                    const TextStyle(color: Colors.grey, fontSize: 10),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: const[
                                     Text(
                                      '3 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                     Text(
                                      'bds ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                     VerticalDivider(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                     Text(
                                      ' 5 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                     Text(
                                      'baths ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                     VerticalDivider(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      ' 1750 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                     Text(
                                      'sqft',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      const Text(
                                        'Starting Price',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        prices[index],
                                        style: const TextStyle(
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  HeartContainer(index)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        }),
  );
}

Card secondComponent(int index, BuildContext context) {
  return Card(
    margin: const EdgeInsets.only(right: 8.0),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: Container(
      height: 230,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'HouseDetails');
            },
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(images[index])),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HOME FOR SALE',
                  style: kh4,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  addresses[index],
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: const[
                       Text(
                        '3 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                       Text(
                        'bds ',
                        style: TextStyle(fontSize: 12),
                      ),
                       VerticalDivider(
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        ' 5 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                       Text(
                        'baths ',
                        style: TextStyle(fontSize: 12),
                      ),
                      VerticalDivider(
                        width: 1,
                        color: Colors.grey,
                      ),
                       Text(
                        ' 1750 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                       Text(
                        'sqft',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Starting Price',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          prices[index],
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: primaryColor,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 22,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Card thirdComponent(int index) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Container(
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(
                  right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(houseImg[index]))),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      prices[index],
                      style: kh2,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      addresses[index],
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: const[
                           Text(
                            '3 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                           Text(
                            'bds ',
                          ),
                           VerticalDivider(
                            width: 1,
                            color: Colors.grey,
                          ),
                         Text(
                            ' 5 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                           Text(
                            'baths ',
                          ),
                           VerticalDivider(
                            width: 1,
                            color: Colors.grey,
                          ),
                           Text(
                            ' 1,767 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                           Text(
                            'sqft',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            maxRadius: 5,
                            backgroundColor: Colors.green,
                          ),
                          const Text(
                            ' House for Sale',
                            style: TextStyle(fontSize: 12),
                          ),
                          const Spacer(),
                          HeartContainer(index)
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}

ListView listForThirdComponent() {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'HouseDetails');
            },
            child: thirdComponent(index));
      });
}
