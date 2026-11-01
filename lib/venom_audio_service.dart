import 'package:flutter_tts/flutter_tts.dart';

class VenomAudioService {
  final FlutterTts _tts = FlutterTts();
  
  bool isSpeakingWithUs = false; // Se false: parla solo con te ("Parla con me")

  // Inizializzazione del motore vocale
  Future<void> initAudio() async {
    await _tts.setLanguage("it-IT");
    await _tts.setVolume(1.0);
  }

  // Imposta la modalità di ascolto ed interazione con gli altri
  void setMode(bool withOthers) {
    isSpeakingWithUs = withOthers;
  }

  // Sintesi vocale con doppia voce (Film vs Umana)
  Future<void> speak(String text, {bool isOriginalFilmVoice = true}) async {
    if (isOriginalFilmVoice) {
      // Impostazioni per la voce originale cupa e profonda del film
      await _tts.setPitch(0.5); // Tono molto basso e profondo
      await _tts.setSpeechRate(0.85); // Più lenta e minacciosa
    } else {
      // Impostazioni per la voce umana naturale
      await _tts.setPitch(1.0);
      await _tts.setSpeechRate(1.0);
    }
    await _tts.speak(text);
  }

  // Gestione dei comandi vocali di stato impartiti dall'utente
  String processVoiceCommand(String command) {
    final upper = command.toUpperCase();
    if (upper.contains("PARLA CON ME")) {
      isSpeakingWithUs = false;
      return "Ricevuto. Ora ascolto e parlo solo con te.";
    } else if (upper.contains("PARLA CON NOI")) {
      isSpeakingWithUs = true;
      return "Perfetto. Aperto a tutti, vediamo chi prova a fare il furbo.";
    }
    return "";
  }
}
