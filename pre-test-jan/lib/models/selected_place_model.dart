final String TABLE_SELECTED_PLACE = 'tbl_selected';
final String COL_SELECTED_ID = 'select_id';
final String COL_VISITOR_SELECTED_ID = 'visitor_id';
final String COL_PLAN_SELECTED_ID = 'plan_id';

class SelectedPlaceModel {
  int? selectedID;
  int? selectVisitorID;
  int? selectPlanID;

  SelectedPlaceModel(
      {this.selectedID, this.selectVisitorID, this.selectPlanID});

  @override
  String toString() {
    return 'SelectedPlaceModel{selectedID: $selectedID, selectVisitorID: $selectVisitorID, selectPlanID: $selectPlanID}';
  }

  SelectedPlaceModel.fromMap(Map<String,dynamic>map){
    selectedID=map[COL_SELECTED_ID];
    selectVisitorID=map[COL_VISITOR_SELECTED_ID];
    selectPlanID=map[COL_PLAN_SELECTED_ID];
  }

  Map<String,dynamic>toMap(){
    var selectedMap=<String,dynamic>{
      COL_SELECTED_ID:selectedID,
      COL_VISITOR_SELECTED_ID:selectVisitorID,
      COL_PLAN_SELECTED_ID:selectPlanID
    };
    return selectedMap;
  }

}
