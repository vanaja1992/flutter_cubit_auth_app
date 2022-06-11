class FormValidationUtility {
  static RegExp rex =
  RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  static String? validateEmail(String email) {
    email = email.trim();
    if (email.isEmpty) {
      return "Please enter  a emailid";
    } else if (email.length < 8) {
      return "Please enter a valid email";
    } else if (!emailRegex.hasMatch(email)) {
      return " Please enter a valid email address";
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    password = password.trim();
    if (password.isEmpty) {
      return "Please enter a password";
    }
    else if(password.length< 5){
      return "Please enter a valid password";
    }
    else{
      return null;
    }
  }


}
