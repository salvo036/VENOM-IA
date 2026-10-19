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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.videocam, size: 16, color: Colors.white70),
                        SizedBox(width: 6),
                        Text('Ray-Ban Meta', style: TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.bluetooth, size: 18, color: Colors.white70),
                      SizedBox(width: 15),
                      Icon(Icons.settings, size: 18, color: Colors.white70),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Logo Venom Custom (Vettoriale)
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF16161A),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CustomPaint(
                          size: const Size(80, 80),
                          painter: VenomFacePainter(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Ondulazione audio stile mockup
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(15, (index) {
                        double height = (index % 3 == 0) ? 28 : (index % 2 == 0 ? 18 : 10);
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: 3,
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ATTIVO ',
                          style: TextStyle(
                            color: Color(0xFFFF3B30),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Icon(Icons.mic, color: Color(0xFFFF3B30), size: 18),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Sezione Interruttori
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF16161A),
                  borderRadius: BorderRadius.circular(22),
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

              const SizedBox(height: 12),

              // Sezione Voci
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16161A),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white24, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          CustomPaint(
                            size: const Size(26, 26),
                            painter: VenomFacePainter(),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('VOCE', style: TextStyle(fontSize: 10, color: Colors.white54)),
                                Text('ORIGINALE\n(FILM)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
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
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16161A),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.person, size: 26, color: Colors.white38),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('VOCE', style: TextStyle(fontSize: 10, color: Colors.white54)),
                                Text('UMANA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Pulsante Modalità Chat
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF222228),
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
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}

// Disegna il volto iconico di Venom (Occhi bianchi obliqui e fessure)
class VenomFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintWhite = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Occhio Sinistro
    final pathLeft = Path();
    pathLeft.moveTo(size.width * 0.15, size.height * 0.25);
    pathLeft.quadraticBezierTo(size.width * 0.45, size.height * 0.1, size.width * 0.48, size.height * 0.55);
    pathLeft.quadraticBezierTo(size.width * 0.3, size.height * 0.7, size.width * 0.15, size.height * 0.25);
    canvas.drawPath(pathLeft, paintWhite);

    // Occhio Destro
    final pathRight = Path();
    pathRight.moveTo(size.width * 0.85, size.height * 0.25);
    pathRight.quadraticBezierTo(size.width * 0.55, size.height * 0.1, size.width * 0.52, size.height * 0.55);
    pathRight.quadraticBezierTo(size.width * 0.7, size.height * 0.7, size.width * 0.85, size.height * 0.25);
    canvas.drawPath(pathRight, paintWhite);

    // Denti / Bocca
    final paintTeeth = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final mouthPath = Path();
    mouthPath.moveTo(size.width * 0.25, size.height * 0.75);
    mouthPath.quadraticBezierTo(size.width * 0.5, size.height * 0.95, size.width * 0.75, size.height * 0.75);
    canvas.drawPath(mouthPath, paintTeeth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
