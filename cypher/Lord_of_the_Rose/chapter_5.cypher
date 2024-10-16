MATCH (c5:Chapter {order:5})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})
MATCH (strongholdCornellus:Entity {id:"strongholdCornellus"})
MATCH (garnet:Entity {id:"garnet"})
MATCH (dram:Entity {id:"dram"})
MATCH (jaymes:Entity {id:"jaymes"})
MATCH (shinare:Entity {id:"shinare"})
MATCH (orderShinare:Entity {id:"orderShinare"})
MATCH (merchant:Entity {id:"merchant"})
MATCH (lorimar:Entity {id:"lorimar"})
MATCH (reynaud:Entity {id:"reynaud"})
MATCH (captain:Entity {id:"captain"})
MATCH (crawford:Entity {id:"crawford"})
MATCH (patriarch:Entity {id:"patriarch"})
MATCH (priest:Entity {id:"priest"})

//-- c5s1
MERGE (c5s1:Section {name:"chapter 5 section 1",order:1})-[:OF_CHAPTER]->(c5)
MERGE (strCornellus2GarnetByLand:Entity {id:"strCornellus2GarnetByLand"})
SET strCornellus2GarnetByLand:Route,
  strCornellus2GarnetByLand.description = coalesce(strCornellus2GarnetByLand.description, "The road from the stronghold of the bandit lord Cornellus to the free city of Garnet")
SET strCornellus2GarnetByLand.descriptionList = apoc.coll.union([strCornellus2GarnetByLand.description], strCornellus2GarnetByLand.descriptionList)
MERGE (c5s1)-[:SETTING  {year:"42 SC"}]->(strCornellus2GarnetByLand)
MERGE (strCornellus2GarnetByLand)-[:FROM]->(strongholdCornellus)
MERGE (strCornellus2GarnetByLand)-[:TO]->(garnet)
MERGE (dram)-[:APPEARANCE]->(c5s1)
MERGE (jaymes)-[:APPEARANCE]->(c5s1)
MERGE (c5Trip:Trip {name: "escape from Cornellus"})-[:OCCURS]->(c5s1)
MERGE (c5Trip)-[:FROM]->(strongholdCornellus)
MERGE (c5Trip)-[:TO]->(garnet)
MERGE (c5Trip)-[:VIA_ROUTE]->(strCornellus2GarnetByLand)
MERGE (c5Trip)-[:PARTY_MEMBER]->(dram)
MERGE (c5Trip)-[:PARTY_MEMBER]->(jaymes)
MERGE (krynn:Entity {id:"krynn"})
SET  krynn:Place:World,
  krynn.name = "Krynn"
MERGE (solinari:Entity {id:"solinari"})
SET  solinari:Place:Moon,
  solinari.name = coalesce(solinari.name,"Solinari"),
  solinari.aliasList = apoc.coll.union(["Solinari"],solinari.nameList),
  solinari.description = coalesce(solinari.description,"The White Moon of Krynn"),
  solinari.descriptionList = apoc.coll.union(["The White Moon of Krynn"],solinari.descriptionList)
MERGE (solinari)-[:MOON_OF]->(krynn)
SET c5Trip.modeOfTravel = "horseback",
  c5Trip.duration = "about 4 days"

//-- c5s2
MERGE (c5s2:Section {name:"chapter 5 section 2",order:2})-[:OF_CHAPTER]->(c5)
MERGE (c5s2)-[:SETTING]->(garnet)
MERGE (dram)-[:APPEARANCE]->(c5s2)
MERGE (jaymes)-[:APPEARANCE]->(c5s2)
MERGE (tShinareGarnet:Entity {id:"tShinareGarnet"})
SET  tShinareGarnet:Place:POI:Temple,
  tShinareGarnet.name = coalesce(tShinareGarnet.name,"The Temple of Shinare in Garnet")
MERGE (tShinareGarnet)-[:IN]->(garnet)
MERGE (orderShinare)-[:HAS_STRONGHOLD]->(tShinareGarnet)
SET  shinare.aliasList = apoc.coll.union(["Winged Victory","moneyhandler's scales","The Silver Mistress"], shinare.aliasList)
MERGE (shinare)-[:GOD_OF]->(merchant)
MERGE (thief:Entity {id:"thief"})
SET  thief:Occupation,
  thief.name = "Thief"
MERGE (shinare)-[:GOD_OF]->(thief)
MERGE (thorbardin:Entity {id:"thorbardin"})
SET  thorbardin:Place:Kingdom,
  thorbardin.name = "Thorbardin"
MERGE (reorx:Entity {id:"reorx"})
SET  reorx:God,
  reorx.name = coalesce(reorx.name,"Reorx"),
  reorx.aliasList = apoc.coll.union(["Reorx"],reorx.aliasList)
MERGE (dara:Entity {id:"dara"})
SET  dara:Human,
  dara.name = coalesce(dara.name,"Dara Lorimar"),
  dara.aliasList = apoc.coll.union(["Dara Lorimar","Princess of the Plains"],dara.aliasList),
  dara.title = coalesce(dara.title,"lady"),
  dara.titleList = apoc.coll.union(["lady","princess"],dara.titleList),
  dara.birthyear = coalesce(dara.birthyear,"20 SC")
MERGE (dara)-[:REFERENCE]->(c5s2)
MERGE (lorimar)-[:REFERENCE]->(c5s2)
MERGE (dara)-[daraIsOfLorimar:IS_A_x_OF]->(lorimar)
SET  daraIsOfLorimar.descriptor = coalesce(daraIsOfLorimar.descriptor,"daughter"),
  daraIsOfLorimar.descriptorList = apoc.coll.union(["daughter"],daraIsOfLorimar.descriptorList)
MERGE (reynaud)-[:APPEARANCE]->(c5s2)
SET reynaud.titleList = apoc.coll.union(["captain"],reynaud.titleList)
MERGE (reynaud)-[:ATTAINED_RANK]->(captain)
MERGE (crawford)-[:REFERENCE]->(c5s2)
MERGE (c5s2)-[:SETTING]->(tShinareGarnet)
MERGE (c5e:Encounter {name:"heist at the Temple of Shinare in Garnet"})-[:OCCURS]->(c5s2)
MERGE (c5e)-[:SETTING]->(tShinareGarnet)
MERGE (dram)-[:PROTAGONIST]->(c5e)<-[:PROTAGONIST]-(jaymes)
MERGE (patriarchTempShinGarn:Combatant:Human {name:"Patriarch of the Temple of Shinare in Garnet"})-[:ANTAGONIST]->(c5s2)
MERGE (patriarchTempShinGarn)-[:APPEARANCE]->(c5s2)
MERGE (patriarchTempShinGarn)-[:LEADER_OF {title:"Temple Master"}]->(tShinareGarnet)
MERGE (patriarchTempShinGarn)-[:HAS_OCCUPATION]->(priest)
MERGE (patriarchTempShinGarn)-[:ATTAINED_RANK]->(patriarch)
MERGE (patriarchTempShinGarn)-[:CONVERSATION {reference:"Lord of the Rose:c5s2", dialog_exchange:2}]->(dram)
MERGE (patriarchTempShinGarn)-[:CONVERSATION {reference:"Lord of the Rose:c5s2", dialog_exchange:8}]->(jaymes)
MERGE (patriarchTempShinGarn)-[:SLAIN_BY {description:"a crossbow dart to the chest, he collapsed with a groan. The power of his spell was broken in that instant"}]-(jaymes)
