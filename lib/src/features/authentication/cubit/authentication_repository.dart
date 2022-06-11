class AuthenticationRepository{

  Future<bool> login(String username, String password) async {
    await Future.delayed(Duration (seconds: 30));
    if(username == 'vanaja@gmail.com' && password == '123456'){
     return true;//dummy api call
    }
    else{
     return false;
    }
  }
}