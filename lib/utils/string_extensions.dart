import 'package:flutter_pokedex/models/app_settings.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';

extension StringExtension on String {
  String toTitle() {
    var splits = split(" ");
    for (var i = 0; i < splits.length; i++) {
      splits[i] =
          "${splits[i][0].toUpperCase()}${splits[i].substring(1).toLowerCase()}";
    }
    return splits.join(" ");
  }

  String removeNewLine() {
    return replaceAll("\n", " ");
  }
}

int getIdFromUrl(String url) {
  var splits = url.split("/");
  var value = int.tryParse(splits[6]);
  if (value == null) {
    return 0;
  }
  return value;
}

T getValueForNull<T>(T data, T returnValue) {
  if (data == null) {
    return returnValue;
  }
  return data;
}

String getAbilityFlavotText(List<AbilityFlavorText> ability) {
  return ability
      .firstWhere((element) =>
          (element.language!.name == AppSettings.defaultLanguage &&
              element.versionGroup!.name == AppSettings.defaultVersion))
      .flavorText!
      .removeNewLine();
}

String getMoveFlavotText(List<MoveFlavorText> move) {
  return move
      .firstWhere((element) =>
          (element.language!.name == AppSettings.defaultLanguage &&
              element.versionGroup!.name == AppSettings.defaultVersion))
      .flavorText!
      .removeNewLine();
}

String getVerboseShortEffectText(List<VerboseEffect> effect) {
  return effect
      .firstWhere(
          (element) => (element.language!.name == AppSettings.defaultLanguage))
      .shortEffect!
      .removeNewLine();
}

String getVerboseEffectText(List<VerboseEffect> effect) {
  return effect
      .firstWhere(
          (element) => (element.language!.name == AppSettings.defaultLanguage))
      .effect!
      .removeNewLine();
}

String getStringFromName(String name) {
  name = name.replaceAll("-", " ");
  return name.toTitle();
}

String getName(List<Name> names) {
  return names
      .firstWhere(
          (element) => element.language!.name == AppSettings.defaultLanguage)
      .name!;
}

String getGenus(List<Genus> genus) {
  return genus
      .firstWhere(
          (element) => element.language!.name == AppSettings.defaultLanguage)
      .genus!;
}

String getPokemonIdString(int id) {
  return "#" + "$id".padLeft(3, '0');
}
