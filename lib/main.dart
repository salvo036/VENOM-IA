import 'package:flutter/material.dart';

void main() {
  runApp(const VenomApp());
}

class VenomApp extends StatelessWidget {
  const VenomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venom IA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F11),
      ),
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
  bool isVenomAiOn = true;
  bool isMicrophoneOn = true;
  bool isCameraOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.videocam_outlined, size: 16, color: Colors.white70),
                        SizedBox(width: 6),
                        Text('Ray-Ban Meta', style: TextStyle(fontSize: 12, color: Colors.white70)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.bluetooth, size: 20, color: Colors.white.withOpacity(0.6)),
                      const SizedBox(width: 15),
                      Icon(Icons.settings_outlined, size: 20, color: Colors.white.withOpacity(0.6)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white10, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.face_retouching_natural, size: 80, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    25,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 3,
                      height: (index % 5 + 1) * 6.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
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
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.red, size: 18),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSwitchControl('VENOM AI', isVenomAiOn, (val) => setState(() => isVenomAiOn = val)),
                    _buildSwitchControl('MICROFONO', isMicrophoneOn, (val) => setState(() => isMicrophoneOn = val)),
                    _buildSwitchControl('FOTOCAMERA', isCameraOn, (val) => setState(() => isCameraOn = val)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: _buildVoiceCard('VOCE ORIGINALE (FILM)', true)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildVoiceCard('VOCE UMANA', false)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF25252A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'MODALITÀ CHAT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
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

  Widget _buildSwitchControl(String title, bool value, Function(bool) onChanged) {
    return Column(
      children: [
        Switch(
          value: value,
          activeColor: Colors.red,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildVoiceCard(String title, bool isOriginal) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(isOriginal ? Icons.face : Icons.person, size: 24, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Icon(Icons.graphic_eq, color: Colors.white.withOpacity(0.5), size: 18),
        ],
      ),
    );
  }
}
//aggiornato
