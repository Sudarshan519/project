

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanicfinder/controller/authController.dart';
import 'package:mechanicfinder/model/request.dart';
class RequestServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('requests');
  addRequest(Request request) async {
    var ref = firestore.collection("requests").doc();
 
    print('sending request');
    await ref.set(request.toJson());
    print('request sent');
  }

  updateRequest(Request request) async {
  
    await firestore
        .collection("Request")
        .doc(request.userid)
        .update(request.toJson());
  }

  delRequest(request) async {
    var ref = firestore.collection("Request").doc(request.id);

    await ref.delete();
  }

  Future<List<Request>> getRequests() async {
    var data = await firestore.collection('Request').where('userid',isEqualTo:authController.user.uid).get();
    return data.docs.map<Request>((da) => Request.fromJson(da.data())).toList();
  }
}

final RequestServices requestService = RequestServices();