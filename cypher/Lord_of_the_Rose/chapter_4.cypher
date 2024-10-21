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
MERGE (bakkard)-[bakkardLeadTGS:LEADER_OF]->(goldenSpire)
SET bakkardLeadTGS.titleList = apoc.coll.union(["owner","key holder"],bakkardLeadTGS.titleList)
MERGE (rathskell:Entity {id:"rathskell"})
SET  rathskell:Human,
  rathskell.name = coalesce(rathskell.name,"Rathskell"),
  rathskell.titleList = apoc.coll.union(["excellency","duke","lord","sir"],rathskell.titleList),
  rathskell.aliasList = apoc.coll.union(["Rathskell","Duke Rathskell of Solanthus","Lord of the Sword","Master of the Garnet Spur","Inheritor of the Silver Blade","Guardian of the Solamnic Code"],rathskell.aliasList)
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
MERGE (c4conv1 {id:"c4conv1"})-[:OCCURS]->(c4s1)
SET bakkard.titleList = apoc.coll.union(["excellency"],bakkard.titleList)
MERGE (selinda:Entity {id:"selinda"})
SET selinda:Human,
  selinda.aliasList = apoc.coll.union(["Lady of Palanthas", "Princess of Palanthas"],selinda.aliasList),
  selinda.birthYear = "24 SC",
  selinda.hairColor = "fine-spun gold",
  selinda.name = coalesce(selinda.name,"Selinda Du Chagne"),
  selinda.titleList = apoc.coll.union(["lady", "princess"],selinda.titleList)
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
MERGE (c4conv2 {id:"c4conv2"})-[:OCCURS]->(c4s1)
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
MERGE (c4conv3 {id:"c4conv"})-[:OCCURS]->(c4s1)
MERGE (jarrod:Entity {id:"jarrod"})
SET  jarrod:Human,
  jarrod.name = coalesce(jarrod.name,"Jarrod Yorgan"),
  jarrod.titleList = apoc.coll.union(["excellency","duke","lord","sir"],jarrod.titleList),
  jarrod.aliasList = apoc.coll.union(["Jarrod Yorgan","Duke Jarrod of Thelgaard","Lord of the Crown","Keeper of the Great Plain","Heir to the Throne of the White Swan"],jarrod.aliasList)
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

// APPEARANCE
MERGE (bakkard)-[:APPEARANCE]->(c4s1)
MERGE (dekage)-[:APPEARANCE]->(c4s1)
MERGE (hower)-[:APPEARANCE]->(c4s1)

// REFERENCE
MERGE (kot)-[:REFERENCE]->(c4s1)
MERGE (takhisis)-[:REFERENCE]->(c4s1)
MERGE (mina)-[:REFERENCE]->(c4s1)
MERGE (tasgall)-[:REFERENCE]->(c4s1)
MERGE (coryn)-[:REFERENCE]->(c4s1)
MERGE (rathskell)-[:REFERENCE]->(c4s1)
MERGE (selinda)-[:REFERENCE]->(c4s1)
MERGE (marrett)-[:REFERENCE]->(c4s1)
MERGE (issel)-[:REFERENCE]->(c4s1)
MERGE (jarrod)-[:REFERENCE]->(c4s1)

