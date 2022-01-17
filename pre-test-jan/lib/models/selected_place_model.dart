final String TABLE_SELECTED_PLACE = 'tbl_selected';
final String COL_SELECTED_ID = 'select_id';
final String COL_VISITOR_SELECTED_ID = 'visitor_id';
final String COL_VISITOR_PLAN_ID = 'plan_id';

class SelectedPlaceModel {
  int? selectedID;
  int? visitorSelectedID;
  int? visitorPlanID;

  SelectedPlaceModel(
      {this.selectedID, this.visitorSelectedID, this.visitorPlanID});

  @override
  String toString() {
    return 'SelectedPlaceModel{selectedID: $selectedID, selectVisitorID: $visitorSelectedID, selectPlanID: $visitorPlanID}';
  }

  SelectedPlaceModel.fromMap(Map<String,dynamic>map){
    selectedID=map[COL_SELECTED_ID];
    visitorSelectedID=map[COL_VISITOR_SELECTED_ID];
    visitorPlanID=map[COL_VISITOR_PLAN_ID];
  }

  Map<String,dynamic>toMap(){
    var selectedMap=<String,dynamic>{
      COL_SELECTED_ID:selectedID,
      COL_VISITOR_SELECTED_ID:visitorSelectedID,
      COL_VISITOR_PLAN_ID:visitorPlanID
    };
    return selectedMap;
  }

}
