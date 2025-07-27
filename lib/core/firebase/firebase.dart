import 'package:cloud_firestore/cloud_firestore.dart' as f_store;
import 'package:firebase_auth/firebase_auth.dart' as f_auth;

class Firebase {
  Firebase({required this.auth, required this.store});

  final f_auth.FirebaseAuth auth;
  final f_store.FirebaseFirestore store;
}
