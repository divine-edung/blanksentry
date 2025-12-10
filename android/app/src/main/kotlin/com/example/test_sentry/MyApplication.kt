package com.example.test_sentry

import io.sentry.android.core.SentryAndroid
import android.app.Application
import android.util.Log

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        SentryAndroid.init(this) { options ->
            options.dsn = "https://635575b4d98f5c8ae95fc3a0ded38742@o4510479955853312.ingest.us.sentry.io/4510479957688320"
            options.isDebug = true
            options.isEnableAutoSessionTracking = true
            options.tracesSampleRate = 1.0
            options.profilesSampleRate = 1.0
        }
        Log.i("Sentry", "Sentry Android SDK initialized")
    }
}