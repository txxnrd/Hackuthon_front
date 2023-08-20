import UIKit
import Flutter
import GoogleMaps  // 추가

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyC-hgWuxYARlHHuZsvGVakzEx7AafJrxk0")  // 추가
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
