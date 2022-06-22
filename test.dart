import 'package:flutter/material.dart';
import 'package:realestate/models/address_model.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Address address = Address();

  // ignore: prefer_final_fields

  provinceDependentDropdowm() {
    address.provienceName.forEach((key, value) {
      address.provienceList.add(key);
    });
  }

  // ignore: non_constant_identifier_names
  DistrictDependentDropdowm(provienceName) {
    address.districtName.forEach((key, value) {
      if (provienceName == value) {
        address.districtList.add(key);
      }
    });
    address.selectedDistrict = address.districtList[
        0]; // After comparison the 1st district name of provience will assign as selected district
  }

  muncipalityDependentDropdowm(inputdistrict) {
    address.muncipalityName.forEach((key, value) {
      if (inputdistrict == value) {
        address.muncipalityList.add(key);
      }
    });
    address.selectedMuncipality = address.muncipalityList[
        0]; // After comparison the 1st district name of provience will assign as selected district
  }

  @override
  void initState() {
    Address address = Address();
    provinceDependentDropdowm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Column(
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
                    address.districtList =
                        []; 
                        address.muncipalityList=[];// clear the selected district incase other disxtrict is selected

                    DistrictDependentDropdowm(address.provienceName[newValue]);

                    address.selectedProvience = "$newValue";
                  });
                }),
            const SizedBox(height: 25),
            DropdownButton(
                value: address.selectedDistrict,
                items: address.districtList.map((district) {
                  return DropdownMenuItem(
                      value: district, child: Text(district));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    address.muncipalityList=[];
                    address.selectedDistrict = "$newValue";
              
                    muncipalityDependentDropdowm(
                       "$newValue");
                  });
                }),
            const SizedBox(height: 25),
            const SizedBox(height: 25),

            /* ####################### Muncipality ################################ */

            DropdownButton(
                value: address.selectedMuncipality,
                items: address.muncipalityList.map((muncipality) {
                  return DropdownMenuItem(
                      value: muncipality, child: Text(muncipality));
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    address.selectedMuncipality = "$newValue";
                  });
                }),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
