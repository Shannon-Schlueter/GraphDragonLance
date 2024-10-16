MATCH (c6:Chapter {order:6})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})

//-- c6s1
MERGE (c6s1:Section {name:"chapter 6 section 1",order:1})-[:OF_CHAPTER]->(c6)
MERGE (overlord:Entity {id:"overlord"})
SET  overlord:Title,
  overlord.title = "Overlord"
MERGE (khellendros:Entity {id:"khellendros"})
SET  khellendros:Dragon,
  khellendros.name = coalesce(khellendros.name,"Khellendros"),
  khellendros.title = coalesce(khellendros.title,"overlord"),
  khellendros.titleList = apoc.coll.union(["overlord"],khellendros.titleList)
MERGE (khellendros)-[:REFERENCE]->(c6s1)
MERGE (khellendros)-[:ATTAINED_RANK]->(overlord)
MERGE (beryl:Entity {id:"beryl"})
SET  beryl:Dragon,
  beryl.name = coalesce(beryl.name,"Khellendros"),
  beryl.title = coalesce(beryl.title,"overlord"),
  beryl.titleList = apoc.coll.union(["overlord"],beryl.titleList)
MERGE (beryl)-[:REFERENCE]->(c6s1)
MERGE (beryl)-[:ATTAINED_RANK]->(overlord)
MERGE (ariakan:Entity {id:"ariakan"})
SET  ariakan.name = coalesce(ariakan.name,"Ariakan"),
  ariakan.aliasList = apoc.coll.union(["Lord Ariakan"],ariakan.aliasList),
  ariakan.title = coalesce(ariakan.title,"lord"),
  ariakan.titleList = apoc.coll.union(["lord"],ariakan.titleList)
MERGE (chieftain:Entity {id:"chieftain"})
MERGE (bonechisel:Entity {id:"bonechisel"})
SET  bonechisel:Hobgoblin,
  bonechisel.name = coalesce(bonechisel.name,"Bonechisel"),
  bonechisel.aliasList = apoc.coll.union(["Bonechisel","Bonechisel Hobgoblin", "Bonechisel Hob"], bonechisel.aliasList),
  bonechisel.title = coalesce(bonechisel.title,"chieftain"),
  bonechisel.titleList = apoc.coll.union(["chieftain"], bonechisel.titleList)
MERGE (bonechisel)-[:APPEARANCE]->(c6s1)
MERGE (bonechisel)-[:SUBORDINATE_OF]->(ariakan)
MERGE (bonechisel)-[:ATTAINED_RANK]->(chieftain)
MERGE (laka:Entity {id:"laka"})
SET  laka:Hobgoblin,
  laka.name = coalesce(laka.name,"Laka"),
  laka.aliasList = apoc.coll.union(["Laka Hobgoblin","Laka, wife of Bonechisel"],laka.aliasList)
MERGE (laka)-[:APPEARANCE]->(c6s1)
MERGE (laka)-[lakaIsOfBonechisel:IS_A_x_OF]->(bonechisel)
SET lakaIsOfBonechisel.descriptor = coalesce(lakaIsOfBonechisel.descriptor,"wife"),
  lakaIsOfBonechisel.descriptorList = apoc.coll.union(["wife"], lakaIsOfBonechisel.descriptorList)
MERGE (c6e:Encounter {description:"Bonechisel looking for shelter"})-[:OCCURS]->(c6s1)
MERGE (bonechisel)-[:PROTAGONIST]->(c6e)<-[:PROTAGONIST]-(laka)
MERGE (c6e)-[:ANTAGONIST]->(unGiant:Combatant:Giant {name:"unknown"})
MERGE (unGiant)-[:SLAIN_BY {description:"granite axe to the forehead"}]->(bonechisel)
SET bonechisel.name = "Bonechisel Giant-Slayer",
  bonechisel.aliasList = apoc.coll.union(["Bonechisel Giant-Slayer"], bonechisel.aliasList)
MERGE (bonechisel)-[:CONVERSATION {reference:"Lord of the Rose:c6s1", dialog_exchange:2}]->(laka)
MERGE (ankhar:Entity {id:"ankhar"})
SET  ankhar:HalfOgre:HalfGiant,
  ankhar.name = coalesce(ankhar.name,"Ankhar"),
  ankhar.aliasList = apoc.coll.union(["Ankhar"],ankhar.aliasList)
MERGE (ankhar)-[ankharIsOfLaka:IS_A_x_OF]->(laka)
SET  ankharIsOfLaka.descriptor = coalesce(ankharIsOfLaka.descriptor,"adopted son"),
  ankharIsOfLaka.descriptorList = apoc.coll.union(["adopted son"], ankharIsOfLaka.descriptorList)
MERGE (ankhar)-[ankharIsOfBonechisel:IS_A_x_OF]->(bonechisel)
SET  ankharIsOfBonechisel.descriptor = coalesce(ankharIsOfBonechisel.descriptor, "adopted son"),
  ankharIsOfBonechisel.descriptorList = apoc.coll.union(["adopted son"], ankharIsOfBonechisel.descriptorList)

//-- c6s2
MERGE (c6s2:Section {name:"chapter 6 section 2",order:2})-[:OF_CHAPTER]->(c6)
SET ankhar.birthyearAC = 405,
  ankhar.birthyearSC = 22
MERGE (hiddukel:Entity {id:"hiddukel"})
SET  hiddukel:God,
  hiddukel.name = coalesce(hiddukel.name,"Hiddukel"),
  hiddukel.aliasList = apoc.coll.union(["Hiddukel","Prince of Lies"], hiddukel.aliasList)
MERGE (highPriest:Entity {id:"highPriest"})
SET  highPriest:Title,
  highPriest.title = "High Priest"
MERGE (laka)-[:ATTAINED_RANK]->(highPriest)
SET laka.title = coalesce(laka.title,"high priestess"),
  laka.titleList = apoc.coll.union(["high priestess"], laka.titleList)
MERGE (laka)-[:WORSHIP]->(hiddukel)
MERGE (tinCup:Entity {id:"tinCup"})
SET  tinCup:Place:City,
  tinCup.name = coalesce(tinCup.name,"Tin Cup"),
  tinCup.aliasList = apoc.coll.union(["Tin Cup"], tinCup.aliasList)
MERGE (c6s2)-[c6s2setting:SETTING]->(tinCup)
SET c6s2setting.yearSC = 40,
  c6s2setting.yearAC = 423
MERGE (bonechisel)-[:SLAIN_BY]->(ankhar)
MERGE (bonechisel)-[:APPEARANCE]->(c6s2)
MERGE (ankhar)-[:APPEARANCE]->(c6s2)
MERGE (laka)-[:APPEARANCE]->(c6s2)
