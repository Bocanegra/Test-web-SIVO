package sivo_web

class Machine {
  static belongsTo = User
  static hasMany = [users: User]
  String name;
  String so;
  String ip;

  static constraints = {
    name(maxSize: 100, blank:false, unique:true);
    so(maxSize: 100, blank:false);
    ip(maxSize: 100, blank:false);
  }
}


