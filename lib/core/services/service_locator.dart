import 'package:a11_website/core/services/authentication/authentication_service.dart';
import 'package:a11_website/core/services/authentication/authentication_service_implementation.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service.dart';
import 'package:a11_website/core/services/cloud_firestore/cloud_firestore_service_implementation.dart';
import 'package:a11_website/core/view_models/photos_demo_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator
      .registerLazySingleton<FirestoreService>(() => FirestoreServiceImpl());
  serviceLocator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl());
  // serviceLocator.registerLazySingleton<>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());

  // You can replace the actual services above with fake implementations during development.
  //
  // serviceLocator.registerLazySingleton<WebApi>(() => FakeWebApi());
  // serviceLocator.registerLazySingleton<StorageService>(() => FakeStorageService());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceFake());

  // view models
  serviceLocator.registerFactory<PhotosViewModel>(() => PhotosViewModel());
  // serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
}
