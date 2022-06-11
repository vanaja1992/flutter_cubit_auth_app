import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/form_validation_utility.dart';
import '../../user_dashboard/pages/homepage.dart';
import '../cubit/authentication_cubit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body:
          // BlocBuilder<AuthenticationCubit, AuthenticationState>(
          //   builder: (context, state) {
          //     if (state is AuthenticationLoading) {
          //       return CircularProgressIndicator();
          //     }
          //     else {
          //       return
          BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if(state is AuthenticationLoading){
            EasyLoading.show(status: 'loading...');

          }
          else if (state is AuthenticationSuccess) {
            EasyLoading.dismiss();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
          else if( state is AuthenticationError){
            EasyLoading.dismiss();
            Fluttertoast.showToast(
                msg: "Invalid USername or Password",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
          // TODO: implement listener
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (val) {
                                  return FormValidationUtility.validateEmail(
                                      val ?? "");
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (val) {
                                  return FormValidationUtility.validatePassword(
                                      val ?? "");
                                },
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.password),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              BlocBuilder<AuthenticationCubit,
                                  AuthenticationState>(
                                builder: (context, state) {
                                  if (state is AuthenticationLoading) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return ElevatedButton(
                                        onPressed: () {
                                          if (!(_formKey.currentState
                                                  ?.validate() ??
                                              false)) {
                                            return;
                                          }
                                          context
                                              .read<AuthenticationCubit>()
                                              .login(_emailController.text,
                                                  _passwordController.text);
                                          },
                                        child: const Text("Submit"));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
