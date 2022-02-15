package io.flutter.plugins.firebasemessagingexample;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class Application extends FlutterApplication implements PluginRegistrantCallback {
  @Override
  public void onCreate() {
    super.onCreate();
  }

  @Override
  public void registerWith(PluginRegistry registry) {
    // FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
    // FlutterLocalNotificationsPlugin.registerWith(registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"));
  }
}