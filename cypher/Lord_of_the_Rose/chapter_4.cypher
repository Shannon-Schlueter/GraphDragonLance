MATCH (c4:Chapter {order:4})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})

MATCH (palanthas:Entity {id:"palanthas"})
MATCH (solanthus:Entity {id:"solanthus"})
MATCH (caergoth:Entity {id:"caergoth"})
MATCH (thelgaard:Entity {id:"thelgaard"})
MATCH (darkKnights:Entity {id:"darkKnights"})
MATCH (kos:Entity {id:"kos"})
MATCH (kosCrown:Entity {id:"kosCrown"})
MATCH (kosRose:Entity {id:"kosRose"})
MATCH (kosSword:Entity {id:"kosSword"})
MATCH (duke:Entity {id:"duke"})
MATCH (captain:Entity {id:"captain"})
MATCH (takhisis:Entity {id:"takhisis"})
MATCH (bakkard:Entity {id:"bakkard"})
MATCH (mina:Entity {id:"mina"})
MATCH (tasgall:Entity {id:"tasgall"})
MATCH (coryn:Entity {id:"coryn"})
MATCH (jenna:Entity {id:"jenna"})
MATCH (crawford:Entity {id:"crawford"})

//-- Activity in c4s1
MERGE (c4s1:Section {name:"chapter 4 section 1",order:1})-[:OF_CHAPTER]->(c4)
MERGE (c4s1)-[:SETTING  {year:"42 SC"}]->(palanthas)
MERGE (goldenSpire:Entity {id:"goldenSpire"})
SET  goldenSpire:Place:POI:Treasury,
  goldenSpire.name = "The Golden Spire"
MERGE (c4s1)-[:SETTING  {year:"42 SC"}]->(goldenSpire)
MERGE (goldenSpire)-[:IN]->(palanthas)
MERGE (bakkard)-[:APPEARANCE]->(c4s1)
MERGE (bakkard)-[bakkardLeadTGS:LEADER_OF]->(goldenSpire)
SET bakkardLeadTGS.titleList = apoc.coll.union(["owner","key holder"],bakkardLeadTGS.titleList)
MERGE (kot)-[:REFERENCE]->(c4s1)
MERGE (takhisis)-[:REFERENCE]->(c4s1)
MERGE (mina)-[:REFERENCE]->(c4s1)
MERGE (tasgall)-[:REFERENCE]->(c4s1)
MERGE (coryn)-[:REFERENCE]->(c4s1)
MERGE (rathskell:Entity {id:"rathskell"})
SET  rathskell:Human,
  rathskell.name = coalesce(rathskell.name,"Rathskell"),
  rathskell.titleList = apoc.coll.union(["duke","lord"],rathskell.titleList),
  rathskell.aliasList = apoc.coll.union(["Rathskell","Duke Rathskell","Duke of Solanthus","Lord of the Sword","Master of the Garnet Spur","Inheritor of the Silver Blade","Guardian of the Solamnic Code"],rathskell.aliasList)
MERGE (rathskell)-[:REFERENCE]->(c4s1)
MERGE (rathskell)-[:LIVES_IN]->(solanthus)
MERGE (rathskellInvDukeSola:Entity {id:"rathskellInvDukeSola"})
SET  rathskellInvDukeSola:Investiture,
  rathskellInvDukeSola.year = "40 SC",
  rathskellInvDukeSola.description = "Invested as the Duke of Solanthus"
