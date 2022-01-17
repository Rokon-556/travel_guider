import 'package:flutter/material.dart';
//import 'package:travel_guider/helper/db_helper.dart';
import 'package:travel_guider/models/visit_plan_model.dart';
//import 'package:travel_guider/pages/add_place.dart';
import 'package:travel_guider/pages/google_map.dart';
//import 'package:travel_guider/pages/visit_list.dart';

class VisitItem extends StatefulWidget {
  final VisitPlanModel visitModel;

  VisitItem(this.visitModel);

  @override
  _VisitItemState createState() => _VisitItemState();
}

class _VisitItemState extends State<VisitItem> {
  // void _deletePlace() async {
  //   await DBHelper.deletePlace(widget.visitModel.id!);
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(children: <Widget>[
                Text(widget.visitModel.startPlaceName.toString()),
                const Text(' to '),
                Text(widget.visitModel.endPlaceName.toString())
              ],),
              flex: 5,
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.navigation,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyGoogleMap(
                        name: widget.visitModel.startPlaceName.toString(),
                        latitude: widget.visitModel.startLatitude,
                        longitude: widget.visitModel.startLongitude,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: PopupMenuButton(
            //     icon: Icon(Icons.more_vert),
            //     itemBuilder: (context) => [
            //       PopupMenuItem(
            //         child: Text('Edit'),
            //         value: 0,
            //       ),
            //       PopupMenuItem(
            //         child: Text('Delete'),
            //         value: 1,
            //       ),
            //     ],
            //     onSelected: (value) {
            //       if (value == 0) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => Places(
            //               placeID: widget.visitModel.id,
            //             ),
            //           ),
            //         );
            //       } else if (value == 1) {
            //         showDialog(
            //           context: context,
            //           builder: (context) => AlertDialog(
            //             title: Text('Delete'),
            //             content: Text('Are you sure to delete this item?'),
            //             actions: <Widget>[
            //               TextButton(
            //                 child: Text('CANCEL'),
            //                 onPressed: () => Navigator.of(context).pop(false),
            //               ),
            //               ElevatedButton(
            //                 child: Text('DELETE'),
            //                 onPressed: () {
            //                   _deletePlace();
            //                   Navigator.pushAndRemoveUntil(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) => VisitList(),
            //                       ),
            //                       (Route<dynamic> route) => false);
            //                 },
            //               )
            //             ],
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
// title: Text(widget.visitModel.name.toString()),
// trailing: IconButton(
// icon: const Icon(
// Icons.navigation,
// color: Colors.blueGrey,
// ),
// onPressed: () {},
// ),
// IconButton(icon: Icon(Icons.menu),onPressed: (){},)
