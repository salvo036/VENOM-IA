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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            children: [
              // Barra superiore (Ray-Ban Meta e icone)
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

              // Logo Centrale (Cerchio Venom) e Onda Audio Sotto
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF121215),
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
                          'assets/images/venom_bg.png', // <-- Qui caricheremo l'immagine esatta del volto di Venom
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Text(
                              'VENOM',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white54),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Onda Audio Dinamica (linea sottile centrale)
                    Container(
                      height: 25,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          bottom: BorderSide(color: const Color(0xFFFF3B30).withOpacity(0.8), width: 2),
                        ),
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

              // Box Unificato Interruttori (Venom AI, Microfono, Fotocamera)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF141418),
                  borderRadius: BorderRadius.circular(24),
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

              // Riquadri Sezione Voci (Originale Film & Umana)
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
                          const Row(
                            children: [
                              Icon(Icons.face, size: 22, color: Colors.white),
                              SizedBox(width: 8),
                              Expanded(
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

              // Pulsante Inferiore "Modalità Chat"
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
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}
