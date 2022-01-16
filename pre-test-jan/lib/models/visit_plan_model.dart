final String TABLE_PLACE='tbl_place';
final String COL_PLACE_ID='place_id';
final String COL_START_PLACE_NAME='start_place_name';
final String COL_START_PLACE_LATITUDE='start_place_latitude';
final String COL_START_PLACE_LONGITUDE='start_place_longitude';
final String COL_DEST_PLACE_LATITUDE='start_place_longitude';
final String COL_DEST_PLACE_LONGITUDE='start_place_longitude';
final String COL_END_PLACE_NAME='end_place_name';

//final String COL_PLACE_ADMIN_ID='place_admin_id';


class VisitPlanModel {
   int? id;
   String? startPlaceName;
   double? startLatitude;
   double? startLongitude;
   double? endLatitude;
   double? endLongitude;
   String? endPlaceName;

   VisitPlanModel(
   {this.id,
     this.startPlaceName,
     this.startLatitude,
     this.startLongitude,
     this.endLatitude,
     this.endLongitude,
     this.endPlaceName}); //int? adminPlaceID;


  VisitPlanModel.fromMap(Map<String,dynamic>map){
    id=map[COL_PLACE_ID];
    startPlaceName=map[COL_START_PLACE_NAME];
    startLatitude=map[COL_START_PLACE_LATITUDE];
    startLongitude=map[COL_START_PLACE_LONGITUDE];
    endLatitude=map[COL_DEST_PLACE_LATITUDE];
    endLongitude=map[COL_DEST_PLACE_LONGITUDE];
    endPlaceName=map[COL_START_PLACE_NAME];

  }

  Map<String,dynamic> toMap(){
    var plcMap=<String,dynamic>{
      COL_PLACE_ID:id,
      COL_START_PLACE_NAME:startPlaceName,
      COL_START_PLACE_LATITUDE:startLatitude,
      COL_START_PLACE_LONGITUDE:startLongitude,
      COL_DEST_PLACE_LATITUDE:endLatitude,
      COL_DEST_PLACE_LONGITUDE:endLongitude,
      COL_END_PLACE_NAME:endPlaceName
    };
    if(id!=null){
      plcMap[COL_PLACE_ID]=id;
    }
    return plcMap;
  }

   @override
  String toString() {
    return 'VisitModel{id: $id, startPlaceName: $startPlaceName, startLatitude: $startLatitude, startLongitude: $startLongitude, endLatitude: $endLatitude, endLongitude: $endLongitude, endPlaceName: $endPlaceName}';
  }
}
