import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:estate/components/add_property_comp.dart';
import 'package:estate/utils/colorscheme.dart';
import 'package:estate/widgets/banner_for_add_property.dart';
import 'package:estate/widgets/bathrooms_container.dart';
import 'package:estate/widgets/bedrooms_container.dart';
import 'package:estate/widgets/custom_button.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [false, false, false, false];
  bool selectedColorForPropertyType1 = true;
  bool selectedColorForPropertyType2 = false;
  bool selectedColorForPropertyType3 = false;
  int selectedView;

  final List<String> _provincesName = ["Kumasi", "Accra", "Tamale", 'Takoradi'];
  String _provinceValue;

  final List<dynamic> _citiesName = ["Ejisu", "East Legon", 'Osu',"Accra Newtown"];
  String _cityValue;
  List<dynamic> _countryCode = ['+233'];
  String _countryValue;

  @override
  void initState() {
    super.initState();

    selectedView = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> propertyViews = [
      _residentialView(),
      _commercialView(),
      _industrialView()
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerForAddProperty(),
              _titleAndDescription(),
              _areaField(),
              _priceField(),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Type of Real Estate',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _rowOfButtons(),
              Container(
                child: propertyViews[selectedView],
              ),
              /*...........................Bedrooms.......................*/
              BedroomsContainer(),
              BathroomContainer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Select Photo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /* ..................Grid View........................*/
              _customGridView(),
              const SizedBox(
                height: 10,
              ),
              /*........................Text of Country PKR and Change History...........*/
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Text(
                      'Address  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Text(
                      '',
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: addPropertyTextField('Address'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: addPropertyTextField('Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: _countryCodeAndPhoneNumberField()),
              const SizedBox(
                height: 10,
              ),
              _rowOfDropDowns(),
              const SizedBox(
                height: 30,
              ),
              /*.......................Submit Button.................................*/
              const Padding(
                padding: EdgeInsets.all(8.0),
                // child: CustomButton(
                //   title: 'SUBMIT NOW',
                //   callback: () {},
                // ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _titleAndDescription() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          addPropertyTextField('Title'),
          const SizedBox(height: 10),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xfffafafa),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              maxLines: 3,
              style: const TextStyle(fontSize: 16),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15, top: 5),
                hintText: 'Description',
                hintStyle: TextStyle(color: Colors.grey[500]),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _areaField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Acre  ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '( Sq Feet )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Change',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Area'),
        ),
      ],
    );
  }

  _priceField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              const Text(
                'Price ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                '( USD )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                'Change',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Area'),
        )
      ],
    );
  }

  _rowOfButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 0;
                  selectedColorForPropertyType1 = true;
                  selectedColorForPropertyType2 = false;
                  selectedColorForPropertyType3 = false;

                  print(selectedView);
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType1 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType1 == true
                            ? primaryColor
                            : Colors.grey)),
                child: Center(
                  child: Text(
                    'Community',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType1 == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 1;
                  print(selectedView);
                  selectedColorForPropertyType1 = false;
                  selectedColorForPropertyType2 = true;
                  selectedColorForPropertyType3 = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType2 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType2 == true
                            ? primaryColor
                            : Colors.grey)),
                child: Center(
                  child: Text(
                    'City',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType2 == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 2;
                  print(selectedView);

                  selectedColorForPropertyType1 = false;
                  selectedColorForPropertyType2 = false;
                  selectedColorForPropertyType3 = true;
                });
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: selectedColorForPropertyType3 == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedColorForPropertyType3 == true
                            ? primaryColor
                            : Colors.grey)),
                child: Center(
                  child: Text('Industry',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedColorForPropertyType3 == true
                            ? Colors.white
                            : Colors.black,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _residentialView() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  _commercialView() {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  _industrialView() {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Upper portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Commercial',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Lower portion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Residential',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }

  _countryCodeAndPhoneNumberField() {
    return Row(
      children: <Widget>[
        Container(
          child: Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: const Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: Colors.grey[500],
                  iconDisabledColor: Colors.grey[500],
                  hint: Text(
                    '+1',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  style: TextStyle(color: Colors.grey[500]),
                  value: _countryValue,
                  onChanged: (newValue) {
                    setState(() {
                      _countryValue = 'newValue';
                    });
                  },
                  items: _countryCode.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          child: Flexible(
              flex: 7,
              child: TextFormField(
                  enabled: true,
                  style: const TextStyle(fontSize: 16),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                      ),
                      fillColor: const Color(0xfffafafa),
                      filled: true,
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.orange)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Colors.grey))))),
        ),
      ],
    );
  }

  _customGridView() {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(10.0)),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: List.generate(6, (index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: const Icon(
              Icons.add,
              color: Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  _rowOfDropDowns() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: <Widget>[
          Container(
            child: Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconEnabledColor: Colors.grey[500],
                    iconDisabledColor: Colors.grey[500],
                    hint: Text(
                      'Choose Province',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    style: TextStyle(color: Colors.grey[500]),
                    value: _provinceValue,
                    onChanged: (newValue) {
                      setState(() {
                        _provinceValue = 'newValue';
                      });
                    },
                    items: _provincesName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    iconEnabledColor: Colors.grey[500],
                    iconDisabledColor: Colors.grey[500],
                    hint: Text(
                      'Choose city',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    style: TextStyle(color: Colors.grey[500]),
                    value: _cityValue,
                    onChanged: (newValue) {
                      setState(() {
                        _cityValue = 'newValue';
                      });
                    },
                    items: _citiesName.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
