import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _comfirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _comfirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  Future signUp() async {
    if (passwordComfirm() && formKey.currentState!.validate()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
    addUserDetial(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()));
  }

  Future addUserDetial(
      String firstName, String lastName, String email, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age ': age
    });
  }

  bool passwordComfirm() {
    if (_passwordController.text.trim() ==
        _comfirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ListView(children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              'HELLO THERE!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Create Your Account Here!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: formField(),
          ),
        ]),
      ),
    );
  }

  Form formField() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This field is Required!';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Enter your First Name",
              labelText: 'First Name',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _lastNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return "!";
            //   } else {
            //     return null;
            //   }
            // },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Enter your Last Name",
              labelText: 'Last Name',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _ageController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is Required!";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Enter your Age",
              labelText: 'Age',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              const pattern =
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?)*$";
              final regexp = RegExp(pattern);
              if (value == null || value.isEmpty || !regexp.hasMatch(value)) {
                return 'Enter a valid email address';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Enter your email ID",
              labelText: 'Email ID',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length < 6) {
                return "Password must be 6 characters long!";
              } else {
                return null;
              }
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Enter your Password",
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _comfirmPasswordController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.length < 6) {
                return "Password should match";
              } else {
                return null;
              }
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              errorStyle: TextStyle(color: Colors.amber),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              hintText: "Confirm your password",
              labelText: 'Confirm Password',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: signUp,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
              // shape: MaterialStateProperty.all(
              //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              // ),
            ),
            child: const SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: widget.showLoginPage,
                child: const Text(
                  ' Login here',
                  style: TextStyle(
                      color: Colors.amberAccent, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
