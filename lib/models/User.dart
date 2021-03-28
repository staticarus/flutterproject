/* 
========================
    NOT USED 
========================
*/


class User {
  String name;
  int id;
  
  User(String name, int id){
    this.name = name;
    this.id = id;
  }
}

List<User> users = List.generate(10, (index) => new User("Name " + index.toString(), index));


