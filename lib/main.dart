import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:st_learning/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}
