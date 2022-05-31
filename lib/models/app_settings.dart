class AppSettings {
  static String defaultLanguage = 'en';
  static String defaultVersion = 'x-y';

  static String getPokemonImageUrl(int id) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
