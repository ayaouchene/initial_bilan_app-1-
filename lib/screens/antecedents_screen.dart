import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bilan_provider.dart';
import '../widgets/custom_widgets.dart';
import 'welcome_screen.dart';
class AntecedentsScreen extends StatefulWidget {
  const AntecedentsScreen({Key? key}) : super(key: key);

  @override
  State<AntecedentsScreen> createState() => _AntecedentsScreenState();
}

class _AntecedentsScreenState extends State<AntecedentsScreen> {
  final _antecedentsMedicaux = TextEditingController();
  final _antecedentsFamiliaux = TextEditingController();
  final _medicaments = TextEditingController();
  final _chirurgies = TextEditingController();

  @override
  void dispose() {
    _antecedentsMedicaux.dispose();
    _antecedentsFamiliaux.dispose();
    _medicaments.dispose();
    _chirurgies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BilanProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF6FF), Color(0xFFF9E4D4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progression
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: LinearProgressIndicator(
                  value: 5 / 5,
                  backgroundColor: Colors.white70,
                  valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  minHeight: 6,
                ),
              ),
              // Titre
              Text(
                '🧬 Antécédents médicaux',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange.shade700,
                  shadows: const [
                    Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.orangeAccent),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("🩺 Informations médicales"),
                            const SizedBox(height: 8),

                            const Text(
                              "Antécédents médicaux particuliers (diabète, hypertension...)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _antecedentsMedicaux,
                              maxLines: 3,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),

                            const SizedBox(height: 16),
                            const Text(
                              "Cas de surpoids ou maladies métaboliques dans votre famille",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _antecedentsFamiliaux,
                              maxLines: 3,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),

                            const SizedBox(height: 16),
                            const Text(
                              "Médicaments actuels (nom et durée)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _medicaments,
                              maxLines: 2,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),

                            const SizedBox(height: 16),
                            const Text(
                              "Interventions chirurgicales liées au poids",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: _chirurgies,
                              maxLines: 2,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton Terminer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      prov.updateAntecedentsMedicaux(_antecedentsMedicaux.text);
                      prov.updateAntecedentsFamiliaux(_antecedentsFamiliaux.text);
                      prov.updateMedicaments(_medicaments.text);
                      prov.updateChirurgies(_chirurgies.text);

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  child: const Icon(Icons.check, size: 48, color: Colors.white),
                                ),
                                const SizedBox(height: 16),

                                Text(
                                  "Bravo 🎉",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange.shade700,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                const Text(
                                  "Vous avez terminé le bilan avec succès.\nVotre médecin va recevoir vos informations.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 24),

                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Ferme le dialog
                                      Navigator.pushAndRemoveUntil(
                                       context,
                                       MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                                        (Route<dynamic> route) => false,
                                       );
                                     },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                    ),
                                    child: const Text(
                                      "Terminer",
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      // Naviguer vers l'écran suivant
                      Navigator.pushNamed(context, '/suivant');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      elevation: 6,
                    ),
                    child: const Text("Terminer", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
