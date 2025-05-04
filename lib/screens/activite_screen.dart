import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bilan_provider.dart';
import '../widgets/custom_widgets.dart';
import 'habitudes_screen.dart';

class ActiviteScreen extends StatefulWidget {
  const ActiviteScreen({Key? key}) : super(key: key);

  @override
  State<ActiviteScreen> createState() => _ActiviteScreenState();
}

class _ActiviteScreenState extends State<ActiviteScreen> {
  final _profession = TextEditingController();
  String? _horaires;
  String? _intensitePro;
  final _activiteDomicile = TextEditingController();
  String? _intensiteDomicile;
  final _loisirs = TextEditingController();
  String? _intensiteLoisirs;
  final _dureeLoisirs = TextEditingController();
  final _frequenceLoisirs = TextEditingController();
  final _tempsTrajet = TextEditingController();
  String? _modeTrajet;
  String? _prefEscalier;
  final _ecranHeures = TextEditingController();
  final _assisHeures = TextEditingController();

  @override
  void dispose() {
    _profession.dispose();
    _activiteDomicile.dispose();
    _loisirs.dispose();
    _dureeLoisirs.dispose();
    _frequenceLoisirs.dispose();
    _tempsTrajet.dispose();
    _ecranHeures.dispose();
    _assisHeures.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BilanProvider>(context, listen: false);

    return Scaffold(
      // Dégradé doux en fond
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
                  value: 2 / 5,
                  backgroundColor: Colors.white70,
                  valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  minHeight: 6,
                ),
              ),

              // Titre avec style
              Text(
                'Activité & Sédentarité',
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
                    // Bloc Activité physique
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("🟨 Activité physique"),
                            CustomTextField(
                              label: "Profession principale",
                              controller: _profession,
                            ),
                            const SizedBox(height: 12),
                            const Text("Horaires"),
                            Wrap(
                              spacing: 8,
                              children: ["Normaux", "Décalés"]
                                  .map((e) => ChoiceChip(
                                        label: Text(e),
                                        selected: _horaires == e,
                                        selectedColor: Colors.deepOrange,
                                        onSelected: (_) => setState(() => _horaires = e),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 12),
                            CustomDropdown(
                              label: "Intensité activité pro",
                              items: ["Faible", "Modérée", "Élevée"],
                              value: _intensitePro,
                              onChanged: (v) => setState(() => _intensitePro = v),
                            ),
                            const SizedBox(height: 12),
                            CustomTextField(
                              label: "Activités domestiques",
                              controller: _activiteDomicile,
                            ),
                            CustomDropdown(
                              label: "Intensité domestique",
                              items: ["Faible", "Modérée", "Élevée"],
                              value: _intensiteDomicile,
                              onChanged: (v) => setState(() => _intensiteDomicile = v),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bloc Loisirs & sports
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("⚽ Loisirs & Sports"),
                            CustomTextField(
                              label: "Loisirs / sports",
                              controller: _loisirs,
                            ),
                            CustomDropdown(
                              label: "Intensité loisirs",
                              items: ["Faible", "Modérée", "Élevée"],
                              value: _intensiteLoisirs,
                              onChanged: (v) => setState(() => _intensiteLoisirs = v),
                            ),
                            CustomTextField(
                              label: "Durée session (min)",
                              controller: _dureeLoisirs,
                              keyboardType: TextInputType.number,
                            ),
                            CustomTextField(
                              label: "Fréquence (session/an)",
                              controller: _frequenceLoisirs,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bloc Déplacements & sédentarité
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle("🚗 Déplacements"),
                            CustomTextField(
                              label: "Temps trajet (h/j)",
                              controller: _tempsTrajet,
                            ),
                            CustomDropdown(
                              label: "Mode de trajet",
                              items: ["Marche", "Vélo", "Voiture", "Transport"],
                              value: _modeTrajet,
                              onChanged: (v) => setState(() => _modeTrajet = v),
                            ),
                            const SizedBox(height: 12),
                            const Text("Escaliers vs ascenseur"),
                            Wrap(
                              spacing: 8,
                              children: ["Escaliers", "Ascenseur"]
                                  .map((e) => ChoiceChip(
                                        label: Text(e),
                                        selected: _prefEscalier == e,
                                        selectedColor: Colors.deepOrange,
                                        onSelected: (_) => setState(() => _prefEscalier = e),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 16),
                            const SectionTitle("🪑 Sédentarité"),
                            CustomTextField(
                              label: "Écran (h/j)",
                              controller: _ecranHeures,
                              keyboardType: TextInputType.number,
                            ),
                            CustomTextField(
                              label: "Position assise (h/j)",
                              controller: _assisHeures,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton Suivant
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      prov.updateProfession(_profession.text);
                      if (_horaires != null) prov.updateHoraires(_horaires!);
                      if (_intensitePro != null) prov.updateIntensitePro(_intensitePro!);
                      prov.updateActiviteDomicile(_activiteDomicile.text);
                      if (_intensiteDomicile != null) prov.updateIntensiteDomicile(_intensiteDomicile!);
                      prov.updateLoisirs(_loisirs.text);
                      if (_intensiteLoisirs != null) prov.updateIntensiteLoisirs(_intensiteLoisirs!);
                      prov.updateDureeLoisirs(_dureeLoisirs.text);
                      prov.updateFrequenceLoisirs(_frequenceLoisirs.text);
                      prov.updateTempsTrajet(_tempsTrajet.text);
                      if (_modeTrajet != null) prov.updateModeTrajet(_modeTrajet!);
                      if (_prefEscalier != null) prov.updatePrefEscalier(_prefEscalier!);
                      prov.updateEcranHeures(_ecranHeures.text);
                      prov.updateAssisHeures(_assisHeures.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HabitudesScreen()),
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