MERGE (rathskellInvDukeSola)-[:OVER]->(solanthus)
MERGE (rathskellInvDukeSola)-[:WITH_TITLE]->(duke)
MERGE (rathskell)-[:INVESTED]->(rathskellInvDukeSola)
MERGE (rathskell)-[rathskellLeadSolanthus:LEADER_OF]->(solanthus)
SET rathskellLeadSolanthus.titleList = apoc.coll.union(["Duke of Solanthus"],rathskellLeadSolanthus.titleList)
MERGE (rathskell)-[:ATTAINED_RANK]->(duke)
MERGE (rathskell)-[rathskellLeadKosSword:LEADER_OF]->(kosSword)
SET rathskellLeadKosSword.titleList = apoc.coll.union(["Lord of the Sword"],rathskellLeadKosSword.titleList)
MERGE (dekage:Entity {id:"dekage"})
SET  dekage:Human,
  dekage.name = coalesce(dekage.name,"Dekage"),
  dekage.titleList = apoc.coll.union(["baron"],dekage.titleList)
MERGE (dekage)-[:APPEARANCE]->(c4s1)
MERGE (dekage)-[:CONVERSATION {reference: "Lord of the Rose:c4s1", dialog_exchange: 27}]->(bakkard)
MERGE (selinda:Entity {id:"selinda"})
SET selinda:Human,
  selinda.aliasList = apoc.coll.union(["Lady of Palanthas", "Princess of Palanthas"],selinda.aliasList),
  selinda.birthYear = "24 SC",
  selinda.hairColor = "fine-spun gold",
  selinda.name = coalesce(selinda.name,"Selinda Du Chagne"),
  selinda.titleList = apoc.coll.union(["lady", "princess"],selinda.titleList)
MERGE (selinda)-[:REFERENCE]->(c4s1)
MERGE (selinda)-[selindaIsOfBakkard:IS_A_x_OF {descriptor: "Daughter"}]->(bakkard)
SET selindaIsOfBakkard.child = TRUE,
  selindaIsOfBakkard.descriptorList = apoc.coll.union(["Daughter"], selindaIsOfBakkard.descriptorList)
MERGE (c4Trip:Trip {name:"Whitestone contingent Palanthus to Caergoth"})-[:OCCURS]->(c4s1)
MERGE (selinda)-[:PARTY_MEMBER]->(c4Trip)
MERGE (p2cBySea:Entity {id:"p2cBySea"})
SET  p2cBySea:Route,
  p2cBySea.descriptionList = apoc.coll.union(["Palanthas to Caergoth by boat. Down the western shore of Solamnia. Through the waters of Coastlund, Vinlund, and Southlund"],p2cBySea.descriptionList)
MERGE (c4Trip)-[:VIA_ROUTE]->(p2cBySea)
MERGE (c4Trip)-[:FROM]->(palanthas)
MERGE (p2cBySea)-[:FROM]->(palanthas)
MERGE (c4Trip)-[:TO]->(caergoth)
MERGE (p2cBySea)-[:TO]->(caergoth)
MERGE (marrett:Entity {id:"marrett"})
SET marrett:Human,
  marrett.name = coalesce(marrett.name,"Marrett"),
  marrett.titleList = apoc.coll.union(["lord"],marrett.titleList)
MERGE (marrett)-[:REFERENCE]->(c4s1)
MERGE (marrett)-[:LIVES_IN]->(caergoth)
MERGE (admiral:Entity {id:"admiral"})
SET  admiral:Title,
  admiral.title = "Admiral"
MERGE (marrett)-[:ATTAINED_RANK]->(admiral)
MERGE (marrett)-[:SUBORDINATE_OF]->(bakkard)
MERGE (hower:Entity {id:"hower"})
SET  hower:Human,
  hower.name = coalesce(hower.name,"Hower"),
  hower.titleList = apoc.coll.union(["patriarch","high priest","father"],hower.titleList)
MERGE (hower)-[:APPEARANCE]->(c4s1)
MERGE (hower)-[:CONVERSATION {reference:"Lord of the Rose:c4s1",dialog_exchange:8}]->(bakkard)
MERGE (priest:Entity {id:"priest"})
SET  priest:Occupation,
  priest.name = "Priest"
MERGE (hower)-[priestHower:HAS_OCCUPATION]->(priest)
SET  priestHower.titleList = apoc.coll.union(["patriarch","high priest","father"],priestHower.titleList)
MERGE (patriarch:Entity {id:"patriarch"})
SET  patriarch:Title,
  patriarch.title = "Patriarch"
MERGE (hower)-[:ATTAINED_RANK]->(patriarch)
MERGE (orderShinare:Entity {id:"orderShinare"})
SET  orderShinare:Group,
  orderShinare.name = coalesce(orderShinare.name,"The Priestly Order of Shinare")
MERGE (hower)-[howerMemShinare:MEMBER_OF]->(orderShinare)
SET howerMemShinare.titleList = apoc.coll.union(["Patriarch of the Palanthian Temple of Shinare"],howerMemShinare.titleList)
MERGE (tShinarePalanthas:Entity {id:"tShinarePalanthas"})
SET  tShinarePalanthas:Place:POI:Temple,
  tShinarePalanthas.name = coalesce(tShinarePalanthas.name,"Temple of Shinare in Palanthas")
MERGE (tShinarePalanthas)-[:IN]->(palanthas)
MERGE (orderShinare)-[:HAS_STRONGHOLD]->(tShinarePalanthas)
MERGE (hower)-[howerLeadTempShinare:LEADER_OF]->(tShinarePalanthas)
SET howerLeadTempShinare.title = "Temple Master"
MERGE (howerInvPatTemShiPal:Entity {id:"howerInvPatTemShiPal"})
SET  howerInvPatTemShiPal:Investiture,
  howerInvPatTemShiPal.description = "Invested as the Patriarch and Temple Master of the Temple of Shinare in Palanthas"
MERGE (howerInvPatTemShiPal)-[:OVER]->(tShinarePalanthas)
MERGE (howerInvPatTemShiPal)-[:WITH_TITLE]->(patriarch)
MERGE (issel:Entity {id:"issel"})
SET  issel:Human,
  issel.name = coalesce(issel.name,"Issel"),
  issel.titleList = apoc.coll.union(["patriarch","high priest","father"],issel.titleList)
MERGE (issel)-[:REFERENCE]->(c4s1)
MERGE (issel)-[priestIssel:HAS_OCCUPATION {current_rank:"Patriarch"}]->(priest)
SET priestIssel.titleList = apoc.coll.union(["patriarch","high priest","father"],priestIssel.titleList)
MERGE (issel)-[:ATTAINED_RANK]->(patriarch)
MERGE (issel)-[isselMemShinare:MEMBER_OF {title:"Patriarch of the Caergoth Temple of Shinare"}]->(orderShinare)
SET isselMemShinare.titleList = apoc.coll.union(["Patriarch of the Palanthian Temple of Shinare"],isselMemShinare.titleList)
MERGE (tShinareCaergoth:Entity {id:"tShinareCaergoth"})
SET  tShinareCaergoth:Place:POI:Temple,
  tShinareCaergoth.name = coalesce(tShinareCaergoth.name,"Temple of Shinare in Caergoth")
MERGE (tShinareCaergoth)-[:IN]->(caergoth)
MERGE (orderShinare)-[:HAS_STRONGHOLD]->(tShinareCaergoth)
MERGE (issel)-[isselLeadTempShinare:LEADER_OF]->(tShinareCaergoth)
SET  isselLeadTempShinare.title = "Temple Master"
MERGE (isselInvPatTemShiCae:Entity {id:"isselInvPatTemShiCae"})
SET  isselInvPatTemShiCae:Investiture,
  isselInvPatTemShiCae.description = "Invested as the Patriarch and Temple Master of the Temple of Shinare in Caergoth"
