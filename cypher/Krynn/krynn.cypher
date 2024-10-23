// Timeline Era Nodes
CREATE  (ageOfStarbirth:Era {name: "Age of Starbirth", startyear: -50000, endYear: -9000}),
        (ageOfDreams:Era {name: "Age of Dreams", startYear: -9000, endYear: -1000}),
        (ageOfMight:Era {name: "Age of Might", startYear: -1000, endYear: 0}),
        (ageOfDespair:Era {name: "Age of Despair", startYear: 0, endYear: 383}),
        (ageOfMortals:Era {name: "Age of Mortals", startYear: 383});

// Other TimePeriod Nodes
CREATE  (foundation:TimePeriod {name: "The Foundation", startYear: -9000, endYear: -5000}),
        (timeOfLight:TimePeriod {name: "The Time of Light", startYear: -5000, endYear: -2000}),
        (timeOfKnights:TimePeriod {name: "The Time of Knights", startYear: -2000, endYear: -1000}),
        (timeOfDarkness:TimePeriod {name: "The Time of Darkness", startYear: 0, endYear: 300}),
        (timeOfDragons:TimePeriod {name: "The Time of Dragons", startYear: 300, endYear: 383});

// World Nodes
CREATE  (krynn:World {name: "Krynn"});

// Continent Nodes
CREATE (ansalon:Continent {name: 'Ansalon'}),
       (taladas:Continent {name: 'Taladas'}),
       (otherlands:Continent {name: 'Otherlands'});

// Kingdom Nodes
CREATE (thorbardin:Kingdom {name: "Thorbardin"});

// Major City Nodes
CREATE (icereach:City {name: 'Icereach'}),
       (kenderhome:City {name: 'Kenderhome'}),
       (krynnCity:City {name: 'Krynn'}),
       (neraka:City {name: 'Neraka'}),
       (nethosak:City {name: 'Nethosak'}),
       (newsea:City {name: 'New Sea'}),
       (palanthas:City {name: 'Palanthas'}),
       (qualinost:City {name: 'Qualinost'}),
       (sanction:City {name: 'Sanction'}),
       (solace:City {name: 'Solace'}),
       (stormkeep:City {name: 'Stormkeep'}),
       (tarsis:City {name: 'Tarsis'}),
       (thorbardinCity:City {name: 'Thorbardin'});

// Landmark Nodes
CREATE (bloodsea:Landmark {name: 'Blood Sea of Istar'}),
       (bloodstone:Landmark {name: 'Bloodstone'}),
       (corinth:Landmark {name: 'Corinth Bay'}),
       (dargaardkeep:Landmark {name: 'Dargaard Keep'}),
       (darkenwood:Landmark {name: 'Darken Wood'}),
       (ergoth:Landmark {name: 'Ergoth'}),
       (forestdarken:Landmark {name: 'Forest of Darken Wood'}),
       (highcleriststower:Landmark {name: 'High Clerist\'s Tower'}),
       (icewall:Landmark {name: 'Icewall'}),
       (icyseas:Landmark {name: 'Icy Seas'}),
       (kharolis:Landmark {name: 'Kharolis Mountains'}),
       (mountnonala:Landmark {name: 'Mount Nonala'}),
       (plainsOfDust:Landmark {name: 'Plains of Dust'}),
       (qualinesti:Landmark {name: 'Qualinesti Forest'}),
       (silvanesti:Landmark {name: 'Silvanesti Forest'}),
       (skullcap:Landmark {name: 'Skullcap'}),
       (templeoftakhisis:Landmark {name: 'Temple of Takhisis'}),
       (vingaardkeep:Landmark {name: 'Vingaard Keep'}),
       (whiterage:Landmark {name: 'White Rage River'}),
       (xaktsaroth:Landmark {name: 'Xak Tsaroth'});

