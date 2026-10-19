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
      backgroundColor: const Color(0xFF0B0B0E),
      body: Stack(
        children: [
          // Sfondo con venature simbiotiche sfumate
          Positioned.fill(
            child: CustomPaint(
              painter: SymbioteBackgroundPainter(),
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
                          color: Colors.black.withOpacity(0.5),
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

                  // Logo Centrale Venom e Spettro Audio
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 135,
                          height: 135,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF1E1E24), Color(0xFF0F0F12)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.85),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: Center(
                            child: CustomPaint(
                              size: const Size(95, 95),
                              painter: VenomPerfectFacePainter(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        
                        // Spettro Audio Morbido e Continuo
                        SizedBox(
                          height: 35,
                          width: 280,
                          child: CustomPaint(
                            painter: RealisticAudioWavePainter(),
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

                  // Sezione Interruttori (Stile Box Unificato)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141418).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildSwitchItem('VENOM AI', venomAiEnabled, (v) => setState(() => venomAiEnabled = v)),
                        _buildSwitchItem('MICROFONO', microfonoEnabled, (v) => setState(() => microfonoEnabled = v)),
                        _buildSwitchItem('FOTOCAMERA', fotocameraEnabled, (v) => setState(() => fotocameraEnabled = v)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Sezione Voci Dettagliata (con barre volume/audio)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141418).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white24, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CustomPaint(painter: VenomPerfectFacePainter()),
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
                            color: const Color(0xFF141418).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
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

  Widget _buildSwitchItem(String label, bool value, ValueChanged<bool> onChanged) {
    return Column(
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFFFF3B30),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}

// Sfondo con venature simbiotiche simulate
class SymbioteBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.025)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.3, size.width * 0.1, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.8, size.width * 0.05, size.height);

    path.moveTo(size.width, size.height * 0.15);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.35, size.width * 0.9, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.85, size.width * 0.95, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Volto perfetto di Venom con dettagli e denti aguzzi
class VenomPerfectFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Occhi grandi aggressivi
    final eyeLeft = Path();
    eyeLeft.moveTo(size.width * 0.12, size.height * 0.3);
    eyeLeft.quadraticBezierTo(size.width * 0.4, size.height * 0.0, size.width * 0.47, size.height * 0.48);
    eyeLeft.quadraticBezierTo(size.width * 0.28, size.height * 0.6, size.width * 0.12, size.height * 0.3);
    canvas.drawPath(eyeLeft, paintWhite);

    final eyeRight = Path();
    eyeRight.moveTo(size.width * 0.88, size.height * 0.3);
    eyeRight.quadraticBezierTo(size.width * 0.6, size.height * 0.0, size.width * 0.53, size.height * 0.48);
    eyeRight.quadraticBezierTo(size.width * 0.72, size.height * 0.6, size.width * 0.88, size.height * 0.3);
    canvas.drawPath(eyeRight, paintWhite);

    // Bocca e dentatura ricca
    final paintTeeth = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;

    final mouth = Path();
    mouth.moveTo(size.width * 0.18, size.height * 0.65);
    mouth.quadraticBezierTo(size.width * 0.5, size.height * 1.0, size.width * 0.82, size.height * 0.65);
    canvas.drawPath(mouth, paintTeeth);

    for (double i = 0.22; i <= 0.78; i += 0.07) {
      canvas.drawLine(
        Offset(size.width * i, size.height * 0.67),
        Offset(size.width * (i + 0.025), size.height * 0.85),
        paintTeeth,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Onda audio centrale fluida, densa e professionale
class RealisticAudioWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF3B30).withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);

    for (double x = 0; x <= size.width; x += 1) {
      double envelope = math.sin((x / size.width) * math.pi);
      double wave = (math.sin(x * 0.2) * 6 + math.cos(x * 0.08) * 10);
      double y = centerY + (wave * envelope);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Mini onda per il blocco voce umana
class MiniWaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);
    for (double x = 0; x <= size.width; x += 2) {
      double y = centerY + math.sin(x * 0.4) * 4;
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
