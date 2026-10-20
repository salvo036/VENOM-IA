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
      backgroundColor: const Color(0xFF0A0A0D),
      body: Stack(
        children: [
          // Sfondo con venature simbiotiche dettagliate come nel mockup
          Positioned.fill(
            child: CustomPaint(
              painter: DetailedSymbioteBackgroundPainter(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.videocam, size: 14, color: Colors.white70),
                            SizedBox(width: 5),
                            Text('Ray-Ban Meta', style: TextStyle(fontSize: 11, color: Colors.white70)),
                          ],
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.bluetooth, size: 16, color: Colors.white70),
                          SizedBox(width: 14),
                          Icon(Icons.settings, size: 16, color: Colors.white70),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Logo Centrale con il volto perfetto di Venom e spettro audio fluido
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const RadialGradient(
                              colors: [Color(0xFF222228), Color(0xFF0F0F12)],
                              radius: 0.85,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.9),
                                blurRadius: 22,
                                spreadRadius: 5,
                              ),
                            ],
                            border: Border.all(color: Colors.white.withOpacity(0.06)),
                          ),
                          child: Center(
                            child: CustomPaint(
                              size: const Size(100, 100),
                              painter: UltimateVenomFacePainter(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        // Spettro Audio Morbido e Sfumato identico al mockup
                        SizedBox(
                          height: 38,
                          width: 290,
                          child: CustomPaint(
                            painter: PerfectAudioWavePainter(),
                          ),
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
                                fontSize: 13,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Icon(Icons.mic, color: Color(0xFFFF3B30), size: 15),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Blocco Interruttori unificato con le icone dedicate in alto
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141418).withOpacity(0.92),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white.withOpacity(0.06)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildTopSwitchItem(
                          customPainterIcon: UltimateVenomFacePainter(),
                          label: 'VENOM AI',
                          value: venomAiEnabled,
                          onChanged: (v) => setState(() => venomAiEnabled = v),
                        ),
                        _buildTopSwitchItem(
                          icon: Icons.mic,
                          label: 'MICROFONO',
                          value: microfonoEnabled,
                          onChanged: (v) => setState(() => microfonoEnabled = v),
                        ),
                        _buildTopSwitchItem(
                          icon: Icons.camera_alt,
                          label: 'FOTOCAMERA',
                          value: fotocameraEnabled,
                          onChanged: (v) => setState(() => fotocameraEnabled = v),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Sezione Voci Dettagliata (con miniature e barre audio)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141418).withOpacity(0.92),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white24, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CustomPaint(painter: UltimateVenomFacePainter()),
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
                              const SizedBox(height: 8),
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
                                        child: Container(width: 45, color: Colors.white),
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
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141418).withOpacity(0.92),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.06)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.person, size: 20, color: Colors.white54),
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
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 15,
                                child: CustomPaint(
                                  painter: MiniWaveformPainter(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Pulsante Modalità Chat
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D1D22),
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

  Widget _buildTopSwitchItem({
    IconData? icon,
    CustomPainter? customPainterIcon,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      children: [
        customPainterIcon != null
            ? SizedBox(width: 22, height: 22, child: CustomPaint(painter: UltimateVenomFacePainter()))
            : Icon(icon, size: 22, color: Colors.white70),
        const SizedBox(height: 4),
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

// Sfondo con venature simbiotiche realistiche
class DetailedSymbioteBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.035)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    // Venatura sinistra
    path.moveTo(0, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.25, size.width * 0.15, size.height * 0.55);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.75, size.width * 0.05, size.height * 0.9);

    // Venatura destra
    path.moveTo(size.width, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.3, size.width * 0.85, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.8, size.width * 0.95, size.height * 0.95);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Volto definitivo di Venom con occhi aggressivi e fauci dentate perfette
class UltimateVenomFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Occhi grandi e affilati in stile Venom
    final eyeLeft = Path();
    eyeLeft.moveTo(size.width * 0.12, size.height * 0.28);
    eyeLeft.quadraticBezierTo(size.width * 0.42, size.height * -0.08, size.width * 0.48, size.height * 0.48);
    eyeLeft.quadraticBezierTo(size.width * 0.28, size.height * 0.58, size.width * 0.12, size.height * 0.28);
    canvas.drawPath(eyeLeft, paintWhite);

    final eyeRight = Path();
    eyeRight.moveTo(size.width * 0.88, size.height * 0.28);
    eyeRight.quadraticBezierTo(size.width * 0.58, size.height * -0.08, size.width * 0.52, size.height * 0.48);
    eyeRight.quadraticBezierTo(size.width * 0.72, size.height * 0.58, size.width * 0.88, size.height * 0.28);
    canvas.drawPath(eyeRight, paintWhite);

    // Bocca e denti aguzzi
    final paintTeeth = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;

    final mouth = Path();
    mouth.moveTo(size.width * 0.18, size.height * 0.62);
    mouth.quadraticBezierTo(size.width * 0.5, size.height * 1.05, size.width * 0.82, size.height * 0.62);
    canvas.drawPath(mouth, paintTeeth);

    for (double i = 0.22; i <= 0.78; i += 0.065) {
      canvas.drawLine(
        Offset(size.width * i, size.height * 0.64),
        Offset(size.width * (i + 0.025), size.height * 0.84),
        paintTeeth,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Spettro audio centrale fluido e sfumato come nel mockup originale
class PerfectAudioWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF3B30).withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);

    for (double x = 0; x <= size.width; x += 1) {
      double envelope = math.sin((x / size.width) * math.pi);
      double wave = (math.sin(x * 0.2) * 6 + math.cos(x * 0.09) * 11 + math.sin(x * 0.04) * 5);
      double y = centerY + (wave * envelope);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Mini onda per il blocco della voce umana
class MiniWaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);
    for (double x = 0; x <= size.width; x += 2) {
      double y = centerY + math.sin(x * 0.35) * 4.5;
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
