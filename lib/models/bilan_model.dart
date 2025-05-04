class BilanModel {
  String? activite;
  String? habitudesRepas;
  int? frequenceSnacking;
  Map<String, String> consoAliments;
   // Parcours pondéral
  String? periode;
  String? circonstances;
  String? poidsMin;
  String? poidsMax;
  String? variations;
  String? regimes;
  String? rechutes;
  String? poidsForme;

  // Activité & sédentarité
  String? profession;
  String? horaires;
  String? intensitePro;
  String? activiteDomicile;
  String? intensiteDomicile;
  String? loisirs;
  String? intensiteLoisirs;
  String? dureeLoisirs;
  String? frequenceLoisirs;
  String? tempsTrajet;
  String? modeTrajet;
  String? prefEscalier;
  String? ecranHeures;
  String? assisHeures;

  // Habitudes alimentaires
  String? repasHeures;
  String? positionRepas;
  String? compagnieRepas;
  String? vitesseRepas;
  String? resservir;
  String? collations;
  String? grignotage;
  String? sauteRepas;
  String? mangerNuit;
  String? sensations;
  String? taillesPortions;
  String? achats;
  String? preparation;

  // Apports nutritionnels
  String? boissonsSucrees;
  String? boissonsAlcool;
  String? alimentsLipides;
  String? alimentsSucres;
  String? fruitsLegumes;


  BilanModel({
    this.activite,
    this.habitudesRepas,
    this.frequenceSnacking,
    required this.consoAliments,
  });
}

