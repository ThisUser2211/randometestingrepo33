import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Folders',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          surface: const Color(0xFF1E1E1E),
          onSurface: const Color(0xFF7A7A7A),
        ),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF7A7A7A)),
        ),
      ),
      home: const FolderHomePage(),
    );
  }
}

class FolderHomePage extends StatelessWidget {
  const FolderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with only the folder icon in the top right
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.create_new_folder_outlined,
              color: Color(0xFF7A7A7A),
              size: 26,
            ),
            tooltip: 'Add folder',
            onPressed: () {
              // TODO: implement folder creation
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Empty state centered on screen
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.folder_off_outlined, size: 48, color: Color(0xFF4A4A4A)),
            SizedBox(height: 16),
            Text(
              'No folders',
              style: TextStyle(
                color: Color(0xFF5A5A5A),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Tap the folder icon in the top right to add one',
              style: TextStyle(
                color: Color(0xFF404040),
                fontSize: 13,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