// Event Nodes
CREATE (creation_of_krynn:Event {name: "Creation of Krynn", year: -10000}),
       (first_dragon_war:Event {name: "The First Dragon War", year: -3500}),
       (graygem_gargath:Event {name: "The Graygem of Gargath", year: -3000}),
       (second_dragon_war:Event {name: "The Second Dragon War", year: -2800}),
       (kinslayer_wars:Event {name: "The Kinslayer Wars", year: -2600}),
       (foundation_solamnia:Event {name: "Foundation of Solamnia", year: -2500}),
       (lost_wars:Event {name: "The Lost Wars", year: -2400}),
       (founding_palanthas:Event {name: "The Founding of Palanthas", year: -1500}),
       (rise_of_istar:Event {name: "The Rise of Istar", year: -1200}),
       (third_dragon_war:Event {name: "The Third Dragon War", year: -1000}),
       (fall_of_istar:Event {name: "The Fall of Istar", year: -100}),
       (kingpriest:Event {name: "The Kingpriest's Demand", year: -1}),
       (cataclysm:Event {name: "The Cataclysm", year: 0}),
       (dwarfgate_war:Event {name: "The Dwarfgate War", year: 39}),
       (war_of_the_mountain:Event {name: "The War of the Mountain", year: 186}),
       (war_of_the_lance:Event {name: "The War of the Lance", year: 352}),
       (night_of_the_eye:Event {name: "The Night of the Eye", year: 356}),
       (war_of_the_blue_lady:Event {name: "The War of the Blue Lady", year: 357}),
       (war_of_the_twins:Event {name: "The War of the Twins", year: 357}),
       (chaos_war:Event {name: "The War of Chaos / Chaos War", year: 383}),
       (second_cataclysm:Event {name: "The Second Cataclysm", year: 383}),
       (war_of_the_dark_queen:Event {name: "The War of the Dark Queen", year: 416}),
       (return_of_the_gods:Event {name: "The Return of the Gods", year: 421}),
       (war_of_souls:Event {name: "War of Souls", year: 421}),
       (fall_of_takhisis:Event {name: "The Fall of Takhisis", year: 422}),
       (trials_of_high_sorcery:Event {name: "The Trials of High Sorcery"});

// God Nodes
CREATE (chaos:Character {name: "Chaos", race: "God", alignment: "chaotic", role: "God of Chaos"}),
       (gilean:Character {name: "Gilean", race: "God", alignment: "Neutral", role: "God of Neutrality"}),
       (highGod:Character {name: "The High God", race: "God", alignment: "lawfull", role: "God of Law & Order"}),
       (lunitari:Character {name: "Lunitari", race: "God", alignment: "Neutral", role: "Goddess of Red Magic"}),
       (nuitari:Character {name: "Nuitari", race: "God", alignment: "Evil", role: "God of Black Magic"}),
       (paladine:Character {name: "Paladine", race: "God", alignment: "Good", role: "God of Good"}),
       (solinari:Character {name: "Solinari", race: "God", alignment: "Good", role: "God of White Magic"}),
       (takhisis:Character {name: "Takhisis", race: "God", alignment: "Evil", role: "Goddess of Evil"}),
       (takhisis_returned:Character {name: "Takhisis (Returned)", race: "God", role: "Antagonist"});

// Faction Nodes
CREATE (godsOfLight:Faction {name: 'Gods of Light'}),
       (godsOfBalance:Faction {name: 'Gods of Balance'}),
       (godsOfDarkness:Faction {name: 'Gods of Darkness'}),
       (knightsOfSolamnia:Faction {name: 'Knights of Solamnia'}),
       (dragonarmies:Faction {name: 'Dragonarmies'}),
       (blackRobedMages:Faction {name: 'Order of the Black Robes'}),
       (churchOfTakhisis:Faction {name: 'Church of Takhisis'}),
       (qualinestiElves:Faction {name: 'Qualinesti Elves'}),
       (silvanestiElves:Faction {name: 'Silvanesti Elves'}),
       (thorbardinDwarves:Faction {name: 'Dwarves of Thorbardin'});

