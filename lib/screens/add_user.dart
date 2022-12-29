import 'package:chargeio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/auth_methods.dart';
import '../utils/colors.dart';
import '../utils/textstyle.dart';

List<String> gender = ['Male', 'Female'];

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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String dropdownvaluegender = gender.first;
  String dropdownvaluerole = gender.first;
  bool _passObscure = true;
  bool _confirmPassObscure = true;
  String? controlAccess;
  var confirmPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hpad20 + hpad20,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sBoxH30,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                confirmPass = value;
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _nameController.text = value!;
                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: blue),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Name',
                              ),
                            ),
                            sBoxH20,
                            Text(
                              "Email",
                              style: TextStyle(color: blue, fontSize: 24),
                            ),
                            sBoxH20,
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please enter your email");
                                }
                                // reg expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please enter a valid email");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _emailController.text = value!;
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: blue),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'someone@example.com',
                              ),
                            ),
                            sBoxH20,
                            Text(
                              "Password",
                              style: TextStyle(color: blue, fontSize: 24),
                            ),
                            sBoxH20,
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _passwordController,
                              validator: (value) {
                                confirmPass = value;
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Password is required for login");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Password(Min. 6 Character)");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _passwordController.text = value!;
                              },
                              obscureText: _passObscure,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: blue),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: '•••••••••••••',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passObscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passObscure = !_passObscure;
                                      });
                                    },
                                  )),
                            ),
                            sBoxH20,
                            Text(
                              "Confirm Password",
                              style: TextStyle(color: blue, fontSize: 24),
                            ),
                            sBoxH20,
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _confirmpasswordController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Password is required for login");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Password(Min. 6 Character)");
                                }
                                if (value != confirmPass) {
                                  return "Password must be same as above";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _passwordController.text = value!;
                              },
                              obscureText: _confirmPassObscure,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: blue),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: '•••••••••••••',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _confirmPassObscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _confirmPassObscure =
                                            !_confirmPassObscure;
                                      });
                                    },
                                  )),
                            ),
                          ],
                        ),
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
                            value: dropdownvaluegender,
                            icon: const Icon(Icons.arrow_drop_down),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownvaluegender = value!;
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
                                value: "AB",
                                groupValue: controlAccess,
                                onChanged: (value) {
                                  setState(() {
                                    controlAccess = value.toString();
                                  });
                                },
                                fillColor: MaterialStateProperty.all(blue),
                              ),
                              sBoxW5,
                              Text(
                                "AB",
                                style: TextStyle(color: blue, fontSize: 20),
                              ),
                              Radio(
                                value: "B1",
                                groupValue: controlAccess,
                                onChanged: (value) {
                                  setState(() {
                                    controlAccess = value.toString();
                                  });
                                },
                                fillColor: MaterialStateProperty.all(blue),
                              ),
                              sBoxW5,
                              Text(
                                "B1",
                                style: TextStyle(color: blue, fontSize: 20),
                              ),
                              Radio(
                                value: "B2",
                                groupValue: controlAccess,
                                onChanged: (value) {
                                  setState(() {
                                    controlAccess = value.toString();
                                  });
                                },
                                fillColor: MaterialStateProperty.all(blue),
                              ),
                              sBoxW5,
                              Text(
                                "B2",
                                style: TextStyle(color: blue, fontSize: 20),
                              ),
                              Radio(
                                value: "B3",
                                groupValue: controlAccess,
                                onChanged: (value) {
                                  setState(() {
                                    controlAccess = value.toString();
                                  });
                                },
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
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      if (_key.currentState!.validate()) {
                        String res = await AuthMethods().signUpUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            name: _nameController.text.trim(),
                            gender: dropdownvaluegender.toString(),
                            accessControl: controlAccess.toString());
                        if (res != "success") {
                          Fluttertoast.showToast(msg: "Some error occurred");
                        }
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(20)),
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
                sBoxH30
              ],
            ),
          ),
        ),
      ),
    );
  }
}
