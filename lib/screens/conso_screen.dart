import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bilan_provider.dart';
import '../widgets/custom_widgets.dart';
import 'antecedents_screen.dart'; // Assure-toi que ce fichier existe et que le chemin est correct

class ConsoScreen extends StatefulWidget {
  const ConsoScreen({Key? key}) : super(key: key);

  @override
  State<ConsoScreen> createState() => _ConsoScreenState();
}

class _ConsoScreenState extends State<ConsoScreen> {
  final _boissons = TextEditingController();
  final _alcool = TextEditingController();
  final _lipides = TextEditingController();
  final _sucres = TextEditingController();
  final _fruits = TextEditingController();

  @override
  void dispose() {
    _boissons.dispose();
    _alcool.dispose();
    _lipides.dispose();
    _sucres.dispose();
    _fruits.dispose();
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
              // Progression (4/4)
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: LinearProgressIndicator(
                  value: 4 / 5,
                  backgroundColor: Colors.white70,
                  valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                  minHeight: 6,
                ),
              ),
              // Titre
              Text(
                'Apports nutritionnels',
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
                            const SectionTitle("🟥 Apports alimentaires"),
                            CustomTextField(
                              label: "Boissons sucrées (quantité/jour)",
                              controller: _boissons,
                            ),
                            CustomTextField(
                              label: "Boissons alcoolisées",
                              controller: _alcool,
                            ),
                            CustomTextField(
                              label: "Aliments riches en lipides (fritures, pâtisseries…)",
                              controller: _lipides,
                            ),
                            CustomTextField(
                              label: "Aliments riches en sucres (confiseries…)",
                              controller: _sucres,
                            ),
                            CustomTextField(
                              label: "Fruits & légumes (portions/jour)",
                              controller: _fruits,
                              keyboardType: TextInputType.number,
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
                      prov.updateBoissonsSucrees(_boissons.text);
                      prov.updateBoissonsAlcool(_alcool.text);
                      prov.updateAlimentsLipides(_lipides.text);
                      prov.updateAlimentsSucres(_sucres.text);
                      prov.updateFruitsLegumes(_fruits.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AntecedentsScreen()),
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