// Character Nodes
CREATE (astinus:Character {name: "Astinus of Palanthas", race: "Immortal Human", role: "Keeper of History, Scribe of the Iconochronos"}),
       (berem:Character {name: 'Berem Everman', role: 'The Everman'}),
       (bupu:Character {name: "Bupu", race: "Gully Dwarf", role: "Friend of Raistlin"}),
       (caramon:Character {name: "Caramon Majere", race: "Human", role: "Warrior"}),
       (cyan:Character {name: "Cyan Bloodbane", race: "Dragon", color: "Green", role: "Dragon of Darkness"}),
       (dalamar:Character {name: "Dalamar", race: "Elf", role: "Dark Mage"}),
       (fistandantilus:Character {name: "Fistandantilus", race: "Human", role: "Lich"}),
       (flint:Character {name: "Flint Fireforge", race: "Dwarf", role: "Warrior"}),
       (gilthanas:Character {name: "Gilthanas Kanan", race: "Elf", role: "Warrior"}),
       (goldmoon:Character {name: "Goldmoon", race: "Human", role: "Cleric"}),
       (huma:Character {name: "Huma Dragonbane", race: "Human", role: "Knight of Solamnia"}),
       (kharas:Character {name: "Kharas", race: "Dwarf", role: "Hero"}),
       (kitiara:Character {name: "Kitiara Uth Matar", race: "Human", role: "Warrior"}),
       (kronin:Character {name: "Kronin Thistleknot", race: "Kender", role: "Hero"}),
       (laurana:Character {name: "Laurana Kanan", race: "Elf", role: "Leader"}),
       (nathal:Character {name: "Nathal", race: "Human", role: "Chronicler"}),
       (raistlin:Character {name: "Raistlin Majere", race: "Human", role: "Mage"}),
       (riverwind:Character {name: "Riverwind", race: "Human", role: "Warrior"}),
       (sturm:Character {name: "Sturm Brightblade", race: "Human", role: "Knight"}),
       (tanis:Character {name: "Tanis Half-Elven", race: "Half-Elf", role: "Leader"}),
       (tasslehoff:Character {name: "Tasslehoff Burrfoot", race: "Kender", role: "Thief"}),
       (verminaard:Character {name: "Verminaard", race: "Human", role: "Dragon Highlord"});

// Create Relationships between Continents and Cities
CREATE (palanthas)-[:LOCATED_IN]->(ansalon),
       (sanction)-[:LOCATED_IN]->(ansalon),
       (solace)-[:LOCATED_IN]->(ansalon),
       (qualinost)-[:LOCATED_IN]->(ansalon),
       (kenderhome)-[:LOCATED_IN]->(ansalon),
       (thorbardin)-[:LOCATED_IN]->(ansalon),
       (krynn)-[:LOCATED_IN]->(taladas),
       (nethosak)-[:LOCATED_IN]->(taladas),
       (stormkeep)-[:LOCATED_IN]->(otherlands),
       (neraka)-[:LOCATED_IN]->(ansalon),
       (newsea)-[:LOCATED_IN]->(ansalon),
       (tarsis)-[:LOCATED_IN]->(ansalon),
       (icerreach)-[:LOCATED_IN]->(ansalon),
       (nethosak)-[:LOCATED_IN]->(taladas),
       (krynn)-[:LOCATED_IN]->(taladas);

// Create Relationships between Cities and Landmarks
CREATE (palanthas)-[:NEAR]->(highcleriststower),
       (solace)-[:NEAR]->(skullcap),
       (qualinost)-[:NEAR]->(qualinesti),
       (solace)-[:NEAR]->(darkenwood),
       (neraka)-[:NEAR]->(templeoftakhisis),
       (thorbardin)-[:NEAR]->(mountnonala),
       (sanction)-[:NEAR]->(xaktsaroth),
       (icerreach)-[:NEAR]->(icewall),
       (palanthas)-[:NEAR]->(dargaardkeep),
       (tarsis)-[:NEAR]->(bloodsea),
       (neraka)-[:NEAR]->(bloodsea),
       (tarsis)-[:NEAR]->(ergoth),
       (palanthas)-[:NEAR]->(highcleriststower),
       (solace)-[:NEAR]->(skullcap),
       (qualinost)-[:NEAR]->(forestdarken),
       (sanction)-[:NEAR]->(kharolis),
       (kenderhome)-[:NEAR]->(whiterage),
       (nethosak)-[:NEAR]->(bloodstone),
       (stormkeep)-[:NEAR]->(icyseas),
       (solace)-[:NEAR]->(plains),
       (palanthas)-[:NEAR]->(vingaardkeep),
       (sanction)-[:NEAR]->(corinth),
       (krynn)-[:NEAR]->(bloodsea);

