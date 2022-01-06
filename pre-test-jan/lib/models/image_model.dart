import 'dart:typed_data';

final String TABLE_IMAGE='tbl_img';
final String COL_IMAGE_ID='img_id';
final String COL_IMAGE_TITLE='img_id';
final String COL_IMAGE_PICTURE='img_id';


class PictureModel{
   int? id;
   String? title;
   Uint8List? picture;
   //Picture? picture;

  PictureModel({this.id, this.title, this.picture});

  PictureModel.fromMap(Map map, tList, pList,) {
  id = map[id];
  title = map[title];
  picture = map[picture];
  }

  Map<String, dynamic> toMap()  {
    var imgMap=<String,dynamic>{
      "id": id,
      "title": title,
      "picture" : picture,
    };
    return imgMap;
  }
}