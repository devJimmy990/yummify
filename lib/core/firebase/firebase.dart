import 'package:cloud_firestore/cloud_firestore.dart' as f_store;
import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:firebase_messaging/firebase_messaging.dart' as f_messaging;
import 'package:firebase_storage/firebase_storage.dart' as f_storage;

class Firebase {
  Firebase({
    required this.auth,
    required this.store,
    required this.storage,
    required this.messaging,
  });

  final f_auth.FirebaseAuth auth;
  final f_store.FirebaseFirestore store;
  final f_storage.FirebaseStorage storage;
  final f_messaging.FirebaseMessaging messaging;
}
