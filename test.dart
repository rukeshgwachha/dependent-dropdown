import 'package:flutter/material.dart';
import 'package:realestate/models/address_model.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Address address =Address();
  
  
   // ignore: prefer_final_fields
 
  provinceDependentDropdowm() {
    address.provienceName.forEach((key, value) {
      address.provienceList.add(key);
    });
  }

  // ignore: non_constant_identifier_names
  DistrictDependentDropdowm(provienceName) {
    address.DistrictName.forEach((key, value) {
      if(provienceName==value) {
        address.districtList.add(key);
      }
    });
   address.selectedDistrict =address.districtList[0];   // After comparison the 1st district name of provience will assign as selected district
  }

  @override
  void initState() {
    Address address =Address();
    provinceDependentDropdowm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
              value: address.selectedProvience,
              items: address.provienceList.map((provience) {
                return DropdownMenuItem(
                    value: provience, child: Text(provience));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  address.districtList=[]; // clear the selected district incase other disxtrict is selected

                   
                  DistrictDependentDropdowm(address.provienceName[newValue]);
                 
                  address.selectedProvience = "$newValue";
                });
              }),
          const SizedBox(height: 25),
          DropdownButton(
              value: address.selectedDistrict,
              items: address.districtList.map((district) {
                return DropdownMenuItem(
                    value:district, child: Text(district));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  address.selectedDistrict = "$newValue";
                });
              }),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
