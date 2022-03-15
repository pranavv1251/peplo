import 'dart:convert';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pepplo/components/input_field.dart';
import 'package:pepplo/home_navbar/main_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubCategoryPage extends StatefulWidget {
  final String category;
  SubCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  TextEditingController _controller = TextEditingController();

  final List<SelectedListItem> _sportsList = [
    SelectedListItem(false, 'None'),
    SelectedListItem(false, 'Shop Act'),
    SelectedListItem(false, 'GSTIN'),
    SelectedListItem(false, 'LLP Reg'),
    SelectedListItem(false, 'Udyog Aadhar'),
  ];

  Future<List<dynamic>> getSportsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<dynamic, dynamic> data = {};
    // print(e_did);
    var response = await http.post(
        Uri.parse("http://paarshinfotech.com/Pepplo/p_api/sports_list.php"),
        );
    data = json.decode(response.body);
    // FutureOr <List<String>> list = data['response'];
    // print(data['response'].runtimeType);
    // return [];
    // print(data['response']);
    print(data['response']);
    return data["response"];

    

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSportsList();
  }

  void submit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedIn', 'Yes');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NavbarPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.category);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.039,
              ),
              widget.category == 'Doctors & Clinics'
                  ? doctorQuestions()
                  : widget.category == 'Sport Venues'
                      ? sportsQuestions()
                      : salonQuestions(),
              SizedBox(
                height: size.height * 0.051,
              ),
              GestureDetector(
                onTap: () {
                  submit();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 51,
                    width: size.width * 0.51,
                    color: Color.fromARGB(202, 0, 0, 0),
                    child: Center(
                      child: Text(
                        'SAVE',
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

  Widget doctorQuestions() {
    return Column(
      children: [
        InputField(title: 'Specialized In', icon: CupertinoIcons.doc),
        InputField(title: 'Degree', icon: CupertinoIcons.doc),
        InputField(title: 'College Name', icon: CupertinoIcons.doc),
        InputField(title: 'Years Of Experience', icon: CupertinoIcons.doc),
        InputField(title: 'Hospital Name', icon: CupertinoIcons.doc),
      ],
    );
  }

  Widget salonQuestions() {
    return Column(
      children: [
        InputField(title: 'Number of Salons', icon: CupertinoIcons.doc),
      ],
    );
  }

  Widget sportsQuestions() {
    return Column(
      children: [
        DropDownMenu(
          title: 'Select Sports',
          isSelected: true,
          hint: "Choose all Sports",
          list: _sportsList,
          icon: CupertinoIcons.sportscourt,
          textEditingController: _controller,
        ),
      ],
    );
  }
}

class DropDownMenu extends StatefulWidget {
  List<dynamic> sports = [];
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
          widget.sports = selectedList;
          widget.textEditingController.text = selectedList.toString();
        },
        // selectedItem: (String selected) {
        //   showSnackBar(selected);
        //   widget.textEditingController.text = selected;
        // },
        enableMultipleSelection: true,
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
        ListView.builder(
            shrinkWrap: true,
            itemCount: widget.sports.length,
            itemBuilder: (context, index) {
              return Text(widget.sports[index]);
            }),
      ],
    );
  }
}
