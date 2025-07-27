import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummify/core/firebase/firebase.dart' as firebase;
import 'package:yummify/core/firebase/firebase_options.dart';
import 'package:yummify/core/helper/shared_preference.dart';
import 'package:yummify/features/auth/cubit/auth_cubit.dart';
import 'package:yummify/features/auth/data/data_source/base_auth_data_source.dart';
import 'package:yummify/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:yummify/features/auth/data/repositories/auth_repository.dart';
import 'package:yummify/features/cart/cubit/cart_cubit.dart';
import 'package:yummify/features/connection/model/connection.dart';
import 'package:yummify/features/order/cubit/order_cubit.dart';
import 'package:yummify/features/order/data/data_sources/base_order_data_source.dart';
import 'package:yummify/features/order/data/data_sources/remote_order_data_source.dart';
import 'package:yummify/features/order/data/repositories/order_repository.dart';
import 'package:yummify/features/settings/cubit/settings_cubit.dart';
import 'package:yummify/features/shopping/cubit/category/category_cubit.dart';
import 'package:yummify/features/shopping/cubit/meal/meal_cubit.dart';
import 'package:yummify/features/shopping/data/data_sources/category/base_category_data_source.dart';
import 'package:yummify/features/shopping/data/data_sources/category/remote_category_data_source.dart';
import 'package:yummify/features/shopping/data/data_sources/meal/base_meal_data_source.dart';
import 'package:yummify/features/shopping/data/data_sources/meal/remote_meal_data_source.dart';
import 'package:yummify/features/shopping/data/repositories/category_repository.dart';
import 'package:yummify/features/shopping/data/repositories/meal_repository.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  await _registerFirebase();
  await _registerSharedPref();
  await _registerHydratedStorage();

  // ----------- Registering dependencies ----------
  _registerCartCubit();
  _registerSettingsCubit();
  _registerAuthRepository();
  _registerMealRepository();
  _registerOrderRepository();
  _registerConnectionCubit();
  _registerCategoryRepository();
}

void _registerConnectionCubit() {
  sl.registerLazySingleton<ConnectionService>(() => ConnectionService.instance);
}

void _registerSettingsCubit() {
  sl.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}

void _registerOrderRepository() {
  sl.registerLazySingleton<BaseOrderDataSource>(
    () => RemoteOrderDataSource(sl()),
  );
  sl.registerLazySingleton<OrderRepository>(() => OrderRepository(sl()));

  sl.registerLazySingleton<OrderCubit>(() => OrderCubit(sl<OrderRepository>()));
}

void _registerCartCubit() {
  sl.registerLazySingleton<CartCubit>(() => CartCubit());
}

void _registerCategoryRepository() {
  sl.registerLazySingleton<BaseCategoryDataSource>(
    () => RemoteCategoryDataSource(sl()),
  );
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepository(sl()));

  sl.registerLazySingleton<CategoryCubit>(
    () => CategoryCubit(sl<CategoryRepository>()),
  );
}

void _registerMealRepository() {
  sl.registerLazySingleton<BaseMealDataSource>(
    () => RemoteMealDataSource(sl()),
  );
  sl.registerLazySingleton<MealRepository>(() => MealRepository(sl()));

  sl.registerLazySingleton<MealCubit>(() => MealCubit(sl<MealRepository>()));
}

void _registerAuthRepository() {
  sl.registerLazySingleton<BaseAuthDataSource>(
    () => RemoteAuthDataSource(sl()),
  );
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));

  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl<AuthRepository>()));
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sl.registerLazySingleton<firebase.Firebase>(
    () => firebase.Firebase(
      auth: FirebaseAuth.instance,
      store: FirebaseFirestore.instance,
    ),
  );
}
