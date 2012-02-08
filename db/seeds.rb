# NOTE: DO NOT modify themes that are already in production or the world will explode!
{
  "Dinosaurs"     => ["buitreraptor", "gasosaurus", "abelisaurus", "adasaurus", "oviraptor", "baryonyx", "deinonychus", "dromaeosaurus", "saurornitholestes", "stenonychosaurus", "velociraptor", "saurornithoides", "noasaurus", "rajasaurus", "sarcosuchus", "suchomimus", "struthiomimus", "ornithomimus", "procompsognathus", "coelurus", "elaphrosaurus", "dromiceiomimus", "gallimimus", "compsognathus", "coelophysis", "saltopus", "deinocheirus", "dilophosaurus", "ceratosaurus", "allosaurus", "megalosaurus", "acrocanthosaurus", "spinosaurur", "albertosaurus", "daspletosaurus", "tarbosaurus"],
  "Superheroes"   => ["a_man_dressed_like_a_bat", "batman", "superman", "spiderman", "wolverine", "captain_america", "iron_man", "cyclops", "thing", "beast", "mr_fantastic", "storm", "human_torch", "hulk", "thor", "invisible_woman", "wonder_woman", "professor_x", "archangel", "colossus", "iceman", "nightcrawler", "rogue", "daredevil", "dr_strange", "scarlet_witch", "hawkeye", "magneto", "green_arrow", "wasp", "cannonball", "aquaman", "vision", "dr_doom", "hawkman", "quicksilver"],
  "NATO"          => ["alpha", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel", "india", "juliet", "kilo", "lima", "mike", "november", "oscar", "papa", "quebec", "romeo", "sierra", "tango", "uniform", "victor", "whiskey", "xray", "yankee", "zulu", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "zero"],
  "Miscellaneous" => ["bottle", "glass", "light_bulb", "tube", "apple", "banana", "carrot", "cucumber", "onion", "parsnip", "plantain", "potato", "salami", "turnip", "zucchini", "axe_handle", "broom_handle", "knife", "ice_pick", "knife_sharpener", "mortar_pestle", "spatula", "spoon", "candle", "curling_iron", "flashlight", "pen", "screwdriver", "toothbrush", "balloon", "baseball", "tennis_ball", "cue_ball", "shampoo_bottle", "frozen_pigs_tail", "kangaroo_tumor"]
}.each do |key, value|
  theme = Theme.find_or_create_by_name(key)
  theme.words = value
  theme.save!
end
