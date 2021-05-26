import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_app/screens/home_screen/home_screen.dart';
import 'package:foodie_app/services/utils.dart';
import 'package:foodie_app/shared_widgets/custom_button.dart';
import 'package:foodie_app/shared_widgets/custom_input_field.dart';
// import 'package:ipark_user/blocs/registration_bloc/registration_bloc.dart';
// import 'package:ipark_user/screens/global_widgets/custom_button.dart';
// import 'package:ipark_user/screens/global_widgets/custom_input_field.dart';
// import 'package:ipark_user/screens/home_screen/home_screen.dart';
// import 'package:ipark_user/services/toast_services.dart';
import 'package:ndialog/ndialog.dart';
import 'package:foodie_app/blocs/registration_bloc/registration_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Utils utils = Utils();

  void registerOnPressed() {
    Map<String, dynamic> formData = {
      'name': nameController.text,
      'email': emailController.text,
      'course': courseController.text,
      'school': schoolController.text,
      'password': passwordController.text,
    };

    /// Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      context.read<RegistrationBloc>().add(RegisterAccount(registrationForm: formData));
    }
  }

  @override
  void dispose() {
    /// Clean up the controller when the widget is removed from the
    /// widget tree.
    emailController.dispose();
    emailController.dispose();
    courseController.dispose();
    schoolController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Registration')),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) async {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ProgressDialog pd = ProgressDialog(
            context,
            blur: 5.0,
            dismissable: false,
            dialogTransitionType: DialogTransitionType.Shrink,
            transitionDuration: Duration(milliseconds: 100),
            message: Text(
              "Creating account",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            title: null,
          );

          if (state is RegistrationError) {
            /* Close the dialog */
            Navigator.pop(context);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }

          if (state is RegistrationLoading) {
            pd.show();
          }

          if (state is RegistrationSuccess) {
            pd.dismiss();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Column(
                children: [
                  CustomInputField(
                    textController: nameController,
                    labelText: 'Full name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address is required.';
                      }

                      return null;
                    },
                  ),
                  CustomInputField(
                    textController: courseController,
                    labelText: 'Course name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Course is required.';
                      }

                      return null;
                    },
                  ),
                  CustomInputField(
                    textController: schoolController,
                    labelText: 'School name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'School is required.';
                      }

                      return null;
                    },
                  ),
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
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required.';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 25.0),
                  CustomButton(onPressed: registerOnPressed, title: 'Register'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
