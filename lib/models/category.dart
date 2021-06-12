class Category {
    Category(
        this.id,
        this.title,
        this.coror,
    );

    int id;
    String title;
    String coror;

    Category.fromJson(Map<String, dynamic> json):
        id = json["category_id"],
        title = json["category_title"],
        coror = json["category_coror"];
    Map<String, dynamic> toJson() => {
        "category_id": id,
        "category_title": title,
        "category_coror": coror,
    };
}