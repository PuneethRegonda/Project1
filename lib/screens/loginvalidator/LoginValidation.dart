class LoginValidation{
  String  emailValidation(String value){
    if(!value.contains('@')){
      return 'Please enter thr valid UserName';
    }
    return null;
  }
  String  passwordValidation(String value){
    if(value.length<5)
    {
      return 'Password is Too Short';
    }
    return null;
  }

}