// DIALOG
MERGE (c4conv1)-[:STARTS]->(c4conv1db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[17], primaryTone:"earnest", toneList:["earnest","deferential"]})
MERGE (dekage)-[:SAYS]->(c4conv1db1)-[:TO]->(bakkard)
MERGE (c4conv1db1)-[:NEXT]->(c4conv1db2:DialogBlock {sentenceCnt:3, wordsPerSentence:[1,3,4], primaryTone:"neutral", toneList:["neutral","put out"]})
MERGE (bakkard)-[:SAYS]->(c4conv1db2)-[:TO]->(dekage)
MERGE (c4conv1db2)-[:NEXT]->(c4conv1db3:DialogBlock {sentenceCnt:5, wordsPerSentence:[15,28,20,9,11], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv1db3)-[:TO]->(bakkard)
MERGE (c4conv1db3)-[:NEXT]->(c4conv1db4:DialogBlock {sentenceCnt:4, wordsPerSentence:[9,14,31,7], primaryTone:"blunt", toneList:["blunt"]})
MERGE (bakkard)-[:SAYS]->(c4conv1db4)-[:TO]->(dekage)
MERGE (c4conv1db4)-[:NEXT]->(c4conv1db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,5], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv1db5)-[:TO]->(bakkard)
MERGE (c4conv1db5)-[:NEXT]->(c4conv1db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"ambivalent", toneList:["ambivalent"]})
MERGE (bakkard)-[:SAYS]->(c4conv1db6)-[:TO]->(dekage)
MERGE (c4conv1db6)-[:NEXT]->(c4conv1db7:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv1db7)-[:TO]->(bakkard)
MERGE (c4conv1db7)-[:NEXT]->(c4conv1db8:DialogBlock {sentenceCnt:2, wordsPerSentence:[1,4], primaryTone:"neutral", toneList:["neutral"]})
MERGE (bakkard)-[:SAYS]->(c4conv1db8)-[:TO]->(dekage)
MERGE (c4conv1db8)-[:NEXT]->(c4conv1db9:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,4], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dekage)-[:SAYS]->(c4conv1db9)-[:TO]->(bakkard)
MERGE (c4conv1db9)-[:NEXT]->(c4conv1db10:DialogBlock {sentenceCnt:1, wordsPerSentence:[10], primaryTone:"neutral", toneList:["neutral"]})
MERGE (bakkard)-[:SAYS]->(c4conv1db10)-[:TO]->(dekage)

MERGE (c4conv2)-[:STARTS]->(c4conv2db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,7], primaryTone:"detached", toneList:["detached","impatient"]})
MERGE (bakkard)-[:SAYS]->(c4conv2db1)-[:TO]->(hower)
MERGE (c4conv2db1)-[:NEXT]->(c4conv2db2:DialogBlock {sentenceCnt:5, wordsPerSentence:[14,9,12,12,25], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (hower)-[:SAYS]->(c4conv2db2)-[:TO]->(bakkard)
MERGE (c4conv2db2)-[:NEXT]->(c4conv2db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"critical", toneList:["critical","impatient"]})
MERGE (bakkard)-[:SAYS]->(c4conv2db3)-[:TO]->(hower)
MERGE (c4conv2db3)-[:NEXT]->(c4conv2db4:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,13], primaryTone:"earnest", toneList:["earnest"]})
MERGE (hower)-[:SAYS]->(c4conv2db4)-[:TO]->(bakkard)
MERGE (c4conv2db4)-[:NEXT]->(c4conv2db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[13,19], primaryTone:"blunt", toneList:["blunt","impatient"]})
MERGE (bakkard)-[:SAYS]->(c4conv2db5)-[:TO]->(hower)
MERGE (c4conv2db5)-[:NEXT]->(c4conv2db6:DialogBlock {sentenceCnt:2, wordsPerSentence:[2,10], primaryTone:"accusatory", toneList:["accusatory","shocked"]})
MERGE (hower)-[:SAYS]->(c4conv2db6)-[:TO]->(bakkard)
MERGE (c4conv2db6)-[:NEXT]->(c4conv2db7:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,2], primaryTone:"apathetic", toneList:["apathetic"]})
MERGE (bakkard)-[:SAYS]->(c4conv2db7)-[:TO]->(hower)
MERGE (c4conv2db7)-[:NEXT]->(c4conv2db8:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"detached", toneList:["detached"]})
MERGE (hower)-[:SAYS]->(c4conv2db8)-[:TO]->(bakkard)

