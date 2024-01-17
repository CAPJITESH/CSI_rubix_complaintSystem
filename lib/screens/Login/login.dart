import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Signup/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/widgets/textfield.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailaddress = TextEditingController();
  TextEditingController _password = TextEditingController();




  @override
  Widget build(BuildContext context) {
    



    // ignore: deprecated_member_use
    return Scaffold(
      // resizeToAvoidBottomInset: ,
      backgroundColor: color1,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: InkWell(
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: color1,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    // alignment: Alignment.center,
                    height: 230,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login_pic.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                // SizedBox(height: 15,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.white),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            "Login into your account",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextBox(
                            controller: _emailaddress,
                            hinttext: "Email address",
                            validator: (value) {
                              if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value!)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            obscureText: false,
                            label: '',
                            icon: Icons.mail_rounded,
                          ),
                          const SizedBox(height: 10.0),
                          TextBox(
                            controller: _password,
                            hinttext: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            obscureText: true,
                            label: '',
                            isPassword: true,
                          ),
                          const SizedBox(height: 10.0),
                          InkWell(
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: color2,
                                  decoration: TextDecoration.underline,
                                  decorationColor: color2,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              
                            },
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Email: ${_emailaddress.text}');
                                print('Password: ${_password.text}');
    
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => BottomNavBar()),
                                // );
                                // Navigator.of(context).pushAndRemoveUntil(
                                //   MaterialPageRoute(
                                //       builder: (context) => BottomNavBar()),
                                //   (route) => false,
                                // );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              minimumSize: const Size(double.infinity,
                                  50.0), // Set the button height
                            ),
                            child: const Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            height: 65,
                          ),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Don't have an Account?",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                children: [
                                  TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(
                                        color: color2,
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        decorationColor: color2,
                                        fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUp()),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
