
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/post_image.dart';

void main() {
  test('PostImage map can be converted to PostImage object', (){
    Map<String, dynamic> postImageMap = {
        "image_id": 29,
        "image_url": "https://via.placeholder.com/100x100.png/00bb33?text=illo",
        "image_description": "Maiores rerum et harum veniam.",
        "post_id": 3,
        "is_featured": 0
    };

    PostImage postImage = PostImage.fromJson(postImageMap);

    expect(postImage.imageId, 29);
    expect(postImage.imageUrl, 'https://via.placeholder.com/100x100.png/00bb33?text=illo');
    expect(postImage.isFeatured, false);
    expect(postImage.postId, 3);
    expect(postImage.imageDescription, 'Maiores rerum et harum veniam.');
  });

  test('PostImage list can be retrieved from map', (){
    List<Map<String, dynamic>> postImageMap = [
                {
                    "image_id": 1,
                    "image_url": "https://via.placeholder.com/100x100.png/009922?text=similique",
                    "image_description": "Autem expedita sunt velit officiis blanditiis.",
                    "post_id": 1,
                    "is_featured": 0
                },
                {
                    "image_id": 2,
                    "image_url": "https://via.placeholder.com/100x100.png/00ccee?text=fugiat",
                    "image_description": "Ut vel quae explicabo eius quas ex rerum.",
                    "post_id": 1,
                    "is_featured": 0
                },
                {
                    "image_id": 3,
                    "image_url": "https://via.placeholder.com/100x100.png/0099bb?text=repudiandae",
                    "image_description": "Ut quod dolores corrupti rerum qui occaecati qui.",
                    "post_id": 1,
                    "is_featured": 1
                }
            ];

    List<PostImage> postImage = PostImage.toImageList(postImageMap);

    expect(postImage[0].imageId, 1);
  });
}