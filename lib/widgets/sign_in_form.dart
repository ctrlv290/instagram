import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/auth_input_decor.dart';
import 'package:instagram_clone/constants/common_size.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/widgets/or_divider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset('assets/images/insta_text_logo.png'),
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black45,
                decoration: textInputDecor('Email'),
                validator: (text) {
                  if (text.isNotEmpty && text.contains('@')) {
                    return null;
                  } else {
                    return "잘못 된 이메일 형식입니다.";
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                controller: _pwController,
                cursorColor: Colors.black45,
                decoration: textInputDecor('Password'),
                obscureText: true,
                validator: (text) {
                  if (text.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return "잘못 된 비밀번호를 형식입니다.";
                  }
                },
              ),
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgotten Password?',
                  ),
                ),
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _submitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage('assets/images/facebook.png'),
                ),
                label: Text('Login with Facebook'),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // if (_formKey.currentState.validate()) {
        print('Validation Success');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
        // }
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.blue, onPrimary: Colors.white, elevation: 0),
      child: Text("LogIn"),
    );
  }
}
