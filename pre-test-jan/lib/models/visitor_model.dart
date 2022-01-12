final String TABLE_VISITOR = 'tbl_visitor';
final String COL_VISITOR_ID = 'visitor_id';
final String COL_VISITOR_USER_ID = 'visitor_user_id';
final String COL_VISITOR_PLACE_ID = 'visitor_place_id';
final String COL_VISITOR_GEO_ID = 'visitor_geo_id';

class VisitorModel {
  int? visitorID;
  int? visitorUserID;
  int? visitorPlaceID;
  int? geoID;

  VisitorModel(
      {this.visitorID, this.visitorUserID, this.visitorPlaceID, this.geoID});
  VisitorModel.fromMap(Map<String, dynamic> map) {
    visitorID = map[COL_VISITOR_ID];
    visitorUserID = map[COL_VISITOR_USER_ID];
    visitorPlaceID = map[COL_VISITOR_PLACE_ID];
    geoID = map[COL_VISITOR_GEO_ID];
  }

  Map<String,dynamic>toMap(){
    var visitorMap=<String,dynamic>{
      COL_VISITOR_ID:visitorID,
      COL_VISITOR_USER_ID:visitorUserID,
      COL_VISITOR_PLACE_ID:visitorPlaceID,
      COL_VISITOR_GEO_ID:geoID
    };
    return visitorMap;
  }
  @override
  String toString() {
    return 'VisitorModel{visitorID: $visitorID, visitorUserID: $visitorUserID, visitorPlaceID: $visitorPlaceID, geoID: $geoID}';
  }
}
