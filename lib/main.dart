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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF16161A),
                      borderRadius: BorderRadius.circular(20),
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

              // Logo Centrale e Onda Audio pulita
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF141418),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.face,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Onda audio elegante e lineare
                    Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage('https://via.placeholder.com/250x30/0B0B0E/FF3B30?text=~*~*~*~*~*~'),
                          fit: BoxFit.contain,
                        ),
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
                            letterSpacing: 1.2,
                          ),
                        ),
                        Icon(Icons.mic, color: Color(0xFFFF3B30), size: 15),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Sezione Interruttori Unificata
              Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF141418),
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

              const SizedBox(height: 10),

              // Sezione Voci
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141418),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white24, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.face, size: 20, color: Colors.white),
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
                        color: const Color(0xFF141418),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          SizedBox(height: 12),
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
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}
