package sivo_web

class User {
  static def hasMany = [machines: Machine]
  String name;
  String password;
  
  static constraints = {
    name(maxSize: 100, blank:false, unique:true);
    password(maxSize: 100, blank:false);
  }
}
