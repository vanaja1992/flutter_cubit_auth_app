import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginpage/src/features/authentication/cubit/authentication_repository.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> login(String username, password) async {
      emit(AuthenticationLoading());
      bool status = await AuthenticationRepository().login(username, password);
       if(status){
         emit(AuthenticationSuccess());//dummy api call
       }
       else{
         emit(AuthenticationError());
       }
    }
  // Future<void> login(String username, password) async {
  //   emit(AuthenticationLoading());
  //    await Future.delayed(Duration (seconds: 30));
  //    if(username==' vanaja' && password == '12345'){
  //      emit(AuthenticationSuccess());//dummy api call
  //    }
  //    else{
  //      emit(AuthenticationError());
  //    }
  // }
}
