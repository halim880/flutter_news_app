class Author {
    Author(
        this.authorId,
        this.firstName,
        this.lastName,
        this.avatar,
    );

    int authorId;
    String firstName;
    String lastName;
    String avatar;

    Author.fromJson(Map<String, dynamic> json):
        authorId= json["author_id"],
        firstName= json["first_name"],
        lastName= json["last_name"],
        avatar= json["avatar"];


  String fullName(){
    return firstName + " " + lastName;
  }
}