// Create Relationships between Cities and Factions
CREATE (palanthas)-[:HOMELAND_OF]->(knightsofsolamnia),
       (neraka)-[:HOMELAND_OF]->(dragonarmies),
       (sanction)-[:HOMELAND_OF]->(dragonarmies),
       (qualinost)-[:HOMELAND_OF]->(qualinestielves),
       (silvanesti)-[:HOMELAND_OF]->(silvanestielves),
       (kenderhome)-[:HOMELAND_OF]->(kender),
       (thorbardin)-[:HOMELAND_OF]->(dwarves);

// Relationships between Characters and Events
CREATE (bupu)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (caramon)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (caramon)-[:PARTICIPATED_IN]->(war_of_the_twins),
       (cyan)-[:PARTICIPATED_IN]->(third_dragon_war),
       (dalamar)-[:PARTICIPATED_IN]->(night_of_the_eye),
       (fistandantilus)-[:ANTAGONIZED_IN]->(dwarfgate_war),
       (flint)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (gilthanas)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (goldmoon)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (huma)-[:PARTICIPATED_IN]->(third_dragon_war),
       (huma)-[:FOUGHT_AGAINST]->(takhisis),
       (kharas)-[:PARTICIPATED_IN]->(dwarfgate_war),
       (kitiara)-[:PARTICIPATED_IN]->(war_of_the_twins),
       (kronin)-[:PARTICIPATED_IN]->(war_of_the_twins),
       (laurana)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (laurana)-[:LEAD]->(war_of_the_blue_lady),
       (lunitari)-[:INTERVENED_IN]->(night_of_the_eye),
       (nuitari)-[:INTERVENED_IN]->(night_of_the_eye),
       (paladine)-[:INTERVENED_IN]->(third_dragon_war),
       (paladine)-[:INTERVENED_IN]->(second_cataclysm),
       (raistlin)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (riverwind)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (solinari)-[:INTERVENED_IN]->(night_of_the_eye),
       (sturm)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (sturm)-[:DIED_IN]->(war_of_the_lance),
       (takhisis)-[:ANTAGONIZED_IN]->(war_of_the_lance),
       (takhisis)-[:ANTAGONIZED_IN]->(war_of_souls),
       (takhisis)-[:ANTAGONIZED_IN]->(third_dragon_war),
       (takhisis_returned)-[:ANTAGONIZED_IN]->(return_of_the_gods),
       (tanis)-[:PARTICIPATED_IN]->(war_of_the_lance),
       (tasslehoff)-[:PARTICIPATED_IN]->(war_of_the_twins),
       (verminaard)-[:PARTICIPATED_IN]->(war_of_the_lance);

// Relationship between Characters
CREATE (caramon)-[:SIBLING_OF]->(raistlin),
       (goldmoon)-[:MARRIED_TO]->(riverwind),
       (laurana)-[:SIBLING_OF]->(gilthanas),
       (laurana)-[:MARRIED_TO]->(tanis),
       (dalamar)-[:MENTORED_BY]->(raistlin),
       (dalamar)-[:BETRAYED_BY]->(raistlin),
       (kitiara)-[:SIBLING_OF]->(raistlin),
       (fistandantilus)-[:MENTORED]->(raistlin),
       (fistandantilus)-[:BETRAYED_BY]->(raistlin);