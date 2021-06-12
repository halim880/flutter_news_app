

class Tag {
    Tag(
        this.tagId,
        this.tagName,
    );

    int tagId;
    String tagName;

    Tag.fromJson(Map<String, dynamic> json):
        tagId = json["tag_id"],
        tagName = json["tag_name"];

    Map<String, dynamic> toJson() => {
        "tag_id": tagId,
        "tag_name": tagName,
    };
}