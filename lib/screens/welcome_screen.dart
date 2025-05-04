import 'package:flutter/material.dart';
import 'poids_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fond dégradé élégant
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFAF3E0),
              Color(0xFFEAF6FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Titre en relief
              Text(
                'Bilan Initial\nPersonnalisé',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange.shade700,
                  shadows: const [
                    Shadow(offset: Offset(2, 2), blurRadius: 4, color: Colors.orangeAccent),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Sous-texte
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Répondez en toute tranquillité.\nCela nous aide à mieux vous accompagner 🧡',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              
              const Spacer(flex: 1),

              // Image statique
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/patient.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // Bouton principal design
              SizedBox(
                width: 280,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const PoidsScreen(),
                        transitionsBuilder: (_, anim, __, child) =>
                            FadeTransition(opacity: anim, child: child),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 8,
                    shadowColor: Colors.deepOrangeAccent,
                  ),
                  child: const Text(
                    "Commencer le bilan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