MERGE (c4conv3)-[:STARTS]->(c4conv3db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[13,21], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dekage)-[:SAYS]->(c4conv3db1)-[:TO]->(bakkard)
MERGE (c4conv3db1)-[:NEXT]->(c4conv3db2:DialogBlock {sentenceCnt:5, wordsPerSentence:[5,9,24,9,12], primaryTone:"earnest", toneList:["earnest"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db2)-[:TO]->(dekage)
MERGE (c4conv3db2)-[:NEXT]->(c4conv3db3:DialogBlock {sentenceCnt:5, wordsPerSentence:[5,15,10,23,11], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv3db3)-[:TO]->(bakkard)
MERGE (c4conv3db3)-[:NEXT]->(c4conv3db4:DialogBlock {sentenceCnt:3, wordsPerSentence:[3,10,3], primaryTone:"critical", toneList:["critical"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db4)-[:TO]->(dekage)
MERGE (c4conv3db4)-[:NEXT]->(c4conv3db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[42], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv3db5)-[:TO]->(bakkard)
MERGE (c4conv3db5)-[:NEXT]->(c4conv3db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[9], primaryTone:"objective", toneList:["objective"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db6)-[:TO]->(dekage)
MERGE (c4conv3db6)-[:NEXT]->(c4conv3db7:DialogBlock {sentenceCnt:4, wordsPerSentence:[20,17,20,12], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dekage)-[:SAYS]->(c4conv3db7)-[:TO]->(bakkard)
MERGE (c4conv3db7)-[:NEXT]->(c4conv3db8:DialogBlock {sentenceCnt:5, wordsPerSentence:[3,6,3,8,13], primaryTone:"critical", toneList:["critical"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db8)-[:TO]->(dekage)
MERGE (c4conv3db8)-[:NEXT]->(c4conv3db9:DialogBlock {sentenceCnt:4, wordsPerSentence:[5,13,7,11], primaryTone:"objective", toneList:["objective"]})
MERGE (dekage)-[:SAYS]->(c4conv3db9)-[:TO]->(bakkard)
MERGE (c4conv3db9)-[:NEXT]->(c4conv3db10:DialogBlock {sentenceCnt:5, wordsPerSentence:[3,8,12,3,9], primaryTone:"neutral", toneList:["neutral"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db10)-[:TO]->(dekage)
MERGE (c4conv3db10)-[:NEXT]->(c4conv3db11:DialogBlock {gestureCnt:1, primaryGesture:"pacing", gestureDescriptionList:["pacing"], primaryTone:"bitter", toneList:["bitter"]})
MERGE (bakkard)-[:GESTURES]->(c4conv3db11)
MERGE (c4conv3db11)-[:NEXT]->(c4conv3db12:DialogBlock {sentenceCnt:4, wordsPerSentence:[17,12,5,4], primaryTone:"critical", toneList:["critical"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db12)-[:TO]->(dekage)
MERGE (c4conv3db12)-[:NEXT]->(c4conv3db13:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,5], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dekage)-[:SAYS]->(c4conv3db13)-[:TO]->(bakkard)
MERGE (c4conv3db13)-[:NEXT]->(c4conv3db14:DialogBlock {sentenceCnt:4, wordsPerSentence:[5,28,3,34], primaryTone:"blunt", toneList:["blunt"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db14)-[:TO]->(dekage)
MERGE (c4conv3db14)-[:NEXT]->(c4conv3db15:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dekage)-[:SAYS]->(c4conv3db15)-[:TO]->(bakkard)
MERGE (c4conv3db15)-[:NEXT]->(c4conv3db16:DialogBlock {sentenceCnt:7, wordsPerSentence:[2,20,8,27,1,12,21], primaryTone:"cynical", toneList:["cynical"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db16)-[:TO]->(dekage)
MERGE (c4conv3db16)-[:NEXT]->(c4conv3db17:DialogBlock {sentenceCnt:5, wordsPerSentence:[3,16,15,30,13], primaryTone:"objective", toneList:["objective"]})
MERGE (dekage)-[:SAYS]->(c4conv3db17)-[:TO]->(bakkard)
MERGE (c4conv3db17)-[:NEXT]->(c4conv3db18:DialogBlock {sentenceCnt:3, wordsPerSentence:[8,5,7], primaryTone:"objective", toneList:["objective"]})
MERGE (bakkard)-[:SAYS]->(c4conv3db18)-[:TO]->(dekage)


//-- Activity in c4s2
MERGE (c4s2:Section {name:"chapter 4 section 2",order:2})-[:OF_CHAPTER]->(c4)
MERGE (c4s2)-[:SETTING]->(caergoth)
MERGE (crawford)-[crawfordLeadKosRose:LEADER_OF]->(kosRose)
SET  crawfordLeadKosRose.titleList = apoc.coll.union(["Lord of the Rose"], crawfordLeadKosRose.titleList)
MERGE (c4conv4 {id:"c4conv4"})-[:OCCURS]->(c4s2)
MERGE (marckus:Entity {id:"marckus"})
SET  marckus:Human,
  marckus.name = coalesce(marckus.name,"Marckus Haum"),
  marckus.titleList = apoc.coll.union(["sir","captain"],marckus.titleList),
  marckus.aliasList = apoc.coll.union(["Marckus Haum","Captain Marckus","Captain of the Ducal Guard"],marckus.aliasList)
MERGE (ducalGuard:Entity {id:"ducalGuard"})
SET  ducalGuard:Group,
  ducalGuard.name = coalesce(ducalGuard.name,"The Ducal Guard")
MERGE (marckus)-[marckusMemDuc:MEMBER_OF]->(ducalGuard)
SET marckusMemDuc.titleList = apoc.coll.union(["Captain of the Ducal Guard"], marckusMemDuc.titleList)
MERGE (ducalGuard)-[:UNIT_OF]->(kosRose)
MERGE (marckus)-[:SUBORDINATE_OF]->(crawford)
MERGE (marckus)-[:ATTAINED_RANK]->(captain)
MERGE (c4conv5 {id:"c4conv5"})-[:OCCURS]->(c4s2)

// APPEARANCE
MERGE (crawford)-[:APPEARANCE]->(c4s2)
MERGE (bakkard)-[:APPEARANCE]->(c4s2)
MERGE (marckus)-[:APPEARANCE]->(c4s2)

// REFERENCE
MERGE (selinda)-[:REFERANCE]->(c4s2)
MERGE (c4Trip)-[:REFERENCE]->(c4s2)

// DIALOG
MERGE (c4conv4)-[:STARTS]->(c4conv4db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,7], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (crawford)-[:SAYS]->(c4conv4db1)-[:TO]->(bakkard)
MERGE (c4conv4db1)-[:NEXT]->(c4conv4db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,16], primaryTone:"critical", toneList:["critical"]})
MERGE (bakkard)-[:SAYS]->(c4conv4db2)-[:TO]->(crawford)
MERGE (c4conv4db2)-[:NEXT]->(c4conv4db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[2], primaryTone:"bitter", toneList:["bitter"]})
MERGE (crawford)-[:SAYS]->(c4conv4db3)-[:TO]->(bakkard)
MERGE (c4conv4db3)-[:NEXT]->(c4conv4db4:DialogBlock {sentenceCnt:4, wordsPerSentence:[3,2,3,11], primaryTone:"critical", toneList:["critical"]})
MERGE (bakkard)-[:SAYS]->(c4conv4db4)-[:TO]->(crawford)
MERGE (c4conv4db4)-[:NEXT]->(c4conv4db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[2,7], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (crawford)-[:SAYS]->(c4conv4db5)-[:TO]->(bakkard)
MERGE (c4conv4db5)-[:NEXT]->(c4conv4db6:DialogBlock {sentenceCnt:2, wordsPerSentence:[19,32], primaryTone:"demanding", toneList:["demanding","blunt"]})
MERGE (bakkard)-[:SAYS]->(c4conv4db6)-[:TO]->(crawford)
MERGE (c4conv4db6)-[:NEXT]->(c4conv4db7:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"deferential", toneList:["deferential"]})
MERGE (crawford)-[:SAYS]->(c4conv4db7)-[:TO]->(bakkard)
MERGE (c4conv4db7)-[:NEXT]->(c4conv4db8:DialogBlock {gestureCnt:1, primaryGesture:"knock on the door", gestureDescriptionList:["knock on the door"], primaryTone:"neutral", toneList:["neutral"]})
MERGE (marckus)-[:GESTURES]->(c4conv4db8)
MERGE (c4conv4db8)-[:NEXT]->(c4conv4db9:DialogBlock {sentenceCnt:2, wordsPerSentence:[2,6], primaryTone:"demanding", toneList:["demanding"]})
MERGE (crawford)-[:SAYS]->(c4conv4db9)
MERGE (c4conv4db9)-[:NEXT]->(c4conv4db10:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"deferential", toneList:["deferential"]})
MERGE (marckus)-[:SAYS]->(c4conv4db10)-[:TO]->(crawford)
MERGE (c4conv4db10)-[:NEXT]->(c4conv4db11:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"demanding", toneList:["demanding"]})
MERGE (bakkard)-[:SAYS]->(c4conv4db11)-[:TO]->(crawford)
MERGE (c4conv4db11)-[:NEXT]->(c4conv4db12:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"deferential", toneList:["deferential"]})
MERGE (crawford)-[:SAYS]->(c4conv4db12)-[:TO]->(bakkard)

MERGE (c4conv5)-[:STARTS]->(c4conv5db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"blunt", toneList:["blunt"]})
MERGE (crawford)-[:SAYS]->(c4conv5db1)-[:TO]->(marckus)
MERGE (c4conv5db1)-[:NEXT]->(c4conv5db2:DialogBlock {sentenceCnt:4, wordsPerSentence:[10,15,12,2], primaryTone:"demanding", toneList:["demanding"]})
MERGE (crawford)-[:SAYS]->(c4conv5db2)-[:TO]->(marckus)
MERGE (c4conv5db2)-[:NEXT]->(c4conv5db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[2], primaryTone:"deferential", toneList:["deferential"]})
MERGE (marckus)-[:SAYS]->(c4conv5db3)-[:TO]->(crawford)
MERGE (c4conv5db3)-[:NEXT]->(c4conv5db4:DialogBlock {sentenceCnt:3, wordsPerSentence:[19,16,19], primaryTone:"demanding", toneList:["demanding"]})
MERGE (crawford)-[:SAYS]->(c4conv5db4)-[:TO]->(marckus)
MERGE (c4conv5db4)-[:NEXT]->(c4conv5db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,11], primaryTone:"deferential", toneList:["deferential"]})
MERGE (marckus)-[:SAYS]->(c4conv5db5)-[:TO]->(crawford)
MERGE (c4conv5db5)-[:NEXT]->(c4conv5db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[9], primaryTone:"demanding", toneList:["demanding"]})
MERGE (crawford)-[:SAYS]->(c4conv5db6)-[:TO]->(marckus)
MERGE (c4conv5db6)-[:NEXT]->(c4conv5db7:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,5], primaryTone:"deferential", toneList:["deferential"]})
MERGE (marckus)-[:SAYS]->(c4conv5db7)-[:TO]->(crawford)


//-- Activity in c4s3
MERGE (c4s3:Section {name:'chapter 4 section 3',order:3})-[:OF_CHAPTER]->(c4)
MERGE (c4s3)-[:SETTING]->(caergoth)
MERGE (powell:Entity {id:'powell'})
SET  powell:Human,
  powell.name = coalesce(powell.name,'Powell'),
  powell.titleList = apoc.coll.union(["captain","sir"],powell.titleList),
  powell.aliasList = apoc.coll.union(["Powell","Captain of the Palanthian Guards"],powell.aliasList)
MERGE (powell)-[:ATTAINED_RANK]->(captain)
MERGE (palanthianGuards:Entity {id:"palanthianGuards"})
SET  palanthianGuards:Group,
  palanthianGuards.name = coalesce(palanthianGuards.name,"The Palanthian Guards")
MERGE (powell)-[powellMemPalaGuar:MEMBER_OF]->(palanthianGuards)
SET  powellMemPalaGuar.titleList = apoc.coll.union(["Captain of the Palanthian Guards"], powellMemPalaGuar.titleList)
MERGE (c4Trip)-[:PARTY_MEMBER]->(powell)
MERGE (c4conv6 {id:"c4conv6"})-[:OCCURS]->(c4s3)
MERGE (martha:Entity {id:"martha"})
SET  martha:Human,
  martha.name = coalesce(martha.name,"Martha"),
  martha.titleList = apoc.coll.union(["lady","duchess"],martha.titleList),
  martha.aliasList = apoc.coll.union(["Martha","Duchess of Caergoth"], martha.aliasList)
MERGE (martha)-[marthaIsOfCrawford:IS_A_x_OF {descriptor:"wife",spouse:TRUE}]->(crawford)
SET  marthaIsOfCrawford.spouse = TRUE,
  marthaIsOfCrawford.descriptor = coalesce(marthaIsOfCrawford.descriptor,"wife"),
  marthaIsOfCrawford.descriptorList = apoc.coll.union(["wife"], marthaIsOfCrawford.descriptorList)
MERGE (c4conv7 {id:"c4conv7"})-[:OCCURS]->(c4s3)

// APPEARANCE
MERGE (powell)-[:APPEARANCE]->(c4s3)
MERGE (selinda)-[:APPEARANCE]->(c4s3)
MERGE (marckus)-[:APPEARANCE]->(c4s3)
MERGE (issel)-[:APPEARANCE]->(c4s3)
MERGE (martha)-[:APPEARANCE]->(c4s3)
MERGE (crawford)-[:APPEARANCE]->(c4s3)

// REFERENCE
MERGE (c4Trip)-[:REFERENCE]->(c4s3)

// DIALOG
MERGE (c4conv6)-[:STARTS]->(c4conv6db1:DialogBlock {sentenceCnt:3, wordsPerSentence:[5,13,1], primaryTone:"earnest", toneList:["earnest"]})
MERGE (selinda)-[:SAYS]->(c4conv6db1)-[:TO]->(issel)
MERGE (c4conv6db1)-[:NEXT]->(c4conv6db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[15,7], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (issel)-[:SAYS]->(c4conv6db2)-[:TO]->(selinda)
MERGE (c4conv6db2)-[:NEXT]->(c4conv6db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"earnest", toneList:["earnest"]})
MERGE (selinda)-[:SAYS]->(c4conv6db3)-[:TO]->(issel)

MERGE (c4conv7)-[:STARTS]->(c4conv7db1:DialogBlock {sentenceCnt:3, wordsPerSentence:[2,6,9], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (martha)-[:SAYS]->(c4conv7db1)-[:TO]->(selinda)
MERGE (c4conv7db1)-[:NEXT]->(c4conv7db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,8], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (selinda)-[:SAYS]->(c4conv7db2)-[:TO]->(martha)
MERGE (c4conv7db2)-[:NEXT]->(c4conv7db3:DialogBlock {sentenceCnt:4, wordsPerSentence:[1,22,10,14], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (crawford)-[:SAYS]->(c4conv7db3)-[:TO]->(selinda)
MERGE (c4conv7db3)-[:NEXT]->(c4conv7db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"appreciative", toneList:["appreciative"]})
MERGE (selinda)-[:SAYS]->(c4conv7db4)-[:TO]->(crawford)
MERGE (c4conv7db4)-[:NEXT]->(c4conv7db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[10], primaryTone:"adoring", toneList:["adoring"]})
MERGE (martha)-[:SAYS]->(c4conv7db5)-[:TO]->(selinda)


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

// APPEARANCE
MERGE (coryn)-[:APPEARANCE]->(c4s4)

// REFERENCE
MERGE (jenna)-[:REFERENCE]->(c4s4)
MERGE (crawford)-[:REFERENCE]->(c4s4)
MERGE (martha)-[:REFERENCE]->(c4s4)
MERGE (bakkard)-[:REFERENCE]->(c4s4)
MERGE (jarrod)-[:REFERENCE]->(c4s4)
MERGE (rathskell)-[:REFERENCE]->(c4s4)

