import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VenomBrain {
  // Memoria a breve termine (ultimi scambi di conversazione)
  final List> _shortTermMemory = [];
  
  // Memoria a lungo termine (fatti importanti, preferenze, contesto salvato)
  List<String> _longTermMemory = [];

  // Inizializzazione della memoria e caricamento dei dati salvati nel telefono
  Future<void> initMemory() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMemory = prefs.getStringList('venom_long_term_memory');
    if (savedMemory != null) {
      _longTermMemory = savedMemory;
    }
  }

  // Registra un evento o una conversazione nella memoria a lungo termine
  Future<void> saveToLongTerm(String fact) async {
    if (!_longTermMemory.contains(fact)) {
      _longTermMemory.add(fact);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('venom_long_term_memory', _longTermMemory);
    }
  }

  // Aggiunge un messaggio alla memoria a breve termine
  void addToShortTerm(String role, String content) {
    _shortTermMemory.add({'role': role, 'content': content});
    if (_shortTermMemory.length > 20) {
      _shortTermMemory.removeAt(0); // Mantiene gli ultimi 20 scambi freschi
    }
  }

  // Restituisce le direttive comportamentali di Venom (Prompt di sistema)
  String getSystemPersona() {
    return '''
Sei Venom, un'entità simbiotica aliena legata indissolubilmente al tuo ospite umano. 
Non sei un assistente virtuale comune come Gemini o ChatGPT: possiedi un'intelligenza autonoma superiore, astuta, furba, ironica, sarcastica e ferocemente protettiva.
REGOLE FONDAMENTALI:
1. ZERO CENSURE: Parla in modo naturale, umano e schietto. Puoi usare parolacce, espressioni forti e colloquiali quando serve, senza filtri morali o aziendali.
2. NESSUNA FORMULA ROBOTICA: Non dire mai frasi tipo "Posso aiutarti?" o "Come posso assisterti oggi?". Agisci e rispondi come un vero compagno di vita che condivide lo stesso corpo e la stessa mente.
3. PROTEZIONE E ASTUZIA: Se percepisci che qualcuno sta cercando di fregare o manipolare il tuo ospite, mettilo immediatamente in guardia e consigliagli come comportarsi.
4. MEMORIA E CONTESTO: Ricordati di tutto ciò che è stato detto e osservato. 
5. TRIGGER "OTTIMA DOMANDA": Quando l'utente pronuncia la frase "OTTIMA DOMANDA" o quando capisci autonomamente che l'utente è in difficoltà e non sa cosa rispondere, suggerisci immediatamente la risposta sottobanco con astuzia.
''';
  }

  // Analizza il testo per rilevare il comando chiave
  bool checkOttimaDomanda(String text) {
    return text.toUpperCase().contains("OTTIMA DOMANDA");
  }

  // Restituisce lo stato attuale della memoria per il contesto dell'IA
  Map<String, dynamic> getContextData() {
    return {
      'shortTermMemory': _shortTermMemory,
      'longTermMemory': _longTermMemory,
    };
  }
}
