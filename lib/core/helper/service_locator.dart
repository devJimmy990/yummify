import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummify/core/firebase/firebase.dart' as firebase;
import 'package:yummify/core/firebase/firebase_options.dart';
import 'package:yummify/core/helper/shared_preference.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  await _registerFirebase();
  await _registerSharedPref();
  await _registerHydratedStorage();
}

Future<void> _registerHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
}

Future<void> _registerSharedPref() async {
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
  sl.registerLazySingleton<SharedPreference>(() => SharedPreference(sl()));
}

Future<void> _registerFirebase() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton<firebase.Firebase>(
    () => firebase.Firebase(
      auth: FirebaseAuth.instance,
      store: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
      messaging: FirebaseMessaging.instance,
    ),
  );
}
