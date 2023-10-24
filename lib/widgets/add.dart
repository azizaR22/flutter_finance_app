import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime date = DateTime.now();
  String? selctedItem; // the selected menu name
  final TextEditingController explain_c = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount = TextEditingController();
  FocusNode am = FocusNode();
  final List<String> _item = [
    // dropdown name
    'food',
    'transfare',
    'transportation',
    'Education',
  ];
  final List<String> how = [
    // dropdown name
    'income',
    'expenses'
  ];
  String? selected_how;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [backgroud_container(context), maincontainer()],
        ),
      ),
    );
  }

  Stack maincontainer() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 550,
          width: 340,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              dropdow_menu(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Positioned(
          top: 60 +
              30 +
              30, // adjust the vertical position based on the height of the preceding widgets
          left: 20, // adjust the horizontal position as needed
          right: 20,
          child: explain_text_field(),
        ),
        SizedBox(
          height: 50,
        ),
        Positioned(
          top: 104 +
              40 +
              40, // adjust the vertical position based on the height of the preceding widgets
          left: 20, // adjust the horizontal position as needed
          right: 20,
          child: amount_text_field(),
        ),
        Positioned(
          top: 150 +
              50 +
              50, // adjust the vertical position based on the height of the preceding widgets
          left: 5, // adjust the horizontal position as needed
          right: 5,
          child: how_dropdown(),
        ),
        Positioned(
          top: 215 +
              60 +
              60, // adjust the vertical position based on the height of the preceding widgets
          left: 20, // adjust the horizontal position as needed
          right: 20,
          child: Datepicker(),
        ),
        Positioned(
          top: 315 +
              60 +
              60, // adjust the vertical position based on the height of the preceding widgets
          left: 70, // adjust the horizontal position as needed
          right: 70,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xff368983),

            ),
            width: 120,
            height: 50,
            child: Text('Save', style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),),


          ),
        ),
      ],
    );
  }

  Container Datepicker() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Color(0xffc5c5c5),
        ),
      ),
      child: TextButton(
        onPressed: () async {
          DateTime? NewDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (NewDate == null) return;
          setState(() {
            date = NewDate!;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.month} / ${date.day}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  TextField explain_text_field() {
    return TextField(
      focusNode: ex,
      controller: explain_c,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelText: 'explain',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff368983),
            )),
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.grey.shade500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
        ),
      ),
    );
  }

  TextField amount_text_field() {
    return TextField(
      focusNode: am,
      controller: amount,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelText: 'amount',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Color(0xff368983),
            )),
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.grey.shade500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Color(0xffc5c5c5)),
        ),
      ),
    );
  }

  Padding how_dropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Color(0xffc5c5c5),
          ),
        ),
        child: DropdownButton(
          value: selected_how,
          items: how
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset('images/exp.jpeg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  value: (e),
                ),
              )
              .toList(),
          selectedItemBuilder: (context) {
            return how
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Image.asset('images/exp.jpeg'),
                        ),
                        SizedBox(width: 5),
                        Text(e),
                      ],
                    ))
                .toList();
          },
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'How',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          onChanged: ((value) {
            setState(() {
              selected_how = value!;
            });
          }),
        ),
      ),
    );
  }

  Padding dropdow_menu() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffc5c5c5),
          ),
        ),
        child: DropdownButton(
          value: selctedItem,
          items: _item
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset('images/$e.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  value: (e),
                ),
              )
              .toList(),
          selectedItemBuilder: (context) {
            return _item
                .map((e) => Row(
                      children: [
                        Container(
                          width: 42,
                          child: Image.asset('images/$e.png'),
                        ),
                        SizedBox(width: 5),
                        Text(e),
                      ],
                    ))
                .toList();
          },
          hint: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Name',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          onChanged: ((value) {
            setState(() {
              selctedItem = value!;
            });
          }),
        ),
      ),
    );
  }

  Column backgroud_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      'Adding',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
