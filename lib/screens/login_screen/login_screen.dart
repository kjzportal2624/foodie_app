import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodie_app/blocs/login_bloc/login_bloc.dart';
import 'package:foodie_app/constants/style.dart';
import 'package:foodie_app/services/utils.dart';
import 'package:foodie_app/shared_widgets/custom_input_field.dart';
import 'package:foodie_app/shared_widgets/custom_button.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie_app/screens/home_screen/home_screen.dart';
import 'package:foodie_app/screens/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Utils utils = Utils();

  void loginOnPressed() {
    /// Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginAccount(email: emailController.text, password: passwordController.text));
    }
  }

  @override
  void dispose() {
    /// Clean up the controller when the widget is removed from the
    /// widget tree.
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Foodie App')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) async {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ProgressDialog pd = ProgressDialog(
            context,
            blur: 5.0,
            dismissable: false,
            dialogTransitionType: DialogTransitionType.Shrink,
            transitionDuration: Duration(milliseconds: 100),
            message: Text(
              "Logging in",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: null,
          );

          if (state is LoginError) {
            /// Close the dialog
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }

          if (state is LoginLoading) {
            pd.show();
          }

          if (state is LoginSuccess) {
            pd.dismiss();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        CustomInputField(
                          textController: emailController,
                          labelText: 'Email address',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email address is required.';
                            }

                            if (!utils.emailRegex.hasMatch(value)) {
                              return 'Invalid email address format.';
                            }

                            return null;
                          },
                        ),
                        CustomInputField(
                          textController: passwordController,
                          labelText: 'Password',
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required.';
                            }

                            return null;
                          },
                        ),
                        CustomButton(onPressed: loginOnPressed, title: 'Login'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: kTextRegular.copyWith(color: kColorGrey),
                      children: [
                        TextSpan(text: 'Don\'t have an account? '),
                        TextSpan(
                          text: 'Register',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegistrationScreen(),
                                ),
                              );
                            },
                          style: kTextRegular.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kColorPrimary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
