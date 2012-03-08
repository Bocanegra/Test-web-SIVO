package sivo_web

class Administrator {
  
  String name;
  String password;

  static constraints = {
    name(maxSize: 100, blank:false, unique:true);
    password(maxSize: 100, blank:false);
  }
}
