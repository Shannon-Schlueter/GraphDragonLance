MERGE (c1:Chapter {order:1})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})

MERGE (c1s1:Section {name:"chapter 1 section 1",order:1})-[:OF_CHAPTER]->(c1)
MERGE (cornellus:Entity {id:"cornellus"})
SET cornellus:HalfOgre:HalfHuman,
  cornellus.name = coalesce(cornellus.name,"Cornellus")
MERGE (cornellus)-[:REFERENCE]->(c1s1)
MERGE (dram:Entity {id:"dram"})
SET  dram:Dwarf,
  dram.name = coalesce(dram.name,"Dram Feldspar")
MERGE (dram)-[:APPEARANCE]->(c1s1)
MERGE (jaymes:Entity {id:"jaymes"})
SET  jaymes:Human,
  jaymes.name = coalesce(jaymes.name,"Jaymes Markham"),
  jaymes.aliasList = apoc.coll.union(["Stranger", "Warrior"],jaymes.aliasList),
  jaymes.rightHanded = TRUE
MERGE (jaymes)-[:APPEARANCE]->(c1s1)
MERGE (c1Trip:Trip {name:"visiting Cornellus"})-[:OCCURS]->(c1s1)
MERGE (dram)-[:PARTY_MEMBER]->(c1Trip)
MERGE (jaymes)-[:PARTY_MEMBER]->(c1Trip)
MERGE (c1Encounter:Encounter {name:"skirmish at the Garnet foothills",type:"skirmish"})-[:OCCURS]->(c1s1)
MERGE (c1Encounter)-[:PROTAGONIST]->(dram)
MERGE (c1Encounter)-[:PROTAGONIST]->(jaymes)
MERGE (c1Encounter)-[:ANTAGONIST]->(e1p1:Party {name:"Bandits of Cornellus",combatants:7})
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant {name:"Unnamed",order:1,species:"unknown"})-[:SLAIN_BY]->(dram)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Human {name:"Unnamed",order:2,species:"human"})-[:SLAIN_BY]->(jaymes)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Human {name:"Unnamed",order:3,species:"human"})-[:SLAIN_BY]->(jaymes)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Draconian {name:"Unnamed",order:4,species:"baaz draconian"})-[:SLAIN_BY]->(dram)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Draconian {name:"Unnamed",order:5,species:"baaz draconian"})-[:SLAIN_BY]->(dram)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Draconian {name:"Unnamed",order:6,species:"baaz draconian"})-[:SLAIN_BY]->(dram)
MERGE (e1p1)-[:PARTY_MEMBER]->(:Combatant:Draconian {name:"Unnamed",order:7,species:"kapak draconian"})-[:SLAIN_BY]->(jaymes)
MERGE (fighter:Entity {id:"fighter"})
SET  fighter:Occupation,
  fighter.name = coalesce(fighter.name,"Fighter")
MERGE (dram)-[:HAS_OCCUPATION]->(fighter)
MERGE (jaymes)-[:HAS_OCCUPATION]->(fighter)
