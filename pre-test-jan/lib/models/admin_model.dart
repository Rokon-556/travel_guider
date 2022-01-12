
  final String TABLE_ADMIN='tbl_admin';
  final String COL_ADMIN_ID='admin_id';
  final String COL_USER_ADMIN_ID='admin_user_id';

  class AdminModel{
    int? adminID;
    int? userAdminID;

    AdminModel({this.adminID, this.userAdminID});

    AdminModel.fromMap(Map<String,dynamic>map){
      adminID=map[COL_ADMIN_ID];
      userAdminID=map[COL_USER_ADMIN_ID];
    }
    Map<String,dynamic>toMap(){
      var adminMap=<String,dynamic>{
        COL_ADMIN_ID:adminID,
        COL_USER_ADMIN_ID:userAdminID
      };
      return adminMap;
    }

    @override
  String toString() {
    return 'AdminModel{adminID: $adminID, userAdminID: $userAdminID}';
  }
}