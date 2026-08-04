import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    let channel = FlutterMethodChannel(
      name: "com.example.quectochat/chat_notifications",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setMethodCallHandler { call, result in
      guard call.method == "clearForInterlocutor" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard
        let args = call.arguments as? [String: Any],
        let interlocutorId = args["interlocutorId"] as? String,
        !interlocutorId.isEmpty
      else {
        result(
          FlutterError(
            code: "invalid_args",
            message: "interlocutorId is required",
            details: nil
          )
        )
        return
      }

      self.clearDeliveredNotifications(for: interlocutorId)
      result(nil)
    }
  }

  private func clearDeliveredNotifications(for interlocutorId: String) {
    let center = UNUserNotificationCenter.current()
    center.getDeliveredNotifications { notifications in
      let matchingIds = notifications.compactMap { notification -> String? in
        let content = notification.request.content
        let userInfo = content.userInfo
        let fromId =
          (userInfo["fromId"] as? String)
          ?? (userInfo["gcm.notification.fromId"] as? String)
        let threadId = content.threadIdentifier
        if fromId == interlocutorId || threadId == interlocutorId {
          return notification.request.identifier
        }
        return nil
      }
      guard !matchingIds.isEmpty else { return }
      center.removeDeliveredNotifications(withIdentifiers: matchingIds)
    }
  }
}
