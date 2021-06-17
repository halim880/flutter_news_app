

class ValidationMixin{
  String validateEmail(value){
    if(!value.contains('@')){
        return "Enter a valid Email";
    }
    return '';
  }
  String validatePassword(value){
    if(value.length<4){
        return "Password must be atleast 4 character";
    }
    return '';
  }
}