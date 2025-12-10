package com.example.test_sentry

import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.sentry.Sentry

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)

        val pp = Sentry.isEnabled()
        Log.i("Ouiiii", "Isenabled is: " + pp)
        val x = 10/0
    }
}
