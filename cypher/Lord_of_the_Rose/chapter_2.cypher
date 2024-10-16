MATCH (c2:Chapter {order:2})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})
MATCH (c1Trip:Trip {name:"visiting Cornellus"})-[:OCCURS]->(:Section {order:1})-[:OF_CHAPTER]->(:Chapter {order:1})-[:OF_BOOK]->(lotr)

MATCH (cornellus:Entity {id:"cornellus"})
MATCH (dram:Entity {id:"dram"})
MATCH (jaymes:Entity {id:"jaymes"})
MATCH (kosRose:Entity {id:"kosRose"})

MERGE (c2s1:Section {name:"chapter 2 section 1",order:1})-[:OF_CHAPTER]->(c2)
MERGE (strongholdCornellus:Entity {id:"strongholdCornellus"})
SET strongholdCornellus:Place:City:Stronghold,
  strongholdCornellus.name = coalesce(strongholdCornellus.name, "The Stronghold of Cornellus")
MERGE (c2s1)-[:SETTING]->(strongholdCornellus)
MERGE (c1Trip)-[:CONTINUES]->(c2s1)
MERGE (c1Trip)-[:TO]->(strongholdCornellus)
MERGE (cornellus)-[:REFERENCE]->(c2s1)
MERGE (cornellus)-[cornellusLeadSC:LEADER_OF]->(strongholdCornellus)
SET  cornellusLeadSC.titleList = apoc.coll.union(["Bandit Lord"],cornellusLeadSC.titleList)
SET cornellus.aliasList = apoc.coll.union(["Cornellus","Cornellus the Large"],cornellus.aliasList)
MERGE (lord:Entity {id:"lord"})
SET  lord:Title,
  lord.title = "Lord"
MERGE (cornellus)-[:ATTAINED_RANK]->(lord)
MERGE (bandit:Entity {id:"bandit"})
SET  bandit:Occupation,
  bandit.name = "Bandit"
MERGE (cornellus)-[:HAS_OCCUPATION]->(bandit)
MERGE (dram)-[:APPEARANCE]->(c2s1)
MERGE (jaymes)-[:APPEARANCE]->(c2s1)
SET cornellus.aliasList = apoc.coll.union(["Cornel"],cornellus.aliasList)
MERGE (knight:Entity {id:"knight"})
SET  knight:Occupation,
  knight.name = "Knight"
MERGE (reynaud:Entity {id:"reynaud"})
SET  reynaud:Human,
  reynaud.name = coalesce(reynaud.name,"Reynaud"),
  reynaud.titleList = apoc.coll.union(["sir"],reynaud.titleList)
MERGE (reynaud)-[:APPEARANCE]->(c2s1)
MERGE (reynaud)-[:HAS_OCCUPATION]->(knight)
MERGE (reynaud)-[:MEMBER_OF]->(kosRose)
MERGE (reynaud)-[:CONVERSATION {reference:"Lord of the Rose:c2s1",dialog_exchange:6}]->(jaymes)
MERGE (dram)-[:CONVERSATION {reference:"Lord of the Rose:c2s1", dialog_exchange:1}]->(reynaud)
MERGE (kayolin:Entity {id:"kayolin"})
SET  kayolin:Place:Kingdom,
  kayolin.name = coalesce(kayolin.name,"Kayolin")
MERGE (dram)-[:ORIGINATES_FROM]->(kayolin)
