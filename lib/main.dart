import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init((options) {
    options.autoInitializeNativeSdk = false;
    options.dsn =
        'https://635575b4d98f5c8ae95fc3a0ded38742@o4510479955853312.ingest.us.sentry.io/4510479957688320';
    options.debug = true;
    options.sendDefaultPii = true;
    options.tracesSampleRate = 1.0;
    options.profilesSampleRate = 1.0;
  }, appRunner: () => runApp(SentryWidget(child: const MyApp())));

  // This sample exception should now be captured
  await Sentry.captureException(StateError('This is a sample exception.'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sample app"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            throw StateError('This is test exception');
          },
          child: const Text('Verify Sentry Setup'),
        ),
      ),
    );
  }
}
