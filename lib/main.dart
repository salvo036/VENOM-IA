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
      backgroundColor: const Color(0xFF0C0C0E),
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
                      color: const Color(0xFF18181C),
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

              // Logo Venom Dettagliato + Onda Fluida
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 135,
                      height: 135,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF141417),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.9),
                            blurRadius: 18,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CustomPaint(
                          size: const Size(90, 90),
                          painter: VenomDetailedFacePainter(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    
                    // Onda audio continua stile mockup
                    SizedBox(
                      height: 35,
                      width: 240,
                      child: CustomPaint(
                        painter: SmoothAudioWavePainter(),
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
                            fontSize: 15,
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
                  color: const Color(0xFF141417),
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
                        color: const Color(0xFF141417),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white24, width: 1.2),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: CustomPaint(
                              painter: VenomDetailedFacePainter(),
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
                        color: const Color(0xFF141417),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person, size: 24, color: Colors.white38),
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
                    backgroundColor: const Color(0xFF1E1E22),
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

// Disegna il volto iconico e aggressivo di Venom con denti multipli
class VenomDetailedFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Occhio Sinistro Affilato
    final pathLeft = Path();
    pathLeft.moveTo(size.width * 0.15, size.height * 0.3);
    pathLeft.quadraticBezierTo(size.width * 0.4, size.height * 0.05, size.width * 0.46, size.height * 0.5);
    pathLeft.quadraticBezierTo(size.width * 0.3, size.height * 0.65, size.width * 0.15, size.height * 0.3);
    canvas.drawPath(pathLeft, paintWhite);

    // Occhio Destro Affilato
    final pathRight = Path();
    pathRight.moveTo(size.width * 0.85, size.height * 0.3);
    pathRight.quadraticBezierTo(size.width * 0.6, size.height * 0.05, size.width * 0.54, size.height * 0.5);
    pathRight.quadraticBezierTo(size.width * 0.7, size.height * 0.65, size.width * 0.85, size.height * 0.3);
    canvas.drawPath(pathRight, paintWhite);

    // Bocca e Denti aguzzi
    final paintTeeth = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final mouth = Path();
    mouth.moveTo(size.width * 0.2, size.height * 0.7);
    mouth.quadraticBezierTo(size.width * 0.5, size.height * 0.95, size.width * 0.8, size.height * 0.7);
    canvas.drawPath(mouth, paintTeeth);

    // Denti verticali stilizzati
    for (double i = 0.3; i <= 0.7; i += 0.1) {
      canvas.drawLine(
        Offset(size.width * i, size.height * 0.73),
        Offset(size.width * (i + 0.03), size.height * 0.82),
        paintTeeth,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Disegna l'onda audio fluida centrale
class SmoothAudioWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF3B30).withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    double centerY = size.height / 2;
    path.moveTo(0, centerY);

    for (double x = 0; x < size.width; x += 5) {
      double y = centerY + Math.sin(x * 0.15) * (10 + Math.sin(x * 0.05) * 5);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Supporto per Math
class Math {
  static double sin(double radians) => stdSin(radians);
  static double stdSin(double radians) => 
      // Semplificazione trigonometrica nativa per Flutter
      (radians % 6.28); 
}
