
import 'package:flutter/material.dart';
import 'package:estate/components/home_componets.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/utils/constants.dart';



class Properties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(iconTheme: const IconThemeData(color: Color(0xff979696)),
          backgroundColor: Colors.white,
          elevation: 2,
          title: const Text('Properties',style: TextStyle(color: Colors.black),),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: propertiesList()
        ),
      ),
    );
  }
  propertiesList() {
    return ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return  Column(
            children: [
              index==0?
            const SizedBox(height: 20,):
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'HouseDetails');
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 18.0, top: 8.0, left: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(houseImg[index]))),
                          ),
                        ),
                        Expanded(
                            flex: 6,
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
                                      children: [
                                        const Text(
                                          '3 ',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          'bds ',
                                        ),
                                        const VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        const Text(
                                          ' 5 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          'baths ',
                                        ),
                                        const VerticalDivider(
                                          width: 1,
                                          color: Colors.grey,
                                        ),

                                        const Text(
                                          ' 1,767 ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
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
                                    padding: const EdgeInsets.only(bottom:8.0),
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
                                        const CircleAvatar(
                                          maxRadius: 12,
                                          backgroundColor: primaryColor,
                                          child: const Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ],
          );
        });
  }
}