MERGE (ipotc)-[:OVER]->(tShinareCaergoth)
MERGE (ipotc)-[:WITH_TITLE]->(patriarch)
MERGE (jarrod:Entity {id:"jarrod"})
SET  jarrod:Human,
  jarrod.name = coalesce(jarrod.name,"Jarrod Yorgan"),
  jarrod.titleList = apoc.coll.union(["duke","lord","sir"],jarrod.titleList),
  jarrod.aliasList = apoc.coll.union(["Jarrod Yorgan","Duke Jarrod","Duke of Thelgaard","Lord of the Crown","Keeper of the Great Plain","Heir to the Throne of the White Swan"],jarrod.aliasList)
MERGE (jarrod)-[:REFERENCE]->(c4s1)
MERGE (jarrod)-[:ATTAINED_RANK]->(duke)
MERGE (jarrod)-[:LIVES_IN]->(thelgaard)
MERGE (jarrod)-[jarrodLeadThel:LEADER_OF]->(thelgaard)
SET  jarrodLeadThel.titleList = apoc.coll.union(["Duke of Thelgaard"], jarrodLeadThel.titleList)
MERGE (jarrodInvDukeThel:Entity {id:"jarrodInvDukeThel"})
SET  jarrodInvDukeThel:Investiture,
  jarrodInvDukeThel.description = "Invested as the Duke of Thelgaard"
MERGE (jarrod)-[:INVESTED]->(idot)
MERGE (idot)-[:WITH_TITLE]->(duke)
MERGE (idot)-[:OVER]->(thelgaard)
MERGE (jarrod)-[jarrodLeadKosCrown:LEADER_OF]->(kosCrown)
SET  jarrodLeadKosCrown.titleList = apoc.coll.union(["Lord of the Crown"], jarrodLeadKosCrown.titleList)

//-- Activity in c4s2
MERGE (c4s2:Section {name:"chapter 4 section 2",order:2})-[:OF_CHAPTER]->(c4)
MERGE (c4s2)-[:SETTING]->(caergoth)
MERGE (crawford)-[:APPEARANCE]->(c4s2)
MERGE (crawford)-[crawfordLeadKosRose:LEADER_OF]->(kosRose)
SET  crawfordLeadKosRose.titleList = apoc.coll.union(["Lord of the Rose"], crawfordLeadKosRose.titleList)
MERGE (bakkard)-[:APPEARANCE]->(c4s2)
MERGE (crawford)-[:CONVERSATION {reference:"Lord of the Rose:c4s2", dialog_exchange:9}]->(bakkard)
MERGE (selinda)-[:REFERANCE]->(c4s2)
MERGE (c4Trip)-[:REFERENCE]->(c4s2)
MERGE (marckus:Entity {id:"marckus"})
SET  marckus:Human,
  marckus.name = coalesce(marckus.name,"Marckus Haum"),
  marckus.titleList = apoc.coll.union(["sir","captain"],marckus.titleList),
  marckus.aliasList = apoc.coll.union(["Marckus Haum","Captain Marckus","Captain of the Ducal Guard"],marckus.aliasList)
MERGE (marckus)-[:APPEARANCE]->(c4s2)
MERGE (ducalGuard:Entity {id:"ducalGuard"})
SET  ducalGuard:Group,
  ducalGuard.name = coalesce(ducalGuard.name,"The Ducal Guard")
MERGE (marckus)-[marckusMemDuc:MEMBER_OF]->(ducalGuard)
SET marckusMemDuc.titleList = apoc.coll.union(["Captain of the Ducal Guard"], marckusMemDuc.titleList)
MERGE (ducalGuard)-[:UNIT_OF]->(kosRose)
MERGE (marckus)-[:SUBORDINATE_OF]->(crawford)
MERGE (marckus)-[:ATTAINED_RANK]->(captain)
MERGE (marckus)-[:CONVERSATION {reference:"Lord of the Rose:c4s2", dialog_exchange:8}]->(crawford)

