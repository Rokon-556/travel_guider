import 'dart:typed_data';

final String TABLE_GEOLOCATION = 'tbl_geo';
final String COL_POSITION_ID = 'pos_id';
final String COL_IMAGE_ID = 'img_id';
final String COL_VIDEO_ID = 'vdo_id';
final String COL_POSITION_LAT = 'pos_lat';
final String COL_POSITION_LONG = 'pos_long';
final String COL_PLC_VISITOR_ID = 'visitor_id';

class GeolocationModel {
  int? placeID;
  Uint8List? plcImgID;
  Uint8List? plcVdoID;
  double? plcLat;
  double? plcLong;
  int? plcVisitorID;

  GeolocationModel(
      {this.placeID,
      this.plcImgID,
      this.plcVdoID,
      this.plcLat,
      this.plcLong,
      this.plcVisitorID});

  @override
  String toString() {
    return 'GeolocationModel{placeID: $placeID, plcImgID: $plcImgID,'
        'plcVdoId:$plcVdoID ,'
        'latitude: $plcLat, longitude: $plcLong,visitorID:$plcVisitorID}';
  }

  GeolocationModel.fromMap(Map<String, dynamic> map) {
    placeID = map[COL_POSITION_ID];
    plcImgID = map[COL_IMAGE_ID];
    plcVdoID = map[COL_VIDEO_ID];
    plcLat = map[COL_POSITION_ID];
    plcLong = map[COL_POSITION_ID];
    plcVisitorID = map[COL_PLC_VISITOR_ID];
  }
  Map<String, dynamic> toMap() {
    var geoMap = <String, dynamic>{
      COL_POSITION_ID: placeID,
      COL_IMAGE_ID: plcImgID,
      COL_VIDEO_ID: plcVdoID,
      COL_POSITION_LAT: plcLat,
      COL_POSITION_LONG: plcLong,
      COL_PLC_VISITOR_ID: plcVisitorID,
    };
    return geoMap;
  }
}
