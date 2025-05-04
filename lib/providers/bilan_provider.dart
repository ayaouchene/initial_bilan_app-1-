import 'package:flutter/material.dart';
import 'package:initial_bilan_app/models/bilan_model.dart';

class BilanProvider with ChangeNotifier {
  BilanModel _bilan = BilanModel(consoAliments: {});


  BilanModel get bilan => _bilan;

  // === Parcours pondéral ===
  void updatePeriode(String v)        { _bilan.periode = v; notifyListeners(); }
  void updateCirconstances(String v)  { _bilan.circonstances = v; notifyListeners(); }
  void updatePoidsMin(String v)       { _bilan.poidsMin = v; notifyListeners(); }
  void updatePoidsMax(String v)       { _bilan.poidsMax = v; notifyListeners(); }
  void updateVariations(String v)     { _bilan.variations = v; notifyListeners(); }
  void updateRegimes(String v)        { _bilan.regimes = v; notifyListeners(); }
  void updateRechutes(String v)       { _bilan.rechutes = v; notifyListeners(); }
  void updatePoidsForme(String v)     { _bilan.poidsForme = v; notifyListeners(); }

  // === Activité & sédentarité ===
  void updateProfession(String v)        { _bilan.profession = v; notifyListeners(); }
  void updateHoraires(String v)          { _bilan.horaires = v; notifyListeners(); }
  void updateIntensitePro(String v)      { _bilan.intensitePro = v; notifyListeners(); }
  void updateActiviteDomicile(String v)  { _bilan.activiteDomicile = v; notifyListeners(); }
  void updateIntensiteDomicile(String v) { _bilan.intensiteDomicile = v; notifyListeners(); }
  void updateLoisirs(String v)           { _bilan.loisirs = v; notifyListeners(); }
  void updateIntensiteLoisirs(String v)  { _bilan.intensiteLoisirs = v; notifyListeners(); }
  void updateDureeLoisirs(String v)      { _bilan.dureeLoisirs = v; notifyListeners(); }
  void updateFrequenceLoisirs(String v)  { _bilan.frequenceLoisirs = v; notifyListeners(); }
  void updateTempsTrajet(String v)       { _bilan.tempsTrajet = v; notifyListeners(); }
  void updateModeTrajet(String v)        { _bilan.modeTrajet = v; notifyListeners(); }
  void updatePrefEscalier(String v)      { _bilan.prefEscalier = v; notifyListeners(); }
  void updateEcranHeures(String v)       { _bilan.ecranHeures = v; notifyListeners(); }
  void updateAssisHeures(String v)       { _bilan.assisHeures = v; notifyListeners(); }

  // === Habitudes alimentaires ===
  void updateRepasHeures(String v)       { _bilan.repasHeures = v; notifyListeners(); }
  void updatePositionRepas(String v)     { _bilan.positionRepas = v; notifyListeners(); }
  void updateCompagnieRepas(String v)    { _bilan.compagnieRepas = v; notifyListeners(); }
  void updateVitesseRepas(String v)      { _bilan.vitesseRepas = v; notifyListeners(); }
  void updateResservir(String v)         { _bilan.resservir = v; notifyListeners(); }
  void updateCollations(String v)        { _bilan.collations = v; notifyListeners(); }
  void updateGrignotage(String v)        { _bilan.grignotage = v; notifyListeners(); }
  void updateSauteRepas(String v)        { _bilan.sauteRepas = v; notifyListeners(); }
  void updateMangerNuit(String v)        { _bilan.mangerNuit = v; notifyListeners(); }
  void updateSensations(String v)        { _bilan.sensations = v; notifyListeners(); }
  void updateTaillesPortions(String v)   { _bilan.taillesPortions = v; notifyListeners(); }
  void updateAchats(String v)            { _bilan.achats = v; notifyListeners(); }
  void updatePreparation(String v)       { _bilan.preparation = v; notifyListeners(); }

  // === Apports nutritionnels ===
  void updateBoissonsSucrees(String v)   { _bilan.boissonsSucrees = v; notifyListeners(); }
  void updateBoissonsAlcool(String v)    { _bilan.boissonsAlcool = v; notifyListeners(); }
  void updateAlimentsLipides(String v)   { _bilan.alimentsLipides = v; notifyListeners(); }
  void updateAlimentsSucres(String v)    { _bilan.alimentsSucres = v; notifyListeners(); }
  void updateFruitsLegumes(String v)     { _bilan.fruitsLegumes = v; notifyListeners(); }

  // === Antécédents médicaux et familiaux ===
String _antecedentsMedicaux = '';
String _antecedentsFamiliaux = '';
String _medicaments = '';
String _chirurgies = '';

void updateAntecedentsMedicaux(String v)   { _antecedentsMedicaux = v; notifyListeners(); }
void updateAntecedentsFamiliaux(String v)  { _antecedentsFamiliaux = v; notifyListeners(); }
void updateMedicaments(String v)           { _medicaments = v; notifyListeners(); }
void updateChirurgies(String v)            { _chirurgies = v; notifyListeners(); }

String get antecedentsMedicaux    => _antecedentsMedicaux;
String get antecedentsFamiliaux   => _antecedentsFamiliaux;
String get medicaments            => _medicaments;
String get chirurgies             => _chirurgies;

}
