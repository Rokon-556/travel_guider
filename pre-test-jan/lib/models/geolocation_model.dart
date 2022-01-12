
import 'dart:typed_data';

final String TABLE_GEOLOCATION='tbl_geo';
final String COL_POSITION_ID='pos_id';
final String COL_IMAGE_ID='img_id';
final String COL_POSITION_LAT='pos_lat';
final String COL_POSITION_LONG='pos_long';


class GeolocationModel{
  int? placeID;
  Uint8List? plcImgID;
  double? plcLat;
  double? plcLong;

  GeolocationModel({this.placeID, this.plcImgID, this.plcLat, this.plcLong});

  @override
  String toString() {
    return 'GeolocationModel{placeID: $placeID, plcImgID: $plcImgID, latitude: $plcLat, longitude: $plcLong}';
  }

  GeolocationModel.fromMap(Map<String,dynamic>map){
    placeID=map[COL_POSITION_ID];
    plcImgID=map[COL_IMAGE_ID];
    plcLat=map[COL_POSITION_ID];
    plcLong=map[COL_POSITION_ID];
  }
  Map<String,dynamic>toMap(){
    var geoMap=<String,dynamic>{
      COL_POSITION_ID:placeID,
      COL_IMAGE_ID:plcImgID,
      COL_POSITION_LAT:plcLat,
      COL_POSITION_LONG:plcLong
    };
    return geoMap;
  }
}
