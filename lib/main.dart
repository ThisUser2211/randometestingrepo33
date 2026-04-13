import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Ableton Live-inspired DAW dark theme
    const Color dawBackground   = Color(0xFF1A1A1A); // near-black canvas
    const Color dawSurface      = Color(0xFF2B2B2B); // dark charcoal panels
    const Color dawSurfaceVar   = Color(0xFF333333); // track row separators
    const Color dawAccent       = Color(0xFFFF6600); // orange (MIDI track 1)
    const Color dawOnBackground = Color(0xFFD4D4D4); // light grey text
    const Color dawOnSurface    = Color(0xFFAAAAAA); // muted label text

    return MaterialApp(
      title: 'DAW App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: dawBackground,
        primaryColor: dawAccent,
        colorScheme: ColorScheme.dark(
          primary:         dawAccent,              // orange accent
          secondary:       const Color(0xFFCCFF00), // yellow-green (track 2)
          tertiary:        const Color(0xFF00FFCC), // teal (track 3)
          surface:         dawSurface,
          surfaceContainerHighest: dawSurfaceVar,
          onPrimary:       Colors.black,
          onSecondary:     Colors.black,
          onSurface:       dawOnBackground,
          onSurfaceVariant: dawOnSurface,
          outline:         const Color(0xFF444444), // 1-px border lines
          error:           const Color(0xFFFF4444),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF222222),
          foregroundColor: Color(0xFFD4D4D4),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFFD4D4D4),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: dawAccent,
          foregroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xFFD4D4D4),
            fontSize: 32,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.0,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 13,
          ),
        ),
        dividerColor: const Color(0xFF3A3A3A),
        cardColor: dawSurface,
      ),
      home: const MyHomePage(title: 'DAW App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10102;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter -= 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final theme = Theme.of(context);

    // DAW-style track accent colors matching the Ableton Live palette
    const trackColors = [
      Color(0xFFFF6600), // orange  – MIDI 1
      Color(0xFFCCFF00), // yellow-green – MIDI 2
      Color(0xFF00FFCC), // teal   – Audio 3
      Color(0xFF00FF66), // green  – Audio 4
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Track grid header
          Container(
            height: 1,
            color: const Color(0xFF444444),
          ),
          Expanded(
            child: Row(
              children: [
                // Main canvas area (dark grid)
                Expanded(
                  child: Container(
                    color: const Color(0xFF1E1E1E),
                    child: GridPaper(
                      color: const Color(0xFF2A2A2A),
                      divisions: 1,
                      subdivisions: 1,
                      interval: 48.0,
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
                // Track list panel (right side)
                Container(
                  width: 180,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2B2B2B),
                    border: Border(
                      left: BorderSide(color: Color(0xFF444444), width: 1),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: trackColors.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFF3A3A3A),
                    ),
                    itemBuilder: (context, i) {
                      final color = trackColors[i];
                      final isAudio = i >= 2;
                      return Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6,
                        ),
                        child: Row(
                          children: [
                            // Color swatch strip
                            Container(
                              width: 6,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${i + 1} ${isAudio ? 'Audio' : 'MIDI'}',
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    isAudio ? 'Ext. In' : 'All Ins',
                                    style: const TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    isAudio ? 'Main' : 'All Channels',
                                    style: const TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Status bar
          Container(
            height: 1,
            color: const Color(0xFF444444),
          ),
          Container(
            height: 32,
            color: const Color(0xFF222222),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  'Counter: $_counter',
                  style: theme.textTheme.bodyMedium,
                ),
                const Spacer(),
                Text(
                  '48.0 kHz  •  DAW',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
