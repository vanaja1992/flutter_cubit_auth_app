import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loginpage/src/features/authentication/cubit/authentication_cubit.dart';
import 'package:loginpage/src/features/authentication/pages/login_page.dart';
import 'package:loginpage/src/features/authentication/pages/login_page_new.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(
        primaryColor: Colors.blueAccent,

      ),
      home: BlocProvider(
        create:(_)=>AuthenticationCubit(),
          child: const LoginPageNew()),
      builder: EasyLoading.init(),
    );
  }
}
