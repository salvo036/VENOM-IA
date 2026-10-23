import 'package:flutter/material.dart';

void main() {
  runApp(const VenomApp());
}

class VenomApp extends StatelessWidget {
  const VenomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const VenomHomeScreen(),
    );
  }
}

class VenomHomeScreen extends StatefulWidget {
  const VenomHomeScreen({super.key});

  @override
  State<VenomHomeScreen> createState() => _VenomHomeScreenState();
}

class _VenomHomeScreenState extends State<VenomHomeScreen> {
  bool venomAiEnabled = true;
  bool microfonoEnabled = true;
  bool fotocameraEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090C),
      body: Stack(
        children: [
          // Sfondo Simbiotico
          Positioned.fill(
            child: Image.asset(
              'venom_bg.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Top bar con padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16161A).withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.videocam, size: 15, color: Colors.white70),
                            SizedBox(width: 6),
                            Text('Ray-Ban Meta', style: TextStyle(fontSize: 11, color: Colors.white70)),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.bluetooth, size: 18, color: Colors.white70),
                          SizedBox(width: 16),
                          Icon(Icons.settings, size: 18, color: Colors.white70),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),

                // Volto Venom
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'venom_head.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Spaziatore per abbassare l'onda
                const SizedBox(height: 30),

                // Onda Audio fortemente allargata e posizionata nello spazio centrale
                SizedBox(
                  height: 145,
                  width: double.infinity,
                  child: Transform.scale(
                    scaleX: 1.35, // Scala estesa per eliminare i bordi laterali del rettangolo
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.screen,
                      ),
                      child: Image.asset(
                        'venom_wave.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(),
                      ),
                    ),
                  ),
                ),

                const Spacer(flex: 2),

                // Controlli e pulsanti inferiori
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      // Testo ATTIVO
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ATTIVO ',
                            style: TextStyle(
                              color: Color(0xFFFF3B30),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Icon(Icons.mic, color: Color(0xFFFF3B30), size: 15),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Box Interruttori
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF141418).withOpacity(0.92),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSwitchWithIcon(
                              iconWidget: ClipOval(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset('venom_head.png', fit: BoxFit.contain),
                                ),
                              ),
                              label: 'VENOM AI',
                              value: venomAiEnabled,
                              onChanged: (v) => setState(() => venomAiEnabled = v),
                            ),
                            _buildSwitchWithIcon(
                              iconWidget: const Icon(Icons.mic, size: 20, color: Colors.white70),
                              label: 'MICROFONO',
                              value: microfonoEnabled,
                              onChanged: (v) => setState(() => microfonoEnabled = v),
                            ),
                            _buildSwitchWithIcon(
                              iconWidget: const Icon(Icons.camera_alt, size: 20, color: Colors.white70),
                              label: 'FOTOCAMERA',
                              value: fotocameraEnabled,
                              onChanged: (v) => setState(() => fotocameraEnabled = v),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Sezione Voci
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF141418).withOpacity(0.92),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white24, width: 1.2),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset('venom_head.png', fit: BoxFit.contain),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('VOCE', style: TextStyle(fontSize: 8, color: Colors.white54)),
                                            Text('ORIGINALE (FILM)', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(Icons.volume_down, size: 14, color: Colors.white54),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 6),
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.white24,
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(width: 50, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.volume_up, size: 14, color: Colors.white54),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFF141418).withOpacity(0.92),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.person, size: 20, color: Colors.white54),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('VOCE', style: TextStyle(fontSize: 8, color: Colors.white54)),
                                            Text('UMANA', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Pulsante Chat
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1C1C22),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'MODALITÀ CHAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchWithIcon({
    required Widget iconWidget,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      children: [
        iconWidget,
        const SizedBox(height: 2),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFFFF3B30),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}
