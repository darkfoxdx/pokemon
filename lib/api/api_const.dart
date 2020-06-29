class ApiConst {
  static const baseUrl = "https://bulbapedia.bulbagarden.net/w/api.php";

  static getGalarOriPokemonsQuery() => {
        "action": "parse",
        "format": "json",
        "page": "List_of_Pok%C3%A9mon_by_Galar_Pok%C3%A9dex_number",
        "prop": "wikitext",
      };

  static getGalarArmorPokemonsQuery() => {
        "action": "parse",
        "format": "json",
        "page": "List_of_Pok%C3%A9mon_by_Isle_of_Armor_Pok%C3%A9dex_number",
        "prop": "wikitext",
      };

  static getPokemonDetailsQuery(Iterable<String> pokemons) => {
        "action": "query",
        "format": "json",
        "prop": "pageimages|revisions",
        "titles": "${pokemons.join("|")}",
        "redirects": "1",
        "piprop": "thumbnail|original",
        "pilimit": "max",
        "rvprop": "content",
      };
}
