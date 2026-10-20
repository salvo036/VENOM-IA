import 'dart:math' as math;
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
          // Venature sfondo
          Positioned.fill(
            child: CustomPaint(painter: SymbioteBackgroundPainter()),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16161A),
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

                  const Spacer(),

                  // Volto Venom + Onda audio rossa
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 145,
                          height: 145,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.9),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'venom_head.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Onda audio rossa fluida
                        SizedBox(
                          height: 35,
                          width: 260,
                          child: CustomPaint(painter: RedAudioWavePainter()),
                        ),
                        const SizedBox(height: 10),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ATTIVO ',
                              style: TextStyle(
                                color: Color(0xFFFF3B30),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Icon(Icons.mic, color: Color(0xFFFF3B30), size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Interruttori con icone sopra
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141418),
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
                              child: Image.asset('venom_head.png', fit: BoxFit.cover),
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

                  const SizedBox(height: 12),

                  // Sezione Voci
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141418),
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
                                      width: 22,
                                      height: 22,
                                      child: Image.asset('venom_head.png', fit: BoxFit.cover),
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
                              const SizedBox(height: 10),
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
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141418),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person, size: 22, color: Colors.white54),
                                  SizedBox(width: 8),
                                  Expanded(
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
                              SizedBox(height: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Pulsante Chat
                  SizedBox(
                    width: double.infinity,
                    height: 52,
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
                  const SizedBox(height: 6),
                ],
              ),
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

class RedAudioWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF3B30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);

    for (double x = 0; x <= size.width; x += 1) {
      double envelope = math.sin((x / size.width) * math.pi);
      double wave = math.sin(x * 0.2) * 7 + math.cos(x * 0.08) * 10;
      double y = centerY + (wave * envelope);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SymbioteBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final path = Path();
    path.moveTo(0, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.3, size.width * 0.1, size.height * 0.6);
    path.moveTo(size.width, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.4, size.width * 0.9, size.height * 0.75);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
