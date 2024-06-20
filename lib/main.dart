import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'domain/environment/builders.dep_gen.dart';
import 'domain/environment/environment.dart';
import 'l10n/locale_provider.dart';
import 'presentation/theme/dynamic_theme.dart';

/// Параметры подключения Firebase
const FirebaseOptions _firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyAtQQ1JYca7U3oVHdBCmXcCIPyTua86YWw',
  appId: '1:450239422144:android:bed778b376cfaa0e309725',
  messagingSenderId: '450239422144',
  projectId: 'quectochat',
  storageBucket: 'quectochat.appspot.com',
);

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
void main() {
  unawaited(
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(options: _firebaseOptions);

        runApp(
          DepProvider(
            environment: (await Environment().prepare()).lock(),
            child: const DynamicTheme(
              child: LocaleProvider(
                child: Application(),
              ),
            ),
          ),
        );
      },
      (e, s) => debugPrint('>>> ERROR:\n$e\n>>> STACKTRACE:\n$s'),
    ),
  );
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quecto chat',
      theme: DynamicTheme.themeOf(context),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
