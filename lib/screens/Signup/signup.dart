import 'package:complaint_management/auth/auth.dart';
import 'package:complaint_management/constants.dart';
import 'package:complaint_management/screens/Login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:complaint_management/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();

  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _cnfpasswordNode = FocusNode();

  bool valueCheck = false;

  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: InkWell(
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
                const Text(
                  "Let's Get Started",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Create your own account",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextBox(
                  controller: _phoneNoController,
                  hinttext: "Phone number",
                  validator: (value) {
                    if (value?.length != 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }

                    return null;
                  },
                  obscureText: false,
                  label: '',
                  icon: Icons.phone_android_rounded,
                  isNumber: true,
                ),
                const SizedBox(height: 5.0),
                TextBox(
                  controller: _emailController,
                  hinttext: "Email address",
                  validator: (value) {
                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  obscureText: false,
                  label: '',
                  node: _emailNode,
                  icon: Icons.mail_outline_rounded,
                ),
                const SizedBox(height: 5),
                TextBox(
                  controller: _passwordController,
                  hinttext: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  label: '',
                  node: _passwordNode,
                  isPassword: true,
                ),
                const SizedBox(height: 5.0),
                TextBox(
                  controller: _confirmPasswordController,
                  hinttext: "Confirm password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: true,
                  label: '',
                  node: _cnfpasswordNode,
                  isPassword: true,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: valueCheck,
                      onChanged: (value) {
                        setState(() {
                          valueCheck = !valueCheck;
                        });
                      },
                      activeColor: color2,
                      checkColor: Colors.white,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'I agree with ',
                        style: TextStyle(color: color3),
                        children: [
                          TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                              color: color2,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Terms click
                                print('Terms clicked');
                              },
                          ),
                          TextSpan(
                              text: ' and ', style: TextStyle(color: color3)),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: color2,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Privacy Policy click
                                print('Privacy Policy clicked');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && valueCheck) {
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                      print(
                          'Confirm Password: ${_confirmPasswordController.text}');
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(builder: (context) => BottomNavBar()),
                      //   (route) => false,
                      // );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(
                        double.infinity, 50.0), // Set the button height
                  ),
                  child: const Text('Create Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.3,
                      color: Colors.black,
                      width: 100,
                    ),
                    const Text(
                      "  or  ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 1.3,
                      color: Colors.black,
                      width: 100,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    auth.HandleGoogleSignIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: color3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(
                        double.infinity, 50.0), // Set the button height
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/google.png"))),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Text('Sign Up with google',
                          style: TextStyle(
                              color: color2,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account?',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: ' Sign In',
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
                                    builder: (context) => const LoginPage()),
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
      ),
    );
  }
}
