import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bilan_provider.dart';
import '../widgets/custom_widgets.dart';
import 'conso_screen.dart';

class HabitudesScreen extends StatefulWidget {
  const HabitudesScreen({Key? key}) : super(key: key);

  @override
  State<HabitudesScreen> createState() => _HabitudesScreenState();
}

class _HabitudesScreenState extends State<HabitudesScreen> {
  final _repasHeures = TextEditingController();
  String? _position;
  String? _compagnie;
  String? _vitesse;
  String? _resservir;
  final _collations = TextEditingController();
  final _grignotage = TextEditingController();
  String? _saute;
  final _mangerNuit = TextEditingController();
  final _sensations = TextEditingController();
  final _tailles = TextEditingController();
  final _achats = TextEditingController();
  final _preparation = TextEditingController();

  @override
  void dispose() {
    _repasHeures.dispose();
    _collations.dispose();
    _grignotage.dispose();
    _mangerNuit.dispose();
    _sensations.dispose();
    _tailles.dispose();
    _achats.dispose();
    _preparation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BilanProvider>(context, listen: false);

    return Scaffold(
      // Fond en dégradé
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF9E4D4), Color(0xFFEAF6FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress bar (étape 3/4)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: LinearProgressIndicator(
                  value: 3 / 5,
                  backgroundColor: Colors.white70,
                  valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  minHeight: 6,
                ),
              ),

              // Titre
              Text(
                'Habitudes alimentaires',
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
                    // Bloc repas
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("⏰ Repas"),
                            CustomTextField(
                              label: "Heures habituelles des repas",
                              controller: _repasHeures,
                            ),
                            CustomDropdown(
                              label: "Position (assis/debout)",
                              items: ["Debout", "Assis"],
                              value: _position,
                              onChanged: (v) => setState(() => _position = v),
                            ),
                            CustomDropdown(
                              label: "Compagnie",
                              items: ["Seul", "En compagnie", "Restaurant"],
                              value: _compagnie,
                              onChanged: (v) => setState(() => _compagnie = v),
                            ),
                            CustomDropdown(
                              label: "Vitesse du repas",
                              items: ["Vite", "Prendre le temps"],
                              value: _vitesse,
                              onChanged: (v) => setState(() => _vitesse = v),
                            ),
                            CustomDropdown(
                              label: "Se resservir ?",
                              items: ["Oui", "Non"],
                              value: _resservir,
                              onChanged: (v) => setState(() => _resservir = v),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bloc collations & grignotage
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("🍪 Collations & Grignotage"),
                            CustomTextField(
                              label: "Goûters / collations",
                              controller: _collations,
                            ),
                            CustomTextField(
                              label: "Grignotage (détails)",
                              controller: _grignotage,
                            ),
                            CustomDropdown(
                              label: "Sauter un repas ?",
                              items: ["Jamais", "Parfois", "Souvent"],
                              value: _saute,
                              onChanged: (v) => setState(() => _saute = v),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bloc sensations & préparation
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("🌙 Nuit & Sensations"),
                            CustomTextField(
                              label: "Manger la nuit (moment)",
                              controller: _mangerNuit,
                            ),
                            CustomTextField(
                              label: "Sensations (faim, satiété)",
                              controller: _sensations,
                            ),
                            CustomTextField(
                              label: "Taille des portions (cm)",
                              controller: _tailles,
                              keyboardType: TextInputType.number,
                            ),
                            CustomTextField(
                              label: "Habitudes d’achat",
                              controller: _achats,
                            ),
                            CustomTextField(
                              label: "Préparation repas (Qui, cuisson…)",
                              controller: _preparation,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton suite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      prov.updateRepasHeures(_repasHeures.text);
                      if (_position != null) prov.updatePositionRepas(_position!);
                      if (_compagnie != null) prov.updateCompagnieRepas(_compagnie!);
                      if (_vitesse != null) prov.updateVitesseRepas(_vitesse!);
                      if (_resservir != null) prov.updateResservir(_resservir!);
                      prov.updateCollations(_collations.text);
                      prov.updateGrignotage(_grignotage.text);
                      if (_saute != null) prov.updateSauteRepas(_saute!);
                      prov.updateMangerNuit(_mangerNuit.text);
                      prov.updateSensations(_sensations.text);
                      prov.updateTaillesPortions(_tailles.text);
                      prov.updateAchats(_achats.text);
                      prov.updatePreparation(_preparation.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ConsoScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      elevation: 6,
                    ),
                    child: const Text("Suivant", style: TextStyle(fontSize: 18)),
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
