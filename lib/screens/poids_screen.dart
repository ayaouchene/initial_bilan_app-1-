import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bilan_provider.dart';
import 'activite_screen.dart';
import '../widgets/custom_widgets.dart';

class PoidsScreen extends StatefulWidget {
  const PoidsScreen({Key? key}) : super(key: key);
  @override
  State<PoidsScreen> createState() => _PoidsScreenState();
}

class _PoidsScreenState extends State<PoidsScreen> {
  String? _periode;
  final _circonstances = TextEditingController();
  final _poidsMin = TextEditingController();
  final _poidsMax = TextEditingController();
  final _variations = TextEditingController();
  final _regimes = TextEditingController();
  final _rechutes = TextEditingController();
  final _poidsForme = TextEditingController();

  @override
  void dispose() {
    _circonstances.dispose();
    _poidsMin.dispose();
    _poidsMax.dispose();
    _variations.dispose();
    _regimes.dispose();
    _rechutes.dispose();
    _poidsForme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<BilanProvider>(context, listen: false);

    return Scaffold(
      // Fond léger en dégradé
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF6FF), Color(0xFFFAF3E0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Barre de progression
              LinearProgressIndicator(
                value: 1 / 5,
                backgroundColor: Colors.white70,
                valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                minHeight: 6,
              ),

              // Titre de page
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Historique pondéral',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade700,
                    shadows: const [
                      Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.orangeAccent),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  children: [
                    const SectionTitle("Âge de début de la prise de poids"),
                    Wrap(
                      spacing: 12,
                      children: ["Enfance", "Adolescence", "Adulte"].map((e) {
                        final selected = _periode == e;
                        return ChoiceChip(
                          label: Text(e,
                              style: TextStyle(
                                  color: selected ? Colors.white : Colors.deepOrange)),
                          selected: selected,
                          selectedColor: Colors.deepOrange,
                          backgroundColor: Colors.white,
                          elevation: 4,
                          onSelected: (_) => setState(() => _periode = e),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            CustomTextField(
                              label: "Circonstances déclenchantes",
                              controller: _circonstances,
                            ),
                            CustomTextField(
                              label: "Poids le plus bas (kg)",
                              controller: _poidsMin,
                              keyboardType: TextInputType.number,
                            ),
                            CustomTextField(
                              label: "Poids le plus haut (kg)",
                              controller: _poidsMax,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    CustomTextField(
                      label: "Variations récentes (gain/perte, détails)",
                      controller: _variations,
                    ),
                    CustomTextField(
                      label: "Régimes suivis (passés/actuels)",
                      controller: _regimes,
                    ),
                    CustomTextField(
                      label: "Rechutes/récidives & contexte",
                      controller: _rechutes,
                    ),
                    CustomTextField(
                      label: "Poids de forme (kg)",
                      controller: _poidsForme,
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 32),
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
                    onPressed: _periode == null ? null : () {
                      prov.updatePeriode(_periode!);
                      prov.updateCirconstances(_circonstances.text);
                      prov.updatePoidsMin(_poidsMin.text);
                      prov.updatePoidsMax(_poidsMax.text);
                      prov.updateVariations(_variations.text);
                      prov.updateRegimes(_regimes.text);
                      prov.updateRechutes(_rechutes.text);
                      prov.updatePoidsForme(_poidsForme.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ActiviteScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                      elevation: 6,
                    ),
                    child: const Text("Suivant",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
