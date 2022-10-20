import 'package:flutter/material.dart';
import '';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(
          height: 150,
        ),
        const Center(
          child: Text(
            'HELLO AGAIN!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Welcome Back, you've been Missed!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: formField(),
        ),
      ]),
    );
  }

  Form formField() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => setState(() => username = (value)),
            validator: (value) {
              if (value!.length < 4) {
                return "Enter at least 4 charaters";
              } else {
                return null;
              }
            },
            // controller: _usernameController,
            decoration: const InputDecoration(
              bott
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              errorStyle: TextStyle(color: Colors.blueAccent),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              hintText: "Enter your Username",
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            onChanged: (value) => setState(() => password = (value)),
            validator: (value) {
              if (value!.length < 7) {
                return "Password must be greater than 7 characters";
              } else {
                return null;
              }
            },
            // controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              errorStyle: TextStyle(color: Colors.blueAccent),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              hintText: "Enter your Password",
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 200),
            child: Text(
              'Forget Password?',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final isValid = formKey.currentState!.validate();
              // Navigator.pushNamed(context, '/home');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            ),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Not a member?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                ' Register now',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
