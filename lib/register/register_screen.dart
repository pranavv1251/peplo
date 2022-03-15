import 'dart:ui';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pepplo/components/input_field.dart';
import 'package:pepplo/register/sub_category_screen.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var selectedCategory = '';
  TextEditingController _categoryController = TextEditingController ();
  TextEditingController _licenseController = TextEditingController();

  final List<SelectedListItem> _categoriesList = [
    SelectedListItem(false, 'Doctors & Clinics'),
    SelectedListItem(false, 'Salons & Spas'),
    SelectedListItem(false, 'Sport Venues'),
  ];

  final List<SelectedListItem> _licenseList = [
    SelectedListItem(false, 'None'),
    SelectedListItem(false, 'Shop Act'),
    SelectedListItem(false, 'GSTIN'),
    SelectedListItem(false, 'LLP Reg'),
    SelectedListItem(false, 'Udyog Aadhar'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.051, horizontal: size.width * 0.031),
          child: Column(
            children: [
              Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: size.width * 0.40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: size.width * 0.40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.039,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NameInputField(
                    width: size.width * 0.44,
                    title: 'First Name',
                  ),
                  NameInputField(
                    title: 'Last Name',
                    width: size.width * 0.44,
                  ),
                ],
              ),
              InputField(title: 'Business Name', icon: CupertinoIcons.tag),
              InputField(
                title: 'Business Adress',
                icon: CupertinoIcons.location,
              ),
              InputField(title: 'Phone Number', icon: CupertinoIcons.phone),
              InputField(title: 'Email Address', icon: CupertinoIcons.mail),
              DropDownMenu(
                title: 'Business Category',
                list: _categoriesList,
                isSelected: true,
                textEditingController: _categoryController,
                hint: 'Choose Your Business Category',
                icon: CupertinoIcons.arrowtriangle_down,
              ),
              DropDownMenu(
                title: 'Type of Business License',
                list: _licenseList,
                isSelected: true,
                hint: 'Choose Your License Type',
                icon: CupertinoIcons.arrowtriangle_down,
                textEditingController: _licenseController,
              ),
              InputField(
                title: 'Total Employees',
                icon: CupertinoIcons.group,
              ),
              InputField(
                title: 'Marketing Expenditure',
                icon: CupertinoIcons.money_dollar,
              ),
              SizedBox(
                height: size.height * 0.051,
              ),
              GestureDetector(
                onTap: () {
                  selectedCategory = _categoryController.text;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SubCategoryPage(
                      category: selectedCategory,
                    );
                  }));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 51,
                    width: size.width * 0.51,
                    color: Color.fromARGB(202, 0, 0, 0),
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool isSelected;
  final List<SelectedListItem>? list;
  final String title;
  IconData icon;
  DropDownMenu({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.hint,
    required this.list,
    required this.icon,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  TextEditingController _searchTextEditingController = TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: 'Done',
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: 'Search....',
        bottomSheetTitle: 'Categories',
        searchBackgroundColor: Colors.black12,
        dataList: widget.list ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showSnackBar(selectedList.toString());
        },
        selectedItem: (String selected) {
          showSnackBar(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15.0,
        ),
        Text(widget.title),
        Container(
          padding: EdgeInsets.only(top: 4),
          height: 44,
          width: double.infinity,
          child: TextFormField(
            controller: widget.textEditingController,
            cursorColor: Colors.black,
            onTap: widget.isSelected
                ? () {
                    FocusScope.of(context).unfocus();
                    onTextFieldTap();
                  }
                : null,
            decoration: InputDecoration(
              suffixIcon: Icon(widget.icon),
              hintText: widget.hint,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}


class NameInputField extends StatelessWidget {
  final double width;
  final String title;
  const NameInputField({Key? key, required this.width, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          padding: EdgeInsets.only(top: 4),
          height: 44,
          width: width,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
