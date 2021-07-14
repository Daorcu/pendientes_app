import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pendientes_app/models/pendiente.dart';

class FirebaseApi {
  static Future<String> createPendiente(Pendiente pendiente) async {
    final docPendiente =
        FirebaseFirestore.instance.collection('pendientes').doc();

    pendiente.id = docPendiente.id;
    await docPendiente.set(pendiente.toJson());

    return docPendiente.id;
  }
}
