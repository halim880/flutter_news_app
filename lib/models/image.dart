class Image {
    Image(
        this.imageId,
        this.imageUrl,
        this.imageDescription,
        this.postId,
        this.isFeatured,
    );

    int imageId;
    String imageUrl;
    String imageDescription;
    int postId;
    int isFeatured;

    Image.fromJson(Map<String, dynamic> json):
        imageId = json["image_id"],
        imageUrl = json["image_url"],
        imageDescription = json["image_description"],
        postId = json["post_id"],
        isFeatured = json["is_featured"];

    Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "image_url": imageUrl,
        "image_description": imageDescription,
        "post_id": postId,
        "is_featured": isFeatured,
    };
}
