import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_modular/flutter_modular.dart';

enum RemoteConfigEnum { linkTerms }

mixin RemoteConfig implements RemoteConfigAbstract {
  final RemoteConfigAbstract appRemoteConfig = Modular.get<RemoteConfigAbstract>();

  @override
  int getInt(RemoteConfigEnum key) => appRemoteConfig.getInt(key);
  @override
  bool getBool(RemoteConfigEnum key) => appRemoteConfig.getBool(key);
  @override
  double getDouble(RemoteConfigEnum key) => appRemoteConfig.getDouble(key);
  @override
  String getString(RemoteConfigEnum key) => appRemoteConfig.getString(key);
  @override
  Map<String, dynamic> getMap(RemoteConfigEnum key) => appRemoteConfig.getMap(key);
  @override
  dynamic getObject(RemoteConfigEnum key) => appRemoteConfig.getObject(key);
}

abstract class RemoteConfigAbstract {
  int getInt(RemoteConfigEnum key);
  bool getBool(RemoteConfigEnum key);
  double getDouble(RemoteConfigEnum key);
  String getString(RemoteConfigEnum key);
  Map<String, dynamic> getMap(RemoteConfigEnum key);
  dynamic getObject(RemoteConfigEnum key);
}

class AppRemoteConfig implements RemoteConfigAbstract {
  AppRemoteConfig._internal();
  static final AppRemoteConfig _singleton = AppRemoteConfig._internal();
  factory AppRemoteConfig() => _singleton;

  static const fetchTimeout = Duration(seconds: 60);
  static const minimumFetchInterval = Duration(hours: (kDebugMode ? 0 : 1));
  late FirebaseRemoteConfig _firebaseRemoteConfig;

  Future<void> initialize() async {
    try {
      if (Firebase.apps.isEmpty) {
        log('Firebase app not initialized');
        return;
      }

      _firebaseRemoteConfig = FirebaseRemoteConfig.instance;
      await _firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: fetchTimeout,
          minimumFetchInterval: minimumFetchInterval,
        ),
      );

      await _firebaseRemoteConfig.setDefaults({
        RemoteConfigEnum.linkTerms.name: '',
      });

      await _firebaseRemoteConfig.fetchAndActivate();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  int getInt(RemoteConfigEnum key) => _firebaseRemoteConfig.getInt(key.name);
  @override
  bool getBool(RemoteConfigEnum key) => _firebaseRemoteConfig.getBool(key.name);
  @override
  double getDouble(RemoteConfigEnum key) => _firebaseRemoteConfig.getDouble(key.name);
  @override
  String getString(RemoteConfigEnum key) => _firebaseRemoteConfig.getString(key.name);
  @override
  Map<String, dynamic> getMap(RemoteConfigEnum key) => jsonDecode(_firebaseRemoteConfig.getString(key.name));
  @override
  dynamic getObject(RemoteConfigEnum key) {
    return switch (key) {
      RemoteConfigEnum.linkTerms => getString(key),
    };
  }
}