//-- Activity in c4s3
MERGE (c4s3:Section {name:"chapter 4 section 3",order:3})-[:OF_CHAPTER]->(c4)
MERGE (c4s3)-[:SETTING]->(caergoth)
MERGE (c4Trip)-[:REFERENCE]->(c4s3)
MERGE (powell:Entity {id:"powell"})
SET  powell:Human,
  powell.name = coalesce(powell.name,"Powell"),
  powell.titleList = apoc.coll.union(["captain","sir"],powell.titleList),
  powell.aliasList = apoc.coll.union(["Powell","Captain of the Palanthian Guards"],powell.aliasList)
MERGE (powell)-[:APPEARANCE]->(c4s3)
MERGE (powell)-[:ATTAINED_RANK]->(captain)
MERGE (palanthianGuards:Entity {id:"palanthianGuards"})
SET  palanthianGuards:Group,
  palanthianGuards.name = coalesce(palanthianGuards.name,"The Palanthian Guards")
MERGE (powell)-[powellMemPalaGuar:MEMBER_OF]->(palanthianGuards)
SET  powellMemPalaGuar.titleList = apoc.coll.union(["Captain of the Palanthian Guards"], powellMemPalaGuar.titleList)
MERGE (c4Trip)-[:PARTY_MEMBER]->(powell)
MERGE (selinda)-[:APPEARANCE]->(c4s3)
MERGE (marckus)-[:APPEARANCE]->(c4s3)
MERGE (issel)-[:APPEARANCE]->(c4s3)
MERGE (issel)-[:CONVERSATION {reference:"Lord of the Rose:c4s3", dialog_exchange:3}]->(selinda)
MERGE (martha:Entity {id:"martha"})
SET  martha:Human,
  martha.name = coalesce(martha.name,"Martha"),
  martha.titleList = apoc.coll.union(["lady","duchess"],martha.titleList),
  martha.aliasList = apoc.coll.union(["Martha","Duchess of Caergoth"], martha.aliasList)
MERGE (martha)-[:APPEARANCE]->(c4s3)
MERGE (martha)-[marthaIsOfCrawford:IS_A_x_OF {descriptor:"wife",spouse:TRUE}]->(crawford)
SET  marthaIsOfCrawford.spouse = TRUE,
  marthaIsOfCrawford.descriptor = coalesce(marthaIsOfCrawford.descriptor,"wife"),
  marthaIsOfCrawford.descriptorList = apoc.coll.union(["wife"], marthaIsOfCrawford.descriptorList)
MERGE (martha)-[:CONVERSATION {reference:"Lord of the Rose:c4s3", dialog_exchange:3}]->(selinda)
MERGE (crawford)-[:APPEARANCE]->(c4s3)
MERGE (crawford)-[:CONVERSATION {reference:"Lord of the Rose:c4s3", dialog_exchange:2}]->(selinda)

//-- Activity in c4s4
MERGE (c4s4:Section {name:"chapter 4 section 4",order:4})-[:OF_CHAPTER]->(c4)
MERGE (c4s4)-[:SETTING]->(palanthas)
MERGE (manorJenna:Entity {id:"manorJenna"})
SET  manorJenna:Place:POI:Manorhouse,
  manorJenna.name = coalesce(manorJenna.name,"The Manorhouse of Lady Jenna of the Red Robes")
MERGE (manorJenna)-[:IN]->(palanthas)
MERGE (c4s4)-[:SETTING]->(manorJenna)
MERGE (jenna)-[jennaLeadManor:LEADER_OF]->(manorJenna)
SET  jennaLeadManor.titleList = apoc.coll.union(["owner"],jennaLeadManor.titleList)
MERGE (coryn)-[:APPEARANCE]->(c4s4)
MERGE (jenna)-[:REFERENCE]->(c4s4)
MERGE (crawford)-[:REFERENCE]->(c4s4)
MERGE (martha)-[:REFERENCE]->(c4s4)
MERGE (bakkard)-[:REFERENCE]->(c4s4)
MERGE (jarrod)-[:REFERENCE]->(c4s4)
MERGE (rathskell)-[:REFERENCE]->(c4s4)
