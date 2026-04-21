import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final themeData = ThemeData(
  colorScheme: .fromSeed(seedColor: Colors.deepPurple),
  textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
    bodySmall: GoogleFonts.aBeeZee(),
    bodyMedium: GoogleFonts.aBeeZee(),
    bodyLarge: GoogleFonts.aBeeZee(),
  )
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: 'RiverPod Demo',
      theme: themeData,
      home: const Dashboard(),
    );
  }
}

