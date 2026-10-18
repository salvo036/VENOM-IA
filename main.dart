import 'package:flutter/material.dart';

void main() {
  runApp(const VenomApp());
}

class VenomApp extends StatelessWidget {
  const VenomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venom AI Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0D10),
        primarySwatch: Colors.red,
      ),
      home: const VenomHomeScreen(),
    );
  }
}

class VenomHomeScreen extends StatefulWidget {
  const VenomHomeScreen({Key? key}) : super(key: key);

  @override
  State<VenomHomeScreen> createState() => _VenomHomeScreenState();
}

class _VenomHomeScreenState extends State<VenomHomeScreen> {
  bool isVenomAiActive = true;
  bool isMicActive = true;
  bool isCameraActive = false;
  double voiceOriginalVolume = 0.8;
  double voiceHumanVolume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Barra Superiore
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
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
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.bluetooth, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              
              const Spacer(),

              // Logo Centrale di Venom
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF161922),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 15,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.pest_control_rodent, // Sostituibile con l'asset grafico di Venom
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Onda Audio Dinamica
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(24, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 3,
                      height: (index % 3 == 0) ? 30.0 : (index % 2 == 0 ? 20.0 : 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 25),

              // Indicatore ATTIVO
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ATTIVO',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.mic, color: Colors.red, size: 18),
                ],
              ),

              const SizedBox(height: 20),

              // Pannello Toggle Principali (Venom AI, Microfono, Fotocamera)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF141720),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildToggleControl(
                      label: 'VENOM AI',
                      value: isVenomAiActive,
                      onChanged: (val) => setState(() => isVenomAiActive = val),
                    ),
                    _buildToggleControl(
                      label: 'MICROFONO',
                      value: isMicActive,
                      onChanged: (val) => setState(() => isMicActive = val),
                    ),
                    _buildToggleControl(
                      label: 'FOTOCAMERA',
                      value: isCameraActive,
                      onChanged: (val) => setState(() => isCameraActive = val),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Pannello Selezione Voci (Voce Originale / Voce Umana)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141720),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.bolt, size: 16, color: Colors.white70),
                              SizedBox(width: 6),
                              Text('VOCE ORIGINALE (FILM)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Slider(
                            value: voiceOriginalVolume,
                            activeColor: Colors.red,
                            onChanged: (val) => setState(() => voiceOriginalVolume = val),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141720),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.person, size: 16, color: Colors.white70),
                              SizedBox(width: 6),
                              Text('VOCE UMANA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Slider(
                            value: voiceHumanVolume,
                            activeColor: Colors.red,
                            onChanged: (val) => setState(() => voiceHumanVolume = val),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Pulsante Modalità Chat Inferiore
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF141720),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white12),
                ),
                child: const Center(
                  child: Text(
                    'MODALITÀ CHAT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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

  Widget _buildToggleControl({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: value,
          activeColor: Colors.red,
          onChanged: onChanged,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }
}
