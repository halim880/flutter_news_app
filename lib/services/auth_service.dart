

class AuthService{
  static bool login(Map data){
    if(data['email']=="a.halimics@gmail.com" && data['password']=="password") return true;
    return false;
  }
}