final String TABLE_PLACE='tbl_place';
final String COL_PLACE_ID='place_id';
final String COL_PLACE_NAME='place_name';
final String COL_PLACE_LATITUDE='place_latitude';
final String COL_PLACE_LONGITUDE='place_longitude';
final String COL_PLACE_ADMIN_ID='place_admin_id';


class VisitModel {
   int? id;
   String? name;
   double? latitude;
   double? longitude;
   int? adminPlaceID;

  VisitModel(
      {this.id,
       this.name,
       this.latitude,
       this.longitude,
      this.adminPlaceID});

  VisitModel.fromMap(Map<String,dynamic>map){
    id=map[COL_PLACE_ID];
    name=map[COL_PLACE_NAME];
    latitude=map[COL_PLACE_LATITUDE];
    longitude=map[COL_PLACE_LONGITUDE];
    adminPlaceID=map[COL_PLACE_ADMIN_ID];
  }

  Map<String,dynamic> toMap(){
    var plcMap=<String,dynamic>{
      COL_PLACE_ID:id,
      COL_PLACE_NAME:name,
      COL_PLACE_LATITUDE:latitude,
      COL_PLACE_LONGITUDE:longitude,
      COL_PLACE_ADMIN_ID:adminPlaceID
    };
    if(id!=null){
      plcMap[COL_PLACE_ID]=id;
    }
    return plcMap;
  }

  @override
  String toString() {
    return 'VisitModel{id: $id , name: $name, latitude: $latitude, longitude: $longitude, adminID: $adminPlaceID}';
  }
}
