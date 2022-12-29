import 'package:chargeio/utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/textstyle.dart';
import 'home_page.dart';

List<String> gender = ['Male', 'female'];

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  String dropdownvalue = gender.first;
  String dropdownvaluerole = gender.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hpad20 + hpad20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sBoxH30,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New User",
                        style: TextStyle(color: blue, fontSize: 25),
                      ),
                      sBoxH30,
                      Text(
                        "Name",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              maxHeight: 50, maxWidth: 350),
                          border: const OutlineInputBorder(),
                          fillColor: grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.0),
                          ),
                          hintText: 'Narendra',
                        ),
                      ),
                      sBoxH20,
                      Text(
                        "Email",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              maxHeight: 50, maxWidth: 350),
                          border: const OutlineInputBorder(),
                          fillColor: grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.0),
                          ),
                          hintText: 'someone@example.com',
                        ),
                      ),
                      sBoxH20,
                      Text(
                        "password",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              maxHeight: 50, maxWidth: 350),
                          border: const OutlineInputBorder(),
                          fillColor: grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.0),
                          ),
                          hintText: '•••••••••••••',
                        ),
                      ),
                      sBoxH20,
                      Text(
                        "Confirm Password",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      TextField(
                        controller: _confirmpasswordController,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                              maxHeight: 50, maxWidth: 350),
                          border: const OutlineInputBorder(),
                          fillColor: grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue, width: 1.0),
                          ),
                          hintText: '•••••••••••••',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sBoxH60,
                      sBoxH5,
                      Text(
                        "Gender",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      DropdownButton<String>(
                        value: dropdownvalue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 5,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvalue = value!;
                          });
                        },
                        items: gender
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text("Select"),
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: grey,
                        itemHeight: 50,
                        alignment: Alignment.center,
                        underline: Container(
                          height: 2,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      sBoxH20,
                      Text(
                        "Role",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      sBoxH20,
                      DropdownButton<String>(
                        value: dropdownvaluerole,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 5,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownvaluerole = value!;
                          });
                        },
                        items: gender
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: const Text("Select"),
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: grey,
                        itemHeight: 50,
                        alignment: Alignment.center,
                        underline: Container(
                          height: 2,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      sBoxH20,
                      Text(
                        "Access Control",
                        style: TextStyle(color: blue, fontSize: 24),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 'null',
                            onChanged: (index) {},
                            fillColor: MaterialStateProperty.all(blue),
                          ),
                          sBoxW5,
                          Text(
                            "SO",
                            style: TextStyle(color: blue, fontSize: 20),
                          ),
                          Radio(
                            value: 1,
                            groupValue: 'null',
                            onChanged: (index) {},
                            fillColor: MaterialStateProperty.all(blue),
                          ),
                          sBoxW5,
                          Text(
                            "B1",
                            style: TextStyle(color: blue, fontSize: 20),
                          ),
                          Radio(
                            value: 1,
                            groupValue: 'null',
                            onChanged: (index) {},
                            fillColor: MaterialStateProperty.all(blue),
                          ),
                          sBoxW5,
                          Text(
                            "B2",
                            style: TextStyle(color: blue, fontSize: 20),
                          ),
                          Radio(
                            value: 1,
                            groupValue: 'null',
                            onChanged: (index) {},
                            fillColor: MaterialStateProperty.all(blue),
                          ),
                          sBoxW5,
                          Text(
                            "B3",
                            style: TextStyle(color: blue, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            sBoxH20,
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Back',
                            style: loginButton,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create Account',
                                style: loginButton,
                              ),
                              sBoxW10,
                              Icon(
                                Icons.arrow_forward_ios,
                                color: white,
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
