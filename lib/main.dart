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
      backgroundColor: const Color(0xFF0A0A0C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16161A),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.videocam, size: 15, color: Colors.white70),
                        SizedBox(width: 5),
                        Text('Ray-Ban Meta', style: TextStyle(fontSize: 11, color: Colors.white70)),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.bluetooth, size: 17, color: Colors.white70),
                      SizedBox(width: 14),
                      Icon(Icons.settings, size: 17, color: Colors.white70),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Logo Venom e Onda Audio
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF131316),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CustomPaint(
                          size: const Size(80, 80),
                          painter: VenomPreciseFacePainter(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Onda audio fluida corretta
                    SizedBox(
                      height: 30,
                      width: 260,
                      child: CustomPaint(
                        painter: CleanWaveformPainter(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ATTIVO ',
                          style: TextStyle(
                            color: Color(0xFFFF3B30),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Icon(Icons.mic, color: Color(0xFFFF3B30), size: 16),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Sezione Interruttori Unificata
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF131316),
                  borderRadius: BorderRadius.circular(20),
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

              // Sezione Voci
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131316),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white24, width: 1.2),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 22,
                            height: 22,
                            child: CustomPaint(
                              painter: VenomPreciseFacePainter(),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('VOCE', style: TextStyle(fontSize: 9, color: Colors.white54)),
                                Text('ORIGINALE\n(FILM)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            ),
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
                        color: const Color(0xFF131316),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person, size: 22, color: Colors.white38),
                          SizedBox(width: 8),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('VOCE', style: TextStyle(fontSize: 9, color: Colors.white54)),
                                Text('UMANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
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
                    backgroundColor: const Color(0xFF1C1C20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'MODALITÀ CHAT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
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

// Disegno fedele del volto di Venom con occhi affilati e dentatura minacciosa
class VenomPreciseFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Occhio sinistro
    final eyeLeft = Path();
    eyeLeft.moveTo(size.width * 0.15, size.height * 0.35);
    eyeLeft.quadraticBezierTo(size.width * 0.38, size.height * 0.1, size.width * 0.45, size.height * 0.5);
    eyeLeft.quadraticBezierTo(size.width * 0.3, size.height * 0.6, size.width * 0.15, size.height * 0.35);
    canvas.drawPath(eyeLeft, paintWhite);

    // Occhio destro
    final eyeRight = Path();
    eyeRight.moveTo(size.width * 0.85, size.height * 0.35);
    eyeRight.quadraticBezierTo(size.width * 0.62, size.height * 0.1, size.width * 0.55, size.height * 0.5);
    eyeRight.quadraticBezierTo(size.width * 0.7, size.height * 0.6, size.width * 0.85, size.height * 0.35);
    canvas.drawPath(eyeRight, paintWhite);

    // Denti e bocca ghignante
    final paintTeeth = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final mouth = Path();
    mouth.moveTo(size.width * 0.22, size.height * 0.68);
    mouth.quadraticBezierTo(size.width * 0.5, size.height * 0.95, size.width * 0.78, size.height * 0.68);
    canvas.drawPath(mouth, paintTeeth);

    // Linee dei denti aguzzi
    for (double i = 0.3; i <= 0.7; i += 0.08) {
      canvas.drawLine(
        Offset(size.width * i, size.height * 0.72),
        Offset(size.width * (i + 0.02), size.height * 0.82),
        paintTeeth,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Onda audio liscia e sinuosa come nel mockup
class CleanWaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF3B30).withOpacity(0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double centerY = size.height / 2;
    path.moveTo(0, centerY);

    for (double x = 0; x <= size.width; x += 2) {
      // Formula trigonometrica pulita per un'onda armonica
      double y = centerY + math.sin(x * 0.08) * (8 * math.sin(x * 0.03).abs() + 3);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
