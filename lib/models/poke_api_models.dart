class Endpoint {
  String? name;
  String? desc;
  String? url;
  String? type;

  Endpoint({
    this.name,
    this.desc,
    this.url,
    this.type,
  });

  Endpoint.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['desc'] != null) {
      desc = json['desc'];
    }
    if (json['url'] != null) {
      url = json['url'];
    }
    if (json['type'] != null) {
      type = json['type'];
    }
  }
}

class Endpoints {
  List<Endpoint>? endpoints;

  Endpoints({
    this.endpoints,
  });

  Endpoints.fromJson(Map<String, dynamic> json) {
    if (json['endpoints'] != null) {
      endpoints = <Endpoint>[];
      json['endpoints'].forEach((v) {
        endpoints!.add(Endpoint.fromJson(v));
      });
    }
  }
}

class NamedAPIResourceList {
  int? count;
  String? next;
  String? previous;
  List<NamedAPIResource>? results;

  NamedAPIResourceList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  NamedAPIResourceList.fromJson(Map<String, dynamic> json) {
    if (json['count'] != null) {
      count = json['count'];
    }
    if (json['next'] != null) {
      next = json['next'];
    }
    if (json['previous'] != null) {
      previous = json['previous'];
    }
    if (json['results'] != null) {
      results = <NamedAPIResource>[];
      json['results'].forEach((v) {
        results!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Berry {
  int? id;
  String? name;
  int? growthTime;
  int? maxHarvest;
  int? naturalGiftPower;
  int? size;
  int? smoothness;
  int? soilDryness;
  NamedAPIResource? firmness;
  List<BerryFlavorMap>? flavors;
  NamedAPIResource? item;
  NamedAPIResource? naturalGiftType;

  Berry({
    this.id,
    this.name,
    this.growthTime,
    this.maxHarvest,
    this.naturalGiftPower,
    this.size,
    this.smoothness,
    this.soilDryness,
    this.firmness,
    this.flavors,
    this.item,
    this.naturalGiftType,
  });

  Berry.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['growth_time'] != null) {
      growthTime = json['growth_time'];
    }
    if (json['max_harvest'] != null) {
      maxHarvest = json['max_harvest'];
    }
    if (json['natural_gift_power'] != null) {
      naturalGiftPower = json['natural_gift_power'];
    }
    if (json['size'] != null) {
      size = json['size'];
    }
    if (json['smoothness'] != null) {
      smoothness = json['smoothness'];
    }
    if (json['soil_dryness'] != null) {
      soilDryness = json['soil_dryness'];
    }
    if (json['firmness'] != null) {
      firmness = NamedAPIResource.fromJson(json['firmness']);
    }
    if (json['flavors'] != null) {
      flavors = <BerryFlavorMap>[];
      json['flavors'].forEach((v) {
        flavors!.add(BerryFlavorMap.fromJson(v));
      });
    }
    if (json['item'] != null) {
      item = NamedAPIResource.fromJson(json['item']);
    }
    if (json['natural_gift_type'] != null) {
      naturalGiftType = NamedAPIResource.fromJson(json['natural_gift_type']);
    }
  }
}

class BerryFlavorMap {
  int? potency;
  NamedAPIResource? flavor;

  BerryFlavorMap({
    this.potency,
    this.flavor,
  });

  BerryFlavorMap.fromJson(Map<String, dynamic> json) {
    if (json['potency'] != null) {
      potency = json['potency'];
    }
    if (json['flavor'] != null) {
      flavor = NamedAPIResource.fromJson(json['flavor']);
    }
  }
}

class BerryFirmness {
  int? id;
  String? name;
  List<NamedAPIResource>? berries;
  List<Name>? names;

  BerryFirmness({
    this.id,
    this.name,
    this.berries,
    this.names,
  });

  BerryFirmness.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['berries'] != null) {
      berries = <NamedAPIResource>[];
      json['berries'].forEach((v) {
        berries!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class BerryFlavor {
  int? id;
  String? name;
  List<FlavorBerryMap>? berries;
  NamedAPIResource? contestType;
  List<Name>? names;

  BerryFlavor({
    this.id,
    this.name,
    this.berries,
    this.contestType,
    this.names,
  });

  BerryFlavor.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['berries'] != null) {
      berries = <FlavorBerryMap>[];
      json['berries'].forEach((v) {
        berries!.add(FlavorBerryMap.fromJson(v));
      });
    }
    if (json['contest_type'] != null) {
      contestType = NamedAPIResource.fromJson(json['contest_type']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class FlavorBerryMap {
  int? potency;
  NamedAPIResource? berry;

  FlavorBerryMap({
    this.potency,
    this.berry,
  });

  FlavorBerryMap.fromJson(Map<String, dynamic> json) {
    if (json['potency'] != null) {
      potency = json['potency'];
    }
    if (json['berry'] != null) {
      berry = NamedAPIResource.fromJson(json['berry']);
    }
  }
}

class ContestType {
  int? id;
  String? name;
  NamedAPIResource? berryFlavor;
  List<ContestName>? names;

  ContestType({
    this.id,
    this.name,
    this.berryFlavor,
    this.names,
  });

  ContestType.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['berry_flavor'] != null) {
      berryFlavor = NamedAPIResource.fromJson(json['berry_flavor']);
    }
    if (json['names'] != null) {
      names = <ContestName>[];
      json['names'].forEach((v) {
        names!.add(ContestName.fromJson(v));
      });
    }
  }
}

class ContestName {
  String? name;
  String? color;
  NamedAPIResource? language;

  ContestName({
    this.name,
    this.color,
    this.language,
  });

  ContestName.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['color'] != null) {
      color = json['color'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class ContestEffect {
  int? id;
  int? appeal;
  int? jam;
  List<Effect>? effectEntries;
  List<FlavorText>? flavorTextEntries;

  ContestEffect({
    this.id,
    this.appeal,
    this.jam,
    this.effectEntries,
    this.flavorTextEntries,
  });

  ContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['appeal'] != null) {
      appeal = json['appeal'];
    }
    if (json['jam'] != null) {
      jam = json['jam'];
    }
    if (json['effect_entries'] != null) {
      effectEntries = <Effect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(Effect.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorText.fromJson(v));
      });
    }
  }
}

class SuperContestEffect {
  int? id;
  int? appeal;
  List<FlavorText>? flavorTextEntries;
  List<NamedAPIResource>? moves;

  SuperContestEffect({
    this.id,
    this.appeal,
    this.flavorTextEntries,
    this.moves,
  });

  SuperContestEffect.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['appeal'] != null) {
      appeal = json['appeal'];
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorText.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class EncounterMethod {
  int? id;
  String? name;
  int? order;
  List<Name>? names;

  EncounterMethod({
    this.id,
    this.name,
    this.order,
    this.names,
  });

  EncounterMethod.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['order'] != null) {
      order = json['order'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class EncounterCondition {
  int? id;
  String? name;
  List<Name>? names;
  List<NamedAPIResource>? values;

  EncounterCondition({
    this.id,
    this.name,
    this.names,
    this.values,
  });

  EncounterCondition.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['values'] != null) {
      values = <NamedAPIResource>[];
      json['values'].forEach((v) {
        values!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class EncounterConditionValue {
  int? id;
  String? name;
  NamedAPIResource? condition;
  List<Name>? names;

  EncounterConditionValue({
    this.id,
    this.name,
    this.condition,
    this.names,
  });

  EncounterConditionValue.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['condition'] != null) {
      condition = NamedAPIResource.fromJson(json['condition']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class EvolutionChain {
  int? id;
  NamedAPIResource? babyTriggerItem;
  ChainLink? chain;

  EvolutionChain({
    this.id,
    this.babyTriggerItem,
    this.chain,
  });

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['baby_trigger_item'] != null) {
      babyTriggerItem = NamedAPIResource.fromJson(json['baby_trigger_item']);
    }
    if (json['chain'] != null) {
      chain = ChainLink.fromJson(json['chain']);
    }
  }
}

class ChainLink {
  bool? isBaby;
  NamedAPIResource? species;
  List<EvolutionDetail>? evolutionDetails;
  List<ChainLink>? evolvesTo;

  ChainLink({
    this.isBaby,
    this.species,
    this.evolutionDetails,
    this.evolvesTo,
  });

  ChainLink.fromJson(Map<String, dynamic> json) {
    if (json['is_baby'] != null) {
      isBaby = json['is_baby'];
    }
    if (json['species'] != null) {
      species = NamedAPIResource.fromJson(json['species']);
    }
    if (json['evolution_details'] != null) {
      evolutionDetails = <EvolutionDetail>[];
      json['evolution_details'].forEach((v) {
        evolutionDetails!.add(EvolutionDetail.fromJson(v));
      });
    }
    if (json['evolves_to'] != null) {
      evolvesTo = <ChainLink>[];
      json['evolves_to'].forEach((v) {
        evolvesTo!.add(ChainLink.fromJson(v));
      });
    }
  }
}

class EvolutionDetail {
  NamedAPIResource? item;
  NamedAPIResource? trigger;
  int? gender;
  NamedAPIResource? heldItem;
  NamedAPIResource? knownMove;
  NamedAPIResource? knownMoveType;
  NamedAPIResource? location;
  int? minLevel;
  int? minHappiness;
  int? minBeauty;
  int? minAffection;
  bool? needsOverworldRain;
  NamedAPIResource? partySpecies;
  NamedAPIResource? partyType;
  int? relativePhysicalStats;
  String? timeOfDay;
  NamedAPIResource? tradeSpecies;
  bool? turnUpsideDown;

  EvolutionDetail({
    this.item,
    this.trigger,
    this.gender,
    this.heldItem,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minLevel,
    this.minHappiness,
    this.minBeauty,
    this.minAffection,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.turnUpsideDown,
  });

  EvolutionDetail.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = NamedAPIResource.fromJson(json['item']);
    }
    if (json['trigger'] != null) {
      trigger = NamedAPIResource.fromJson(json['trigger']);
    }
    if (json['gender'] != null) {
      gender = json['gender'];
    }
    if (json['held_item'] != null) {
      heldItem = NamedAPIResource.fromJson(json['held_item']);
    }
    if (json['known_move'] != null) {
      knownMove = NamedAPIResource.fromJson(json['known_move']);
    }
    if (json['known_move_type'] != null) {
      knownMoveType = NamedAPIResource.fromJson(json['known_move_type']);
    }
    if (json['location'] != null) {
      location = NamedAPIResource.fromJson(json['location']);
    }
    if (json['min_level'] != null) {
      minLevel = json['min_level'];
    }
    if (json['min_happiness'] != null) {
      minHappiness = json['min_happiness'];
    }
    if (json['min_beauty'] != null) {
      minBeauty = json['min_beauty'];
    }
    if (json['min_affection'] != null) {
      minAffection = json['min_affection'];
    }
    if (json['needs_overworld_rain'] != null) {
      needsOverworldRain = json['needs_overworld_rain'];
    }
    if (json['party_species'] != null) {
      partySpecies = NamedAPIResource.fromJson(json['party_species']);
    }
    if (json['party_type'] != null) {
      partyType = NamedAPIResource.fromJson(json['party_type']);
    }
    if (json['relative_physical_stats'] != null) {
      relativePhysicalStats = json['relative_physical_stats'];
    }
    if (json['time_of_day'] != null) {
      timeOfDay = json['time_of_day'];
    }
    if (json['trade_species'] != null) {
      tradeSpecies = NamedAPIResource.fromJson(json['trade_species']);
    }
    if (json['turn_upside_down'] != null) {
      turnUpsideDown = json['turn_upside_down'];
    }
  }
}

class EvolutionTrigger {
  int? id;
  String? name;
  List<Name>? names;
  List<NamedAPIResource>? pokemonSpecies;

  EvolutionTrigger({
    this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  EvolutionTrigger.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Generation {
  int? id;
  String? name;
  List<NamedAPIResource>? abilities;
  List<Name>? names;
  NamedAPIResource? mainRegion;
  List<NamedAPIResource>? moves;
  List<NamedAPIResource>? pokemonSpecies;
  List<NamedAPIResource>? types;
  List<NamedAPIResource>? versionGroups;

  Generation({
    this.id,
    this.name,
    this.abilities,
    this.names,
    this.mainRegion,
    this.moves,
    this.pokemonSpecies,
    this.types,
    this.versionGroups,
  });

  Generation.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['abilities'] != null) {
      abilities = <NamedAPIResource>[];
      json['abilities'].forEach((v) {
        abilities!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['main_region'] != null) {
      mainRegion = NamedAPIResource.fromJson(json['main_region']);
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <NamedAPIResource>[];
      json['types'].forEach((v) {
        types!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      json['version_groups'].forEach((v) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Pokedex {
  int? id;
  String? name;
  bool? isMainSeries;
  List<Description>? descriptions;
  List<Name>? names;
  List<PokemonEntry>? pokemonEntries;
  NamedAPIResource? region;
  List<NamedAPIResource>? versionGroups;

  Pokedex({
    this.id,
    this.name,
    this.isMainSeries,
    this.descriptions,
    this.names,
    this.pokemonEntries,
    this.region,
    this.versionGroups,
  });

  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['is_main_series'] != null) {
      isMainSeries = json['is_main_series'];
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_entries'] != null) {
      pokemonEntries = <PokemonEntry>[];
      json['pokemon_entries'].forEach((v) {
        pokemonEntries!.add(PokemonEntry.fromJson(v));
      });
    }
    if (json['region'] != null) {
      region = NamedAPIResource.fromJson(json['region']);
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      json['version_groups'].forEach((v) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class PokemonEntry {
  int? entryNumber;
  NamedAPIResource? pokemonSpecies;

  PokemonEntry({
    this.entryNumber,
    this.pokemonSpecies,
  });

  PokemonEntry.fromJson(Map<String, dynamic> json) {
    if (json['entry_number'] != null) {
      entryNumber = json['entry_number'];
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = NamedAPIResource.fromJson(json['pokemon_species']);
    }
  }
}

class Version {
  int? id;
  String? name;
  List<Name>? names;
  NamedAPIResource? versionGroup;

  Version({
    this.id,
    this.name,
    this.names,
    this.versionGroup,
  });

  Version.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class VersionGroup {
  int? id;
  String? name;
  int? order;
  NamedAPIResource? generation;
  List<NamedAPIResource>? moveLearnMethods;
  List<NamedAPIResource>? pokedexes;
  List<NamedAPIResource>? regions;
  List<NamedAPIResource>? versions;

  VersionGroup({
    this.id,
    this.name,
    this.order,
    this.generation,
    this.moveLearnMethods,
    this.pokedexes,
    this.regions,
    this.versions,
  });

  VersionGroup.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['order'] != null) {
      order = json['order'];
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['move_learn_methods'] != null) {
      moveLearnMethods = <NamedAPIResource>[];
      json['move_learn_methods'].forEach((v) {
        moveLearnMethods!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['pokedexes'] != null) {
      pokedexes = <NamedAPIResource>[];
      json['pokedexes'].forEach((v) {
        pokedexes!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['regions'] != null) {
      regions = <NamedAPIResource>[];
      json['regions'].forEach((v) {
        regions!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['versions'] != null) {
      versions = <NamedAPIResource>[];
      json['versions'].forEach((v) {
        versions!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Item {
  int? id;
  String? name;
  int? cost;
  int? flingPower;
  NamedAPIResource? flingEffect;
  List<NamedAPIResource>? attributes;
  NamedAPIResource? category;
  List<VerboseEffect>? effectEntries;
  List<VersionGroupFlavorText>? flavorTextEntries;
  List<GenerationGameIndex>? gameIndices;
  List<Name>? names;
  ItemSprites? sprites;
  List<ItemHolderPokemon>? heldByPokemon;
  APIResource? babyTriggerFor;
  List<MachineVersionDetail>? machines;

  Item({
    this.id,
    this.name,
    this.cost,
    this.flingPower,
    this.flingEffect,
    this.attributes,
    this.category,
    this.effectEntries,
    this.flavorTextEntries,
    this.gameIndices,
    this.names,
    this.sprites,
    this.heldByPokemon,
    this.babyTriggerFor,
    this.machines,
  });

  Item.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['cost'] != null) {
      cost = json['cost'];
    }
    if (json['fling_power'] != null) {
      flingPower = json['fling_power'];
    }
    if (json['fling_effect'] != null) {
      flingEffect = NamedAPIResource.fromJson(json['fling_effect']);
    }
    if (json['attributes'] != null) {
      attributes = <NamedAPIResource>[];
      json['attributes'].forEach((v) {
        attributes!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = NamedAPIResource.fromJson(json['category']);
    }
    if (json['effect_entries'] != null) {
      effectEntries = <VerboseEffect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(VerboseEffect.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <VersionGroupFlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(VersionGroupFlavorText.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GenerationGameIndex>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GenerationGameIndex.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['sprites'] != null) {
      sprites = ItemSprites.fromJson(json['sprites']);
    }
    if (json['held_by_pokemon'] != null) {
      heldByPokemon = <ItemHolderPokemon>[];
      json['held_by_pokemon'].forEach((v) {
        heldByPokemon!.add(ItemHolderPokemon.fromJson(v));
      });
    }
    if (json['baby_trigger_for'] != null) {
      babyTriggerFor = APIResource.fromJson(json['baby_trigger_for']);
    }
    if (json['machines'] != null) {
      machines = <MachineVersionDetail>[];
      json['machines'].forEach((v) {
        machines!.add(MachineVersionDetail.fromJson(v));
      });
    }
  }
}

class ItemSprites {
  String? default_;

  ItemSprites({
    this.default_,
  });

  ItemSprites.fromJson(Map<String, dynamic> json) {
    if (json['default'] != null) {
      default_ = json['default'];
    }
  }
}

class ItemHolderPokemon {
  NamedAPIResource? pokemon;
  List<ItemHolderPokemonVersionDetail>? versionDetails;

  ItemHolderPokemon({
    this.pokemon,
    this.versionDetails,
  });

  ItemHolderPokemon.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
    if (json['version_details'] != null) {
      versionDetails = <ItemHolderPokemonVersionDetail>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(ItemHolderPokemonVersionDetail.fromJson(v));
      });
    }
  }
}

class ItemHolderPokemonVersionDetail {
  int? rarity;
  NamedAPIResource? version;

  ItemHolderPokemonVersionDetail({
    this.rarity,
    this.version,
  });

  ItemHolderPokemonVersionDetail.fromJson(Map<String, dynamic> json) {
    if (json['rarity'] != null) {
      rarity = json['rarity'];
    }
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
  }
}

class ItemAttribute {
  int? id;
  String? name;
  List<NamedAPIResource>? items;
  List<Name>? names;
  List<Description>? descriptions;

  ItemAttribute({
    this.id,
    this.name,
    this.items,
    this.names,
    this.descriptions,
  });

  ItemAttribute.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
  }
}

class ItemCategory {
  int? id;
  String? name;
  List<NamedAPIResource>? items;
  List<Name>? names;
  NamedAPIResource? pocket;

  ItemCategory({
    this.id,
    this.name,
    this.items,
    this.names,
    this.pocket,
  });

  ItemCategory.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pocket'] != null) {
      pocket = NamedAPIResource.fromJson(json['pocket']);
    }
  }
}

class ItemFlingEffect {
  int? id;
  String? name;
  List<Effect>? effectEntries;
  List<NamedAPIResource>? items;

  ItemFlingEffect({
    this.id,
    this.name,
    this.effectEntries,
    this.items,
  });

  ItemFlingEffect.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['effect_entries'] != null) {
      effectEntries = <Effect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(Effect.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <NamedAPIResource>[];
      json['items'].forEach((v) {
        items!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class ItemPocket {
  int? id;
  String? name;
  List<NamedAPIResource>? categories;
  List<Name>? names;

  ItemPocket({
    this.id,
    this.name,
    this.categories,
    this.names,
  });

  ItemPocket.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['categories'] != null) {
      categories = <NamedAPIResource>[];
      json['categories'].forEach((v) {
        categories!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class Location {
  int? id;
  String? name;
  NamedAPIResource? region;
  List<Name>? names;
  List<GenerationGameIndex>? gameIndices;
  List<NamedAPIResource>? areas;

  Location({
    this.id,
    this.name,
    this.region,
    this.names,
    this.gameIndices,
    this.areas,
  });

  Location.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['region'] != null) {
      region = NamedAPIResource.fromJson(json['region']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GenerationGameIndex>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GenerationGameIndex.fromJson(v));
      });
    }
    if (json['areas'] != null) {
      areas = <NamedAPIResource>[];
      json['areas'].forEach((v) {
        areas!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class LocationArea {
  int? id;
  String? name;
  int? gameIndex;
  List<EncounterMethodRate>? encounterMethodRates;
  NamedAPIResource? location;
  List<Name>? names;
  List<PokemonEncounter>? pokemonEncounters;

  LocationArea({
    this.id,
    this.name,
    this.gameIndex,
    this.encounterMethodRates,
    this.location,
    this.names,
    this.pokemonEncounters,
  });

  LocationArea.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['game_index'] != null) {
      gameIndex = json['game_index'];
    }
    if (json['encounter_method_rates'] != null) {
      encounterMethodRates = <EncounterMethodRate>[];
      json['encounter_method_rates'].forEach((v) {
        encounterMethodRates!.add(EncounterMethodRate.fromJson(v));
      });
    }
    if (json['location'] != null) {
      location = NamedAPIResource.fromJson(json['location']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_encounters'] != null) {
      pokemonEncounters = <PokemonEncounter>[];
      json['pokemon_encounters'].forEach((v) {
        pokemonEncounters!.add(PokemonEncounter.fromJson(v));
      });
    }
  }
}

class EncounterMethodRate {
  NamedAPIResource? encounterMethod;
  List<EncounterVersionDetails>? versionDetails;

  EncounterMethodRate({
    this.encounterMethod,
    this.versionDetails,
  });

  EncounterMethodRate.fromJson(Map<String, dynamic> json) {
    if (json['encounter_method'] != null) {
      encounterMethod = NamedAPIResource.fromJson(json['encounter_method']);
    }
    if (json['version_details'] != null) {
      versionDetails = <EncounterVersionDetails>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(EncounterVersionDetails.fromJson(v));
      });
    }
  }
}

class EncounterVersionDetails {
  int? rate;
  NamedAPIResource? version;

  EncounterVersionDetails({
    this.rate,
    this.version,
  });

  EncounterVersionDetails.fromJson(Map<String, dynamic> json) {
    if (json['rate'] != null) {
      rate = json['rate'];
    }
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
  }
}

class PokemonEncounter {
  NamedAPIResource? pokemon;
  List<VersionEncounterDetail>? versionDetails;

  PokemonEncounter({
    this.pokemon,
    this.versionDetails,
  });

  PokemonEncounter.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
    if (json['version_details'] != null) {
      versionDetails = <VersionEncounterDetail>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(VersionEncounterDetail.fromJson(v));
      });
    }
  }
}

class PalParkArea {
  int? id;
  String? name;
  List<Name>? names;
  List<PalParkEncounterSpecies>? pokemonEncounters;

  PalParkArea({
    this.id,
    this.name,
    this.names,
    this.pokemonEncounters,
  });

  PalParkArea.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_encounters'] != null) {
      pokemonEncounters = <PalParkEncounterSpecies>[];
      json['pokemon_encounters'].forEach((v) {
        pokemonEncounters!.add(PalParkEncounterSpecies.fromJson(v));
      });
    }
  }
}

class PalParkEncounterSpecies {
  int? baseScore;
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PalParkEncounterSpecies({
    this.baseScore,
    this.rate,
    this.pokemonSpecies,
  });

  PalParkEncounterSpecies.fromJson(Map<String, dynamic> json) {
    if (json['base_score'] != null) {
      baseScore = json['base_score'];
    }
    if (json['rate'] != null) {
      rate = json['rate'];
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = NamedAPIResource.fromJson(json['pokemon_species']);
    }
  }
}

class Region {
  int? id;
  List<NamedAPIResource>? locations;
  String? name;
  List<Name>? names;
  NamedAPIResource? mainGeneration;
  List<NamedAPIResource>? pokedexes;
  List<NamedAPIResource>? versionGroups;

  Region({
    this.id,
    this.locations,
    this.name,
    this.names,
    this.mainGeneration,
    this.pokedexes,
    this.versionGroups,
  });

  Region.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['locations'] != null) {
      locations = <NamedAPIResource>[];
      json['locations'].forEach((v) {
        locations!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['main_generation'] != null) {
      mainGeneration = NamedAPIResource.fromJson(json['main_generation']);
    }
    if (json['pokedexes'] != null) {
      pokedexes = <NamedAPIResource>[];
      json['pokedexes'].forEach((v) {
        pokedexes!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      json['version_groups'].forEach((v) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Machine {
  int? id;
  NamedAPIResource? item;
  NamedAPIResource? move;
  NamedAPIResource? versionGroup;

  Machine({
    this.id,
    this.item,
    this.move,
    this.versionGroup,
  });

  Machine.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['item'] != null) {
      item = NamedAPIResource.fromJson(json['item']);
    }
    if (json['move'] != null) {
      move = NamedAPIResource.fromJson(json['move']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class Move {
  int? id;
  String? name;
  int? accuracy;
  int? effectChance;
  int? pp;
  int? priority;
  int? power;
  ContestComboSets? contestCombos;
  NamedAPIResource? contestType;
  APIResource? contestEffect;
  NamedAPIResource? damageClass;
  List<VerboseEffect>? effectEntries;
  List<AbilityEffectChange>? effectChanges;
  List<NamedAPIResource>? learnedByPokemon;
  List<MoveFlavorText>? flavorTextEntries;
  NamedAPIResource? generation;
  List<MachineVersionDetail>? machines;
  MoveMetaData? meta;
  List<Name>? names;
  List<PastMoveStatValues>? pastValues;
  List<MoveStatChange>? statChanges;
  APIResource? superContestEffect;
  NamedAPIResource? target;
  NamedAPIResource? type;

  Move({
    this.id,
    this.name,
    this.accuracy,
    this.effectChance,
    this.pp,
    this.priority,
    this.power,
    this.contestCombos,
    this.contestType,
    this.contestEffect,
    this.damageClass,
    this.effectEntries,
    this.effectChanges,
    this.learnedByPokemon,
    this.flavorTextEntries,
    this.generation,
    this.machines,
    this.meta,
    this.names,
    this.pastValues,
    this.statChanges,
    this.superContestEffect,
    this.target,
    this.type,
  });

  Move.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['accuracy'] != null) {
      accuracy = json['accuracy'];
    }
    if (json['effect_chance'] != null) {
      effectChance = json['effect_chance'];
    }
    if (json['pp'] != null) {
      pp = json['pp'];
    }
    if (json['priority'] != null) {
      priority = json['priority'];
    }
    if (json['power'] != null) {
      power = json['power'];
    }
    if (json['contest_combos'] != null) {
      contestCombos = ContestComboSets.fromJson(json['contest_combos']);
    }
    if (json['contest_type'] != null) {
      contestType = NamedAPIResource.fromJson(json['contest_type']);
    }
    if (json['contest_effect'] != null) {
      contestEffect = APIResource.fromJson(json['contest_effect']);
    }
    if (json['damage_class'] != null) {
      damageClass = NamedAPIResource.fromJson(json['damage_class']);
    }
    if (json['effect_entries'] != null) {
      effectEntries = <VerboseEffect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(VerboseEffect.fromJson(v));
      });
    }
    if (json['effect_changes'] != null) {
      effectChanges = <AbilityEffectChange>[];
      json['effect_changes'].forEach((v) {
        effectChanges!.add(AbilityEffectChange.fromJson(v));
      });
    }
    if (json['learned_by_pokemon'] != null) {
      learnedByPokemon = <NamedAPIResource>[];
      json['learned_by_pokemon'].forEach((v) {
        learnedByPokemon!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <MoveFlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(MoveFlavorText.fromJson(v));
      });
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['machines'] != null) {
      machines = <MachineVersionDetail>[];
      json['machines'].forEach((v) {
        machines!.add(MachineVersionDetail.fromJson(v));
      });
    }
    if (json['meta'] != null) {
      meta = MoveMetaData.fromJson(json['meta']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['past_values'] != null) {
      pastValues = <PastMoveStatValues>[];
      json['past_values'].forEach((v) {
        pastValues!.add(PastMoveStatValues.fromJson(v));
      });
    }
    if (json['stat_changes'] != null) {
      statChanges = <MoveStatChange>[];
      json['stat_changes'].forEach((v) {
        statChanges!.add(MoveStatChange.fromJson(v));
      });
    }
    if (json['super_contest_effect'] != null) {
      superContestEffect = APIResource.fromJson(json['super_contest_effect']);
    }
    if (json['target'] != null) {
      target = NamedAPIResource.fromJson(json['target']);
    }
    if (json['type'] != null) {
      type = NamedAPIResource.fromJson(json['type']);
    }
  }
}

class ContestComboSets {
  ContestComboDetail? normal;
  ContestComboDetail? super_;

  ContestComboSets({
    this.normal,
    this.super_,
  });

  ContestComboSets.fromJson(Map<String, dynamic> json) {
    if (json['normal'] != null) {
      normal = ContestComboDetail.fromJson(json['normal']);
    }
    if (json['super'] != null) {
      super_ = ContestComboDetail.fromJson(json['super']);
    }
  }
}

class ContestComboDetail {
  List<NamedAPIResource>? useBefore;
  List<NamedAPIResource>? useAfter;

  ContestComboDetail({
    this.useBefore,
    this.useAfter,
  });

  ContestComboDetail.fromJson(Map<String, dynamic> json) {
    if (json['use_before'] != null) {
      useBefore = <NamedAPIResource>[];
      json['use_before'].forEach((v) {
        useBefore!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['use_after'] != null) {
      useAfter = <NamedAPIResource>[];
      json['use_after'].forEach((v) {
        useAfter!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class MoveFlavorText {
  String? flavorText;
  NamedAPIResource? language;
  NamedAPIResource? versionGroup;

  MoveFlavorText({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  MoveFlavorText.fromJson(Map<String, dynamic> json) {
    if (json['flavor_text'] != null) {
      flavorText = json['flavor_text'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class MoveMetaData {
  NamedAPIResource? ailment;
  NamedAPIResource? category;
  int? minHits;
  int? maxHits;
  int? minTurns;
  int? maxTurns;
  int? drain;
  int? healing;
  int? critRate;
  int? ailmentChance;
  int? flinchChance;
  int? statChance;

  MoveMetaData({
    this.ailment,
    this.category,
    this.minHits,
    this.maxHits,
    this.minTurns,
    this.maxTurns,
    this.drain,
    this.healing,
    this.critRate,
    this.ailmentChance,
    this.flinchChance,
    this.statChance,
  });

  MoveMetaData.fromJson(Map<String, dynamic> json) {
    if (json['ailment'] != null) {
      ailment = NamedAPIResource.fromJson(json['ailment']);
    }
    if (json['category'] != null) {
      category = NamedAPIResource.fromJson(json['category']);
    }
    if (json['min_hits'] != null) {
      minHits = json['min_hits'];
    }
    if (json['max_hits'] != null) {
      maxHits = json['max_hits'];
    }
    if (json['min_turns'] != null) {
      minTurns = json['min_turns'];
    }
    if (json['max_turns'] != null) {
      maxTurns = json['max_turns'];
    }
    if (json['drain'] != null) {
      drain = json['drain'];
    }
    if (json['healing'] != null) {
      healing = json['healing'];
    }
    if (json['crit_rate'] != null) {
      critRate = json['crit_rate'];
    }
    if (json['ailment_chance'] != null) {
      ailmentChance = json['ailment_chance'];
    }
    if (json['flinch_chance'] != null) {
      flinchChance = json['flinch_chance'];
    }
    if (json['stat_chance'] != null) {
      statChance = json['stat_chance'];
    }
  }
}

class MoveStatChange {
  int? change;
  NamedAPIResource? stat;

  MoveStatChange({
    this.change,
    this.stat,
  });

  MoveStatChange.fromJson(Map<String, dynamic> json) {
    if (json['change'] != null) {
      change = json['change'];
    }
    if (json['stat'] != null) {
      stat = NamedAPIResource.fromJson(json['stat']);
    }
  }
}

class PastMoveStatValues {
  int? accuracy;
  int? effectChance;
  int? power;
  int? pp;
  List<VerboseEffect>? effectEntries;
  NamedAPIResource? type;
  NamedAPIResource? versionGroup;

  PastMoveStatValues({
    this.accuracy,
    this.effectChance,
    this.power,
    this.pp,
    this.effectEntries,
    this.type,
    this.versionGroup,
  });

  PastMoveStatValues.fromJson(Map<String, dynamic> json) {
    if (json['accuracy'] != null) {
      accuracy = json['accuracy'];
    }
    if (json['effect_chance'] != null) {
      effectChance = json['effect_chance'];
    }
    if (json['power'] != null) {
      power = json['power'];
    }
    if (json['pp'] != null) {
      pp = json['pp'];
    }
    if (json['effect_entries'] != null) {
      effectEntries = <VerboseEffect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(VerboseEffect.fromJson(v));
      });
    }
    if (json['type'] != null) {
      type = NamedAPIResource.fromJson(json['type']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class MoveAilment {
  int? id;
  String? name;
  List<NamedAPIResource>? moves;
  List<Name>? names;

  MoveAilment({
    this.id,
    this.name,
    this.moves,
    this.names,
  });

  MoveAilment.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class MoveBattleStyle {
  int? id;
  String? name;
  List<Name>? names;

  MoveBattleStyle({
    this.id,
    this.name,
    this.names,
  });

  MoveBattleStyle.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class MoveCategory {
  int? id;
  String? name;
  List<NamedAPIResource>? moves;
  List<Description>? descriptions;

  MoveCategory({
    this.id,
    this.name,
    this.moves,
    this.descriptions,
  });

  MoveCategory.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
  }
}

class MoveDamageClass {
  int? id;
  String? name;
  List<Description>? descriptions;
  List<NamedAPIResource>? moves;
  List<Name>? names;

  MoveDamageClass({
    this.id,
    this.name,
    this.descriptions,
    this.moves,
    this.names,
  });

  MoveDamageClass.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class MoveLearnMethod {
  int? id;
  String? name;
  List<Description>? descriptions;
  List<Name>? names;
  List<NamedAPIResource>? versionGroups;

  MoveLearnMethod({
    this.id,
    this.name,
    this.descriptions,
    this.names,
    this.versionGroups,
  });

  MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['version_groups'] != null) {
      versionGroups = <NamedAPIResource>[];
      json['version_groups'].forEach((v) {
        versionGroups!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class MoveTarget {
  int? id;
  String? name;
  List<Description>? descriptions;
  List<NamedAPIResource>? moves;
  List<Name>? names;

  MoveTarget({
    this.id,
    this.name,
    this.descriptions,
    this.moves,
    this.names,
  });

  MoveTarget.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class Ability {
  int? id;
  String? name;
  bool? isMainSeries;
  NamedAPIResource? generation;
  List<Name>? names;
  List<VerboseEffect>? effectEntries;
  List<AbilityEffectChange>? effectChanges;
  List<AbilityFlavorText>? flavorTextEntries;
  List<AbilityPokemon>? pokemon;

  Ability({
    this.id,
    this.name,
    this.isMainSeries,
    this.generation,
    this.names,
    this.effectEntries,
    this.effectChanges,
    this.flavorTextEntries,
    this.pokemon,
  });

  Ability.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['is_main_series'] != null) {
      isMainSeries = json['is_main_series'];
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['effect_entries'] != null) {
      effectEntries = <VerboseEffect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(VerboseEffect.fromJson(v));
      });
    }
    if (json['effect_changes'] != null) {
      effectChanges = <AbilityEffectChange>[];
      json['effect_changes'].forEach((v) {
        effectChanges!.add(AbilityEffectChange.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <AbilityFlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(AbilityFlavorText.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = <AbilityPokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(AbilityPokemon.fromJson(v));
      });
    }
  }
}

class AbilityEffectChange {
  List<Effect>? effectEntries;
  NamedAPIResource? versionGroup;

  AbilityEffectChange({
    this.effectEntries,
    this.versionGroup,
  });

  AbilityEffectChange.fromJson(Map<String, dynamic> json) {
    if (json['effect_entries'] != null) {
      effectEntries = <Effect>[];
      json['effect_entries'].forEach((v) {
        effectEntries!.add(Effect.fromJson(v));
      });
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class AbilityFlavorText {
  String? flavorText;
  NamedAPIResource? language;
  NamedAPIResource? versionGroup;

  AbilityFlavorText({
    this.flavorText,
    this.language,
    this.versionGroup,
  });

  AbilityFlavorText.fromJson(Map<String, dynamic> json) {
    if (json['flavor_text'] != null) {
      flavorText = json['flavor_text'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class AbilityPokemon {
  bool? isHidden;
  int? slot;
  NamedAPIResource? pokemon;

  AbilityPokemon({
    this.isHidden,
    this.slot,
    this.pokemon,
  });

  AbilityPokemon.fromJson(Map<String, dynamic> json) {
    if (json['is_hidden'] != null) {
      isHidden = json['is_hidden'];
    }
    if (json['slot'] != null) {
      slot = json['slot'];
    }
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
  }
}

class Characteristic {
  int? id;
  int? geneModulo;
  List<int>? possibleValues;

  Characteristic({
    this.id,
    this.geneModulo,
    this.possibleValues,
  });

  Characteristic.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['gene_modulo'] != null) {
      geneModulo = json['gene_modulo'];
    }
    if (json['possible_values'] != null) {
      possibleValues = json['possible_values'].cast<int>();
    }
  }
}

class EggGroup {
  int? id;
  String? name;
  List<Name>? names;
  List<NamedAPIResource>? pokemonSpecies;

  EggGroup({
    this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  EggGroup.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Gender {
  int? id;
  String? name;
  List<PokemonSpeciesGender>? pokemonSpeciesDetails;
  List<NamedAPIResource>? requiredForEvolution;

  Gender({
    this.id,
    this.name,
    this.pokemonSpeciesDetails,
    this.requiredForEvolution,
  });

  Gender.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['pokemon_species_details'] != null) {
      pokemonSpeciesDetails = <PokemonSpeciesGender>[];
      json['pokemon_species_details'].forEach((v) {
        pokemonSpeciesDetails!.add(PokemonSpeciesGender.fromJson(v));
      });
    }
    if (json['required_for_evolution'] != null) {
      requiredForEvolution = <NamedAPIResource>[];
      json['required_for_evolution'].forEach((v) {
        requiredForEvolution!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class PokemonSpeciesGender {
  int? rate;
  NamedAPIResource? pokemonSpecies;

  PokemonSpeciesGender({
    this.rate,
    this.pokemonSpecies,
  });

  PokemonSpeciesGender.fromJson(Map<String, dynamic> json) {
    if (json['rate'] != null) {
      rate = json['rate'];
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = NamedAPIResource.fromJson(json['pokemon_species']);
    }
  }
}

class GrowthRate {
  int? id;
  String? name;
  String? formula;
  List<Description>? descriptions;
  List<GrowthRateExperienceLevel>? levels;
  List<NamedAPIResource>? pokemonSpecies;

  GrowthRate({
    this.id,
    this.name,
    this.formula,
    this.descriptions,
    this.levels,
    this.pokemonSpecies,
  });

  GrowthRate.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['formula'] != null) {
      formula = json['formula'];
    }
    if (json['descriptions'] != null) {
      descriptions = <Description>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Description.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <GrowthRateExperienceLevel>[];
      json['levels'].forEach((v) {
        levels!.add(GrowthRateExperienceLevel.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class GrowthRateExperienceLevel {
  int? level;
  int? experience;

  GrowthRateExperienceLevel({
    this.level,
    this.experience,
  });

  GrowthRateExperienceLevel.fromJson(Map<String, dynamic> json) {
    if (json['level'] != null) {
      level = json['level'];
    }
    if (json['experience'] != null) {
      experience = json['experience'];
    }
  }
}

class Nature {
  int? id;
  String? name;
  NamedAPIResource? decreasedStat;
  NamedAPIResource? increasedStat;
  NamedAPIResource? hatesFlavor;
  NamedAPIResource? likesFlavor;
  List<NatureStatChange>? pokeathlonStatChanges;
  List<MoveBattleStylePreference>? moveBattleStylePreferences;
  List<Name>? names;

  Nature({
    this.id,
    this.name,
    this.decreasedStat,
    this.increasedStat,
    this.hatesFlavor,
    this.likesFlavor,
    this.pokeathlonStatChanges,
    this.moveBattleStylePreferences,
    this.names,
  });

  Nature.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['decreased_stat'] != null) {
      decreasedStat = NamedAPIResource.fromJson(json['decreased_stat']);
    }
    if (json['increased_stat'] != null) {
      increasedStat = NamedAPIResource.fromJson(json['increased_stat']);
    }
    if (json['hates_flavor'] != null) {
      hatesFlavor = NamedAPIResource.fromJson(json['hates_flavor']);
    }
    if (json['likes_flavor'] != null) {
      likesFlavor = NamedAPIResource.fromJson(json['likes_flavor']);
    }
    if (json['pokeathlon_stat_changes'] != null) {
      pokeathlonStatChanges = <NatureStatChange>[];
      json['pokeathlon_stat_changes'].forEach((v) {
        pokeathlonStatChanges!.add(NatureStatChange.fromJson(v));
      });
    }
    if (json['move_battle_style_preferences'] != null) {
      moveBattleStylePreferences = <MoveBattleStylePreference>[];
      json['move_battle_style_preferences'].forEach((v) {
        moveBattleStylePreferences!.add(MoveBattleStylePreference.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class NatureStatChange {
  int? maxChange;
  NamedAPIResource? pokeathlonStat;

  NatureStatChange({
    this.maxChange,
    this.pokeathlonStat,
  });

  NatureStatChange.fromJson(Map<String, dynamic> json) {
    if (json['max_change'] != null) {
      maxChange = json['max_change'];
    }
    if (json['pokeathlon_stat'] != null) {
      pokeathlonStat = NamedAPIResource.fromJson(json['pokeathlon_stat']);
    }
  }
}

class MoveBattleStylePreference {
  int? lowHpPreference;
  int? highHpPreference;
  NamedAPIResource? moveBattleStyle;

  MoveBattleStylePreference({
    this.lowHpPreference,
    this.highHpPreference,
    this.moveBattleStyle,
  });

  MoveBattleStylePreference.fromJson(Map<String, dynamic> json) {
    if (json['low_hp_preference'] != null) {
      lowHpPreference = json['low_hp_preference'];
    }
    if (json['high_hp_preference'] != null) {
      highHpPreference = json['high_hp_preference'];
    }
    if (json['move_battle_style'] != null) {
      moveBattleStyle = NamedAPIResource.fromJson(json['move_battle_style']);
    }
  }
}

class PokeathlonStat {
  int? id;
  String? name;
  List<Name>? names;
  NaturePokeathlonStatAffectSets? affectingNatures;

  PokeathlonStat({
    this.id,
    this.name,
    this.names,
    this.affectingNatures,
  });

  PokeathlonStat.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['affecting_natures'] != null) {
      affectingNatures =
          NaturePokeathlonStatAffectSets.fromJson(json['affecting_natures']);
    }
  }
}

class NaturePokeathlonStatAffectSets {
  List<NaturePokeathlonStatAffect>? increase;
  List<NaturePokeathlonStatAffect>? decrease;

  NaturePokeathlonStatAffectSets({
    this.increase,
    this.decrease,
  });

  NaturePokeathlonStatAffectSets.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <NaturePokeathlonStatAffect>[];
      json['increase'].forEach((v) {
        increase!.add(NaturePokeathlonStatAffect.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <NaturePokeathlonStatAffect>[];
      json['decrease'].forEach((v) {
        decrease!.add(NaturePokeathlonStatAffect.fromJson(v));
      });
    }
  }
}

class NaturePokeathlonStatAffect {
  int? maxChange;
  NamedAPIResource? nature;

  NaturePokeathlonStatAffect({
    this.maxChange,
    this.nature,
  });

  NaturePokeathlonStatAffect.fromJson(Map<String, dynamic> json) {
    if (json['max_change'] != null) {
      maxChange = json['max_change'];
    }
    if (json['nature'] != null) {
      nature = NamedAPIResource.fromJson(json['nature']);
    }
  }
}

class Pokemon {
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  bool? isDefault;
  int? order;
  int? weight;
  List<PokemonAbility>? abilities;
  List<NamedAPIResource>? forms;
  List<VersionGameIndex>? gameIndices;
  List<PokemonHeldItem>? heldItems;
  String? locationAreaEncounters;
  List<PokemonMove>? moves;
  List<PokemonTypePast>? pastTypes;
  PokemonSprites? sprites;
  NamedAPIResource? species;
  List<PokemonStat>? stats;
  List<PokemonType>? types;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.heldItems,
    this.locationAreaEncounters,
    this.moves,
    this.pastTypes,
    this.sprites,
    this.species,
    this.stats,
    this.types,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['base_experience'] != null) {
      baseExperience = json['base_experience'];
    }
    if (json['height'] != null) {
      height = json['height'];
    }
    if (json['is_default'] != null) {
      isDefault = json['is_default'];
    }
    if (json['order'] != null) {
      order = json['order'];
    }
    if (json['weight'] != null) {
      weight = json['weight'];
    }
    if (json['abilities'] != null) {
      abilities = <PokemonAbility>[];
      json['abilities'].forEach((v) {
        abilities!.add(PokemonAbility.fromJson(v));
      });
    }
    if (json['forms'] != null) {
      forms = <NamedAPIResource>[];
      json['forms'].forEach((v) {
        forms!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <VersionGameIndex>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(VersionGameIndex.fromJson(v));
      });
    }
    if (json['held_items'] != null) {
      heldItems = <PokemonHeldItem>[];
      json['held_items'].forEach((v) {
        heldItems!.add(PokemonHeldItem.fromJson(v));
      });
    }
    if (json['location_area_encounters'] != null) {
      locationAreaEncounters = json['location_area_encounters'];
    }
    if (json['moves'] != null) {
      moves = <PokemonMove>[];
      json['moves'].forEach((v) {
        moves!.add(PokemonMove.fromJson(v));
      });
    }
    if (json['past_types'] != null) {
      pastTypes = <PokemonTypePast>[];
      json['past_types'].forEach((v) {
        pastTypes!.add(PokemonTypePast.fromJson(v));
      });
    }
    if (json['sprites'] != null) {
      sprites = PokemonSprites.fromJson(json['sprites']);
    }
    if (json['species'] != null) {
      species = NamedAPIResource.fromJson(json['species']);
    }
    if (json['stats'] != null) {
      stats = <PokemonStat>[];
      json['stats'].forEach((v) {
        stats!.add(PokemonStat.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <PokemonType>[];
      json['types'].forEach((v) {
        types!.add(PokemonType.fromJson(v));
      });
    }
  }
}

class PokemonAbility {
  bool? isHidden;
  int? slot;
  NamedAPIResource? ability;

  PokemonAbility({
    this.isHidden,
    this.slot,
    this.ability,
  });

  PokemonAbility.fromJson(Map<String, dynamic> json) {
    if (json['is_hidden'] != null) {
      isHidden = json['is_hidden'];
    }
    if (json['slot'] != null) {
      slot = json['slot'];
    }
    if (json['ability'] != null) {
      ability = NamedAPIResource.fromJson(json['ability']);
    }
  }
}

class PokemonType {
  int? slot;
  NamedAPIResource? type;

  PokemonType({
    this.slot,
    this.type,
  });

  PokemonType.fromJson(Map<String, dynamic> json) {
    if (json['slot'] != null) {
      slot = json['slot'];
    }
    if (json['type'] != null) {
      type = NamedAPIResource.fromJson(json['type']);
    }
  }
}

class PokemonFormType {
  int? slot;
  NamedAPIResource? type;

  PokemonFormType({
    this.slot,
    this.type,
  });

  PokemonFormType.fromJson(Map<String, dynamic> json) {
    if (json['slot'] != null) {
      slot = json['slot'];
    }
    if (json['type'] != null) {
      type = NamedAPIResource.fromJson(json['type']);
    }
  }
}

class PokemonTypePast {
  NamedAPIResource? generation;
  List<PokemonType>? types;

  PokemonTypePast({
    this.generation,
    this.types,
  });

  PokemonTypePast.fromJson(Map<String, dynamic> json) {
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['types'] != null) {
      types = <PokemonType>[];
      json['types'].forEach((v) {
        types!.add(PokemonType.fromJson(v));
      });
    }
  }
}

class PokemonHeldItem {
  NamedAPIResource? item;
  List<PokemonHeldItemVersion>? versionDetails;

  PokemonHeldItem({
    this.item,
    this.versionDetails,
  });

  PokemonHeldItem.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = NamedAPIResource.fromJson(json['item']);
    }
    if (json['version_details'] != null) {
      versionDetails = <PokemonHeldItemVersion>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(PokemonHeldItemVersion.fromJson(v));
      });
    }
  }
}

class PokemonHeldItemVersion {
  NamedAPIResource? version;
  int? rarity;

  PokemonHeldItemVersion({
    this.version,
    this.rarity,
  });

  PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) {
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
    if (json['rarity'] != null) {
      rarity = json['rarity'];
    }
  }
}

class PokemonMove {
  NamedAPIResource? move;
  List<PokemonMoveVersion>? versionGroupDetails;

  PokemonMove({
    this.move,
    this.versionGroupDetails,
  });

  PokemonMove.fromJson(Map<String, dynamic> json) {
    if (json['move'] != null) {
      move = NamedAPIResource.fromJson(json['move']);
    }
    if (json['version_group_details'] != null) {
      versionGroupDetails = <PokemonMoveVersion>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(PokemonMoveVersion.fromJson(v));
      });
    }
  }
}

class PokemonMoveVersion {
  NamedAPIResource? moveLearnMethod;
  NamedAPIResource? versionGroup;
  int? levelLearnedAt;

  PokemonMoveVersion({
    this.moveLearnMethod,
    this.versionGroup,
    this.levelLearnedAt,
  });

  PokemonMoveVersion.fromJson(Map<String, dynamic> json) {
    if (json['move_learn_method'] != null) {
      moveLearnMethod = NamedAPIResource.fromJson(json['move_learn_method']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
    if (json['level_learned_at'] != null) {
      levelLearnedAt = json['level_learned_at'];
    }
  }
}

class PokemonStat {
  NamedAPIResource? stat;
  int? effort;
  int? baseStat;

  PokemonStat({
    this.stat,
    this.effort,
    this.baseStat,
  });

  PokemonStat.fromJson(Map<String, dynamic> json) {
    if (json['stat'] != null) {
      stat = NamedAPIResource.fromJson(json['stat']);
    }
    if (json['effort'] != null) {
      effort = json['effort'];
    }
    if (json['base_stat'] != null) {
      baseStat = json['base_stat'];
    }
  }
}

class PokemonSprites {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;

  PokemonSprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  PokemonSprites.fromJson(Map<String, dynamic> json) {
    if (json['front_default'] != null) {
      frontDefault = json['front_default'];
    }
    if (json['front_shiny'] != null) {
      frontShiny = json['front_shiny'];
    }
    if (json['front_female'] != null) {
      frontFemale = json['front_female'];
    }
    if (json['front_shiny_female'] != null) {
      frontShinyFemale = json['front_shiny_female'];
    }
    if (json['back_default'] != null) {
      backDefault = json['back_default'];
    }
    if (json['back_shiny'] != null) {
      backShiny = json['back_shiny'];
    }
    if (json['back_female'] != null) {
      backFemale = json['back_female'];
    }
    if (json['back_shiny_female'] != null) {
      backShinyFemale = json['back_shiny_female'];
    }
  }
}

class LocationAreaEncounter {
  NamedAPIResource? locationArea;
  List<VersionEncounterDetail>? versionDetails;

  LocationAreaEncounter({
    this.locationArea,
    this.versionDetails,
  });

  LocationAreaEncounter.fromJson(Map<String, dynamic> json) {
    if (json['location_area'] != null) {
      locationArea = NamedAPIResource.fromJson(json['location_area']);
    }
    if (json['version_details'] != null) {
      versionDetails = <VersionEncounterDetail>[];
      json['version_details'].forEach((v) {
        versionDetails!.add(VersionEncounterDetail.fromJson(v));
      });
    }
  }
}

class PokemonColor {
  int? id;
  String? name;
  List<Name>? names;
  List<NamedAPIResource>? pokemonSpecies;

  PokemonColor({
    this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  PokemonColor.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class PokemonForm {
  int? id;
  String? name;
  int? order;
  int? formOrder;
  bool? isDefault;
  bool? isBattleOnly;
  bool? isMega;
  String? formName;
  NamedAPIResource? pokemon;
  List<PokemonFormType>? types;
  PokemonFormSprites? sprites;
  NamedAPIResource? versionGroup;
  List<Name>? names;
  List<Name>? formNames;

  PokemonForm({
    this.id,
    this.name,
    this.order,
    this.formOrder,
    this.isDefault,
    this.isBattleOnly,
    this.isMega,
    this.formName,
    this.pokemon,
    this.types,
    this.sprites,
    this.versionGroup,
    this.names,
    this.formNames,
  });

  PokemonForm.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['order'] != null) {
      order = json['order'];
    }
    if (json['form_order'] != null) {
      formOrder = json['form_order'];
    }
    if (json['is_default'] != null) {
      isDefault = json['is_default'];
    }
    if (json['is_battle_only'] != null) {
      isBattleOnly = json['is_battle_only'];
    }
    if (json['is_mega'] != null) {
      isMega = json['is_mega'];
    }
    if (json['form_name'] != null) {
      formName = json['form_name'];
    }
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
    if (json['types'] != null) {
      types = <PokemonFormType>[];
      json['types'].forEach((v) {
        types!.add(PokemonFormType.fromJson(v));
      });
    }
    if (json['sprites'] != null) {
      sprites = PokemonFormSprites.fromJson(json['sprites']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['form_names'] != null) {
      formNames = <Name>[];
      json['form_names'].forEach((v) {
        formNames!.add(Name.fromJson(v));
      });
    }
  }
}

class PokemonFormSprites {
  String? frontDefault;
  String? frontShiny;
  String? backDefault;
  String? backShiny;

  PokemonFormSprites({
    this.frontDefault,
    this.frontShiny,
    this.backDefault,
    this.backShiny,
  });

  PokemonFormSprites.fromJson(Map<String, dynamic> json) {
    if (json['front_default'] != null) {
      frontDefault = json['front_default'];
    }
    if (json['front_shiny'] != null) {
      frontShiny = json['front_shiny'];
    }
    if (json['back_default'] != null) {
      backDefault = json['back_default'];
    }
    if (json['back_shiny'] != null) {
      backShiny = json['back_shiny'];
    }
  }
}

class PokemonHabitat {
  int? id;
  String? name;
  List<Name>? names;
  List<NamedAPIResource>? pokemonSpecies;

  PokemonHabitat({
    this.id,
    this.name,
    this.names,
    this.pokemonSpecies,
  });

  PokemonHabitat.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class PokemonShape {
  int? id;
  String? name;
  List<AwesomeName>? awesomeNames;
  List<Name>? names;
  List<NamedAPIResource>? pokemonSpecies;

  PokemonShape({
    this.id,
    this.name,
    this.awesomeNames,
    this.names,
    this.pokemonSpecies,
  });

  PokemonShape.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['awesome_names'] != null) {
      awesomeNames = <AwesomeName>[];
      json['awesome_names'].forEach((v) {
        awesomeNames!.add(AwesomeName.fromJson(v));
      });
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon_species'] != null) {
      pokemonSpecies = <NamedAPIResource>[];
      json['pokemon_species'].forEach((v) {
        pokemonSpecies!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class AwesomeName {
  String? awesomeName;
  NamedAPIResource? language;

  AwesomeName({
    this.awesomeName,
    this.language,
  });

  AwesomeName.fromJson(Map<String, dynamic> json) {
    if (json['awesome_name'] != null) {
      awesomeName = json['awesome_name'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class PokemonSpecies {
  int? id;
  String? name;
  int? order;
  int? genderRate;
  int? captureRate;
  int? baseHappiness;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  int? hatchCounter;
  bool? hasGenderDifferences;
  bool? formsSwitchable;
  NamedAPIResource? growthRate;
  List<PokemonSpeciesDexEntry>? pokedexNumbers;
  List<NamedAPIResource>? eggGroups;
  NamedAPIResource? color;
  NamedAPIResource? shape;
  NamedAPIResource? evolvesFromSpecies;
  APIResource? evolutionChain;
  NamedAPIResource? habitat;
  NamedAPIResource? generation;
  List<Name>? names;
  List<PalParkEncounterArea>? palParkEncounters;
  List<FlavorText>? flavorTextEntries;
  List<Description>? formDescriptions;
  List<Genus>? genera;
  List<PokemonSpeciesVariety>? varieties;

  PokemonSpecies({
    this.id,
    this.name,
    this.order,
    this.genderRate,
    this.captureRate,
    this.baseHappiness,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.hatchCounter,
    this.hasGenderDifferences,
    this.formsSwitchable,
    this.growthRate,
    this.pokedexNumbers,
    this.eggGroups,
    this.color,
    this.shape,
    this.evolvesFromSpecies,
    this.evolutionChain,
    this.habitat,
    this.generation,
    this.names,
    this.palParkEncounters,
    this.flavorTextEntries,
    this.formDescriptions,
    this.genera,
    this.varieties,
  });

  PokemonSpecies.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['order'] != null) {
      order = json['order'];
    }
    if (json['gender_rate'] != null) {
      genderRate = json['gender_rate'];
    }
    if (json['capture_rate'] != null) {
      captureRate = json['capture_rate'];
    }
    if (json['base_happiness'] != null) {
      baseHappiness = json['base_happiness'];
    }
    if (json['is_baby'] != null) {
      isBaby = json['is_baby'];
    }
    if (json['is_legendary'] != null) {
      isLegendary = json['is_legendary'];
    }
    if (json['is_mythical'] != null) {
      isMythical = json['is_mythical'];
    }
    if (json['hatch_counter'] != null) {
      hatchCounter = json['hatch_counter'];
    }
    if (json['has_gender_differences'] != null) {
      hasGenderDifferences = json['has_gender_differences'];
    }
    if (json['forms_switchable'] != null) {
      formsSwitchable = json['forms_switchable'];
    }
    if (json['growth_rate'] != null) {
      growthRate = NamedAPIResource.fromJson(json['growth_rate']);
    }
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers = <PokemonSpeciesDexEntry>[];
      json['pokedex_numbers'].forEach((v) {
        pokedexNumbers!.add(PokemonSpeciesDexEntry.fromJson(v));
      });
    }
    if (json['egg_groups'] != null) {
      eggGroups = <NamedAPIResource>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['color'] != null) {
      color = NamedAPIResource.fromJson(json['color']);
    }
    if (json['shape'] != null) {
      shape = NamedAPIResource.fromJson(json['shape']);
    }
    if (json['evolves_from_species'] != null) {
      evolvesFromSpecies =
          NamedAPIResource.fromJson(json['evolves_from_species']);
    }
    if (json['evolution_chain'] != null) {
      evolutionChain = APIResource.fromJson(json['evolution_chain']);
    }
    if (json['habitat'] != null) {
      habitat = NamedAPIResource.fromJson(json['habitat']);
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = <PalParkEncounterArea>[];
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters!.add(PalParkEncounterArea.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorText>[];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorText.fromJson(v));
      });
    }
    if (json['form_descriptions'] != null) {
      formDescriptions = <Description>[];
      json['form_descriptions'].forEach((v) {
        formDescriptions!.add(Description.fromJson(v));
      });
    }
    if (json['genera'] != null) {
      genera = <Genus>[];
      json['genera'].forEach((v) {
        genera!.add(Genus.fromJson(v));
      });
    }
    if (json['varieties'] != null) {
      varieties = <PokemonSpeciesVariety>[];
      json['varieties'].forEach((v) {
        varieties!.add(PokemonSpeciesVariety.fromJson(v));
      });
    }
  }
}

class Genus {
  String? genus;
  NamedAPIResource? language;

  Genus({
    this.genus,
    this.language,
  });

  Genus.fromJson(Map<String, dynamic> json) {
    if (json['genus'] != null) {
      genus = json['genus'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class PokemonSpeciesDexEntry {
  int? entryNumber;
  NamedAPIResource? pokedex;

  PokemonSpeciesDexEntry({
    this.entryNumber,
    this.pokedex,
  });

  PokemonSpeciesDexEntry.fromJson(Map<String, dynamic> json) {
    if (json['entry_number'] != null) {
      entryNumber = json['entry_number'];
    }
    if (json['pokedex'] != null) {
      pokedex = NamedAPIResource.fromJson(json['pokedex']);
    }
  }
}

class PalParkEncounterArea {
  int? baseScore;
  int? rate;
  NamedAPIResource? area;

  PalParkEncounterArea({
    this.baseScore,
    this.rate,
    this.area,
  });

  PalParkEncounterArea.fromJson(Map<String, dynamic> json) {
    if (json['base_score'] != null) {
      baseScore = json['base_score'];
    }
    if (json['rate'] != null) {
      rate = json['rate'];
    }
    if (json['area'] != null) {
      area = NamedAPIResource.fromJson(json['area']);
    }
  }
}

class PokemonSpeciesVariety {
  bool? isDefault;
  NamedAPIResource? pokemon;

  PokemonSpeciesVariety({
    this.isDefault,
    this.pokemon,
  });

  PokemonSpeciesVariety.fromJson(Map<String, dynamic> json) {
    if (json['is_default'] != null) {
      isDefault = json['is_default'];
    }
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
  }
}

class Stat {
  int? id;
  String? name;
  int? gameIndex;
  bool? isBattleOnly;
  MoveStatAffectSets? affectingMoves;
  NatureStatAffectSets? affectingNatures;
  List<APIResource>? characteristics;
  NamedAPIResource? moveDamageClass;
  List<Name>? names;

  Stat({
    this.id,
    this.name,
    this.gameIndex,
    this.isBattleOnly,
    this.affectingMoves,
    this.affectingNatures,
    this.characteristics,
    this.moveDamageClass,
    this.names,
  });

  Stat.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['game_index'] != null) {
      gameIndex = json['game_index'];
    }
    if (json['is_battle_only'] != null) {
      isBattleOnly = json['is_battle_only'];
    }
    if (json['affecting_moves'] != null) {
      affectingMoves = MoveStatAffectSets.fromJson(json['affecting_moves']);
    }
    if (json['affecting_natures'] != null) {
      affectingNatures =
          NatureStatAffectSets.fromJson(json['affecting_natures']);
    }
    if (json['characteristics'] != null) {
      characteristics = <APIResource>[];
      json['characteristics'].forEach((v) {
        characteristics!.add(APIResource.fromJson(v));
      });
    }
    if (json['move_damage_class'] != null) {
      moveDamageClass = NamedAPIResource.fromJson(json['move_damage_class']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class MoveStatAffectSets {
  List<MoveStatAffect>? increase;
  List<MoveStatAffect>? decrease;

  MoveStatAffectSets({
    this.increase,
    this.decrease,
  });

  MoveStatAffectSets.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <MoveStatAffect>[];
      json['increase'].forEach((v) {
        increase!.add(MoveStatAffect.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <MoveStatAffect>[];
      json['decrease'].forEach((v) {
        decrease!.add(MoveStatAffect.fromJson(v));
      });
    }
  }
}

class MoveStatAffect {
  int? change;
  NamedAPIResource? move;

  MoveStatAffect({
    this.change,
    this.move,
  });

  MoveStatAffect.fromJson(Map<String, dynamic> json) {
    if (json['change'] != null) {
      change = json['change'];
    }
    if (json['move'] != null) {
      move = NamedAPIResource.fromJson(json['move']);
    }
  }
}

class NatureStatAffectSets {
  List<NamedAPIResource>? increase;
  List<NamedAPIResource>? decrease;

  NatureStatAffectSets({
    this.increase,
    this.decrease,
  });

  NatureStatAffectSets.fromJson(Map<String, dynamic> json) {
    if (json['increase'] != null) {
      increase = <NamedAPIResource>[];
      json['increase'].forEach((v) {
        increase!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['decrease'] != null) {
      decrease = <NamedAPIResource>[];
      json['decrease'].forEach((v) {
        decrease!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class Type {
  int? id;
  String? name;
  TypeRelations? damageRelations;
  List<Type>? pastDamageRelations;
  List<GenerationGameIndex>? gameIndices;
  NamedAPIResource? generation;
  NamedAPIResource? moveDamageClass;
  List<Name>? names;
  List<TypePokemon>? pokemon;
  List<NamedAPIResource>? moves;

  Type({
    this.id,
    this.name,
    this.damageRelations,
    this.pastDamageRelations,
    this.gameIndices,
    this.generation,
    this.moveDamageClass,
    this.names,
    this.pokemon,
    this.moves,
  });

  Type.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['damage_relations'] != null) {
      damageRelations = TypeRelations.fromJson(json['damage_relations']);
    }
    if (json['past_damage_relations'] != null) {
      pastDamageRelations = <Type>[];
      json['past_damage_relations'].forEach((v) {
        pastDamageRelations!.add(Type.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GenerationGameIndex>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GenerationGameIndex.fromJson(v));
      });
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['move_damage_class'] != null) {
      moveDamageClass = NamedAPIResource.fromJson(json['move_damage_class']);
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = <TypePokemon>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(TypePokemon.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = <NamedAPIResource>[];
      json['moves'].forEach((v) {
        moves!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class TypePokemon {
  int? slot;
  NamedAPIResource? pokemon;

  TypePokemon({
    this.slot,
    this.pokemon,
  });

  TypePokemon.fromJson(Map<String, dynamic> json) {
    if (json['slot'] != null) {
      slot = json['slot'];
    }
    if (json['pokemon'] != null) {
      pokemon = NamedAPIResource.fromJson(json['pokemon']);
    }
  }
}

class TypeRelations {
  List<NamedAPIResource>? noDamageTo;
  List<NamedAPIResource>? halfDamageTo;
  List<NamedAPIResource>? doubleDamageTo;
  List<NamedAPIResource>? noDamageFrom;
  List<NamedAPIResource>? halfDamageFrom;
  List<NamedAPIResource>? doubleDamageFrom;

  TypeRelations({
    this.noDamageTo,
    this.halfDamageTo,
    this.doubleDamageTo,
    this.noDamageFrom,
    this.halfDamageFrom,
    this.doubleDamageFrom,
  });

  TypeRelations.fromJson(Map<String, dynamic> json) {
    if (json['no_damage_to'] != null) {
      noDamageTo = <NamedAPIResource>[];
      json['no_damage_to'].forEach((v) {
        noDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['half_damage_to'] != null) {
      halfDamageTo = <NamedAPIResource>[];
      json['half_damage_to'].forEach((v) {
        halfDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['double_damage_to'] != null) {
      doubleDamageTo = <NamedAPIResource>[];
      json['double_damage_to'].forEach((v) {
        doubleDamageTo!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['no_damage_from'] != null) {
      noDamageFrom = <NamedAPIResource>[];
      json['no_damage_from'].forEach((v) {
        noDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['half_damage_from'] != null) {
      halfDamageFrom = <NamedAPIResource>[];
      json['half_damage_from'].forEach((v) {
        halfDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['double_damage_from'] != null) {
      doubleDamageFrom = <NamedAPIResource>[];
      json['double_damage_from'].forEach((v) {
        doubleDamageFrom!.add(NamedAPIResource.fromJson(v));
      });
    }
  }
}

class TypeRelationsPast {
  NamedAPIResource? generation;
  TypeRelations? damageRelations;

  TypeRelationsPast({
    this.generation,
    this.damageRelations,
  });

  TypeRelationsPast.fromJson(Map<String, dynamic> json) {
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
    if (json['damage_relations'] != null) {
      damageRelations = TypeRelations.fromJson(json['damage_relations']);
    }
  }
}

class Language {
  int? id;
  String? name;
  bool? official;
  String? iso639;
  String? iso3166;
  List<Name>? names;

  Language({
    this.id,
    this.name,
    this.official,
    this.iso639,
    this.iso3166,
    this.names,
  });

  Language.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['official'] != null) {
      official = json['official'];
    }
    if (json['iso639'] != null) {
      iso639 = json['iso639'];
    }
    if (json['iso3166'] != null) {
      iso3166 = json['iso3166'];
    }
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(Name.fromJson(v));
      });
    }
  }
}

class APIResource {
  String? url;

  APIResource({
    this.url,
  });

  APIResource.fromJson(Map<String, dynamic> json) {
    if (json['url'] != null) {
      url = json['url'];
    }
  }
}

class Description {
  String? description;
  NamedAPIResource? language;

  Description({
    this.description,
    this.language,
  });

  Description.fromJson(Map<String, dynamic> json) {
    if (json['description'] != null) {
      description = json['description'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class Effect {
  String? effect;
  NamedAPIResource? language;

  Effect({
    this.effect,
    this.language,
  });

  Effect.fromJson(Map<String, dynamic> json) {
    if (json['effect'] != null) {
      effect = json['effect'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class Encounter {
  int? minLevel;
  int? maxLevel;
  List<NamedAPIResource>? conditionValues;
  int? chance;
  NamedAPIResource? method;

  Encounter({
    this.minLevel,
    this.maxLevel,
    this.conditionValues,
    this.chance,
    this.method,
  });

  Encounter.fromJson(Map<String, dynamic> json) {
    if (json['min_level'] != null) {
      minLevel = json['min_level'];
    }
    if (json['max_level'] != null) {
      maxLevel = json['max_level'];
    }
    if (json['condition_values'] != null) {
      conditionValues = <NamedAPIResource>[];
      json['condition_values'].forEach((v) {
        conditionValues!.add(NamedAPIResource.fromJson(v));
      });
    }
    if (json['chance'] != null) {
      chance = json['chance'];
    }
    if (json['method'] != null) {
      method = NamedAPIResource.fromJson(json['method']);
    }
  }
}

class FlavorText {
  String? flavorText;
  NamedAPIResource? language;
  NamedAPIResource? version;

  FlavorText({
    this.flavorText,
    this.language,
    this.version,
  });

  FlavorText.fromJson(Map<String, dynamic> json) {
    if (json['flavor_text'] != null) {
      flavorText = json['flavor_text'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
  }
}

class GenerationGameIndex {
  int? gameIndex;
  NamedAPIResource? generation;

  GenerationGameIndex({
    this.gameIndex,
    this.generation,
  });

  GenerationGameIndex.fromJson(Map<String, dynamic> json) {
    if (json['game_index'] != null) {
      gameIndex = json['game_index'];
    }
    if (json['generation'] != null) {
      generation = NamedAPIResource.fromJson(json['generation']);
    }
  }
}

class MachineVersionDetail {
  APIResource? machine;
  NamedAPIResource? versionGroup;

  MachineVersionDetail({
    this.machine,
    this.versionGroup,
  });

  MachineVersionDetail.fromJson(Map<String, dynamic> json) {
    if (json['machine'] != null) {
      machine = APIResource.fromJson(json['machine']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}

class Name {
  String? name;
  NamedAPIResource? language;

  Name({
    this.name,
    this.language,
  });

  Name.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class NamedAPIResource {
  String? name;
  String? url;

  NamedAPIResource({
    this.name,
    this.url,
  });

  NamedAPIResource.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['url'] != null) {
      url = json['url'];
    }
  }
}

class VerboseEffect {
  String? effect;
  String? shortEffect;
  NamedAPIResource? language;

  VerboseEffect({
    this.effect,
    this.shortEffect,
    this.language,
  });

  VerboseEffect.fromJson(Map<String, dynamic> json) {
    if (json['effect'] != null) {
      effect = json['effect'];
    }
    if (json['short_effect'] != null) {
      shortEffect = json['short_effect'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
  }
}

class VersionEncounterDetail {
  NamedAPIResource? version;
  int? maxChance;
  List<Encounter>? encounterDetails;

  VersionEncounterDetail({
    this.version,
    this.maxChance,
    this.encounterDetails,
  });

  VersionEncounterDetail.fromJson(Map<String, dynamic> json) {
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
    if (json['max_chance'] != null) {
      maxChance = json['max_chance'];
    }
    if (json['encounter_details'] != null) {
      encounterDetails = <Encounter>[];
      json['encounter_details'].forEach((v) {
        encounterDetails!.add(Encounter.fromJson(v));
      });
    }
  }
}

class VersionGameIndex {
  int? gameIndex;
  NamedAPIResource? version;

  VersionGameIndex({
    this.gameIndex,
    this.version,
  });

  VersionGameIndex.fromJson(Map<String, dynamic> json) {
    if (json['game_index'] != null) {
      gameIndex = json['game_index'];
    }
    if (json['version'] != null) {
      version = NamedAPIResource.fromJson(json['version']);
    }
  }
}

class VersionGroupFlavorText {
  String? text;
  NamedAPIResource? language;
  NamedAPIResource? versionGroup;

  VersionGroupFlavorText({
    this.text,
    this.language,
    this.versionGroup,
  });

  VersionGroupFlavorText.fromJson(Map<String, dynamic> json) {
    if (json['text'] != null) {
      text = json['text'];
    }
    if (json['language'] != null) {
      language = NamedAPIResource.fromJson(json['language']);
    }
    if (json['version_group'] != null) {
      versionGroup = NamedAPIResource.fromJson(json['version_group']);
    }
  }
}
