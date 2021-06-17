import 'package:news_app/models/post.dart';

class PostImage {
    PostImage(
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
    bool isFeatured;

    PostImage.fromJson(Map<String, dynamic> json):
        imageId = json["image_id"],
        imageUrl = json["image_url"],
        imageDescription = json["image_description"],
        postId = json["post_id"],
        isFeatured = json["is_featured"]==0?false:true;

    Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "image_url": imageUrl,
        "image_description": imageDescription,
        "post_id": postId,
        "is_featured": isFeatured,
    };

    static List<PostImage>  toImageList(List<Map<String, dynamic>> map){
      List<PostImage> imgs = [];

      for (var image in map) {
        PostImage img = PostImage.fromJson(image);
        imgs.add(img);
      }
      return imgs;
    }
}
