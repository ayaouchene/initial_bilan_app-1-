import 'package:flutter/material.dart';

// Titre de section
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      );
}

// Champ texte standard
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines; // ✅ ajout du paramètre maxLines

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1, // ✅ valeur par défaut
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines, // ✅ utilisation ici
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
      );
}

// Dropdown simple
class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      );
}
