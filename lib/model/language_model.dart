class LanguageModel {
  String language;
  String lang;
  String sd;
  

  LanguageModel(
    this.language,
    this.lang,
    this.sd,
   
  );
}

List<LanguageModel> selectLanguage = [
  LanguageModel(
    "ภาษาไทย",
    "ไทย",
    "th",
  ),
  LanguageModel(
    "English",
    "Eng",
    "en",
  ),
];