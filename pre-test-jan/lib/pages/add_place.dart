import 'package:flutter/material.dart';
import 'package:travel_guider/helper/db_helper.dart';
import 'package:travel_guider/models/visit_plan_model.dart';
import 'package:travel_guider/pages/visit_list.dart';


class Places extends StatefulWidget {
  int? placeID;

  Places({Key? key, this.placeID}) : super(key: key);

  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  List<VisitPlanModel> visitList = [];
  final visit = VisitPlanModel();
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _startNameController,
      _startLatController,
      _startLongitudeController,
  _endLatController,_endLongitudeController,_endNameController;

  @override
  void initState() {
    _startNameController = TextEditingController();
    _startLatController = TextEditingController();
    _startLongitudeController = TextEditingController();
    _endLatController= TextEditingController();
    _endLongitudeController = TextEditingController();
    _endNameController = TextEditingController();

    if (widget.placeID != null) {
      DBHelper.getPlacesByID(widget.placeID!).then((model) {
        print(widget.placeID);
        _startNameController?.text = model!.startPlaceName.toString();
        _startLatController?.text = model!.startLatitude.toString();
        _startLongitudeController?.text = model!.startLongitude.toString();
        _endLatController?.text = model!.endLatitude.toString();
        _endLongitudeController?.text = model!.endLongitude.toString();
        _endNameController?.text = model!.endPlaceName.toString();
      });
    }
    super.initState();
  }

  void _savePlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Future<int> id = DBHelper.insertPlace(TABLE_PLACE, visit.toMap());
      id.then((id) {
        if (id > 0) {
          print('Saved');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => VisitList()),
              (Route<dynamic> route) => false);
        } else {
          print('Not Saved');
        }
      });
      print(visit);
    }
  }

  void _updatePlace() {
    if (_formKey.currentState!.validate()) {
      (_formKey.currentState!.save());
      visit.id = widget.placeID;
      DBHelper.updatePlace(visit).then((value) {
        if (value > 0) {
          print('Update');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => VisitList()),
              (Route<dynamic> route) => false);
        } else {
          print('Could not updated');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.placeID == null ? 'Add New Place' : 'Update Place'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _startNameController,
                decoration: InputDecoration(
                  hintText: 'Enter  Start Place Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Please Save a valid name';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.startPlaceName = value as String;
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _startLatController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter Start Latitude',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please Save a valid latitude';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.startLatitude = double.parse('$value');
                  print(visit.startLatitude);
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _startLongitudeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter Start Longitude',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please Save a valid longitude';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.startLongitude = double.parse('$value');
                },
              ),
              const SizedBox(
                height: 15.0,
              ),

              TextFormField(
                controller: _endLatController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter End Longitude',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please Save a valid longitude';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.endLatitude = double.parse('$value');
                },
              ),
              const SizedBox(
                height: 15.0,
              ),

              TextFormField(
                controller:_endLongitudeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter End Latitude',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please Save a valid longitude';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.endLongitude = double.parse('$value');
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                controller: _endNameController,
                decoration: InputDecoration(
                  hintText: 'Enter  End Place Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Please Save a valid name';
                  }
                  return null;
                },
                onSaved: (value) {
                  visit.endPlaceName = value as String;
                },
              ),

              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                onPressed: () {
                  if (widget.placeID == null) {
                    _savePlace();
                  } else {
                    _updatePlace();
                  }
                },
                child: Text(widget.placeID == null ? 'Save' : 'Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
