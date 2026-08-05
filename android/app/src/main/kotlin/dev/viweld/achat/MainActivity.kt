package dev.viweld.achat

import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import android.service.notification.StatusBarNotification
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        createMessagesNotificationChannel()
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHAT_NOTIFICATIONS_CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "clearForInterlocutor" -> {
                    val interlocutorId = call.argument<String>("interlocutorId")
                    if (interlocutorId.isNullOrEmpty()) {
                        result.error("invalid_args", "interlocutorId is required", null)
                        return@setMethodCallHandler
                    }
                    clearNotificationsForInterlocutor(interlocutorId)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun clearNotificationsForInterlocutor(interlocutorId: String) {
        val manager = getSystemService(NotificationManager::class.java) ?: return
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            manager.cancel(interlocutorId, 0)
            return
        }

        val matching = manager.activeNotifications.filter { notification ->
            matchesInterlocutor(notification, interlocutorId)
        }
        for (notification in matching) {
            manager.cancel(notification.tag, notification.id)
        }
        // FCM tagged notifications are often posted as (tag, id=0).
        manager.cancel(interlocutorId, 0)
    }

    private fun matchesInterlocutor(
        statusBarNotification: StatusBarNotification,
        interlocutorId: String,
    ): Boolean {
        if (statusBarNotification.tag == interlocutorId) return true

        val extras = statusBarNotification.notification.extras
        val candidates = listOf(
            extras.getString("fromId"),
            extras.getCharSequence("fromId")?.toString(),
            extras.getString("gcm.notification.tag"),
            extras.getString("android.tag"),
        )
        return candidates.any { it == interlocutorId }
    }

    private fun createMessagesNotificationChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return

        val channel = NotificationChannel(
            CHANNEL_ID,
            CHANNEL_NAME,
            NotificationManager.IMPORTANCE_HIGH,
        ).apply {
            description = CHANNEL_DESCRIPTION
        }

        val manager = getSystemService(NotificationManager::class.java)
        manager?.createNotificationChannel(channel)
    }

    companion object {
        private const val CHANNEL_ID = "messages"
        private const val CHANNEL_NAME = "Messages"
        private const val CHANNEL_DESCRIPTION = "New chat messages"
        private const val CHAT_NOTIFICATIONS_CHANNEL =
            "dev.viweld.achat/chat_notifications"
    }
}
