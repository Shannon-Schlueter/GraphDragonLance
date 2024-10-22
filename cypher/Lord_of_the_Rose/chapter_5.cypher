MATCH (c5:Chapter {order:5})-[:OF_BOOK]->(lotr:Book {name: 'Lord of the Rose'})

MATCH (strongholdCornellus:Entity {id:'strongholdCornellus'})
MATCH (garnet:Entity {id:'garnet'})
MATCH (dram:Entity {id:'dram'})
MATCH (jaymes:Entity {id:'jaymes'})
MATCH (cornellus:Entity {id:'cornellus'})
MATCH (shinare:Entity {id:'shinare'})
MATCH (orderShinare:Entity {id:'orderShinare'})
MATCH (merchant:Entity {id:'merchant'})
MATCH (lorimar:Entity {id:'lorimar'})
MATCH (reynaud:Entity {id:'reynaud'})
MATCH (captain:Entity {id:'captain'})
MATCH (crawford:Entity {id:'crawford'})
MATCH (patriarch:Entity {id:'patriarch'})
MATCH (priest:Entity {id:'priest'})

//-- c5s1
MERGE (c5s1:Section {name:'chapter 5 section 1',order:1})-[:OF_CHAPTER]->(c5)
MERGE (strCornellus2GarnetByLand:Entity {id:'strCornellus2GarnetByLand'})
SET strCornellus2GarnetByLand:Route,
  strCornellus2GarnetByLand.description = coalesce(strCornellus2GarnetByLand.description, 'The road from the stronghold of the bandit lord Cornellus to the free city of Garnet')
SET strCornellus2GarnetByLand.descriptionList = apoc.coll.union([strCornellus2GarnetByLand.description], strCornellus2GarnetByLand.descriptionList)
MERGE (c5s1)-[:SETTING  {year:'42 SC'}]->(strCornellus2GarnetByLand)
MERGE (strCornellus2GarnetByLand)-[:FROM]->(strongholdCornellus)
MERGE (strCornellus2GarnetByLand)-[:TO]->(garnet)
MERGE (c5Trip:Trip {name: 'escape from Cornellus'})-[:OCCURS]->(c5s1)
MERGE (c5Trip)-[:FROM]->(strongholdCornellus)
MERGE (c5Trip)-[:TO]->(garnet)
MERGE (c5Trip)-[:VIA_ROUTE]->(strCornellus2GarnetByLand)
MERGE (c5Trip)-[:PARTY_MEMBER]->(dram)
MERGE (c5Trip)-[:PARTY_MEMBER]->(jaymes)
MERGE (krynn:Entity {id:'krynn'})
SET  krynn:Place:World,
  krynn.name = 'Krynn'
MERGE (solinari:Entity {id:'solinari'})
SET  solinari:Place:Moon,
  solinari.name = coalesce(solinari.name,'Solinari'),
  solinari.aliasList = apoc.coll.union(["Solinari"],solinari.nameList),
  solinari.description = coalesce(solinari.description,"The White Moon of Krynn"),
  solinari.descriptionList = apoc.coll.union(["The White Moon of Krynn"],solinari.descriptionList)
MERGE (solinari)-[:MOON_OF]->(krynn)
SET c5Trip.modeOfTravel = 'horseback',
  c5Trip.duration = 'about 4 days'
MERGE (c5conv1 {id:'c5conv1'})-[:OCCURS]->(c5s1)

// APPEARANCE
MERGE (dram)-[:APPEARANCE]->(c5s1)
MERGE (jaymes)-[:APPEARANCE]->(c5s1)

// REFERENCE
MERGE (cornellus)-[:REFERENCE]->(c5s1)

// DIALOG
MERGE (c5conv1)-[:STARTS]->(c5conv1db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:'earnest', toneList:['earnest']})
MERGE (dram)-[:SAYS]->(c5conv1db1)-[:TO]->(jaymes)
MERGE (c5conv1db1)-[:NEXT]->(c5conv1db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[6,24], primaryTone:'ambivalent', toneList:['ambivalent']})
MERGE (jaymes)-[:SAYS]->(c5conv1db2)-[:TO]->(dram)
MERGE (c5conv1db2)-[:NEXT]->(c5conv1db3:DialogBlock {gestureCnt:1, primaryGesture:'nod-yes', gestureDescriptionList:['nod-yes'], primaryTone:'earnest', toneList:['earnest']})
MERGE (dram)-[:GESTURES]->(c5conv1db3)


//-- c5s2
MERGE (c5s2:Section {name:'chapter 5 section 2',order:2})-[:OF_CHAPTER]->(c5)
MERGE (c5s2)-[:SETTING]->(garnet)
MERGE (c5conv2 {id:"c5conv2"})-[:OCCURS]->(c5s2)
MERGE (tShinareGarnet:Entity {id:'tShinareGarnet'})
SET  tShinareGarnet:Place:POI:Temple,
  tShinareGarnet.name = coalesce(tShinareGarnet.name,'The Temple of Shinare in Garnet')
MERGE (tShinareGarnet)-[:IN]->(garnet)
MERGE (orderShinare)-[:HAS_STRONGHOLD]->(tShinareGarnet)
SET  shinare.aliasList = apoc.coll.union(["Winged Victory","moneyhandler's scales","The Silver Mistress"], shinare.aliasList)
MERGE (shinare)-[:GOD_OF]->(merchant)
MERGE (thief:Entity {id:'thief'})
SET  thief:Occupation,
  thief.name = 'Thief'
MERGE (shinare)-[:GOD_OF]->(thief)
MERGE (thorbardin:Entity {id:'thorbardin'})
SET  thorbardin:Place:Kingdom,
  thorbardin.name = 'Thorbardin'
MERGE (reorx:Entity {id:'reorx'})
SET  reorx:God,
  reorx.name = coalesce(reorx.name,'Reorx'),
  reorx.aliasList = apoc.coll.union(["Reorx"],reorx.aliasList)
MERGE (c5npcRoseflowerBarmaid {id:"RoseflowerBarmaid",description:"a cheerfull barmaid of the Roseflower inn in Garnet"})-[:OCCURS]->(c5s2)
MERGE (c5conv3 {id:"c5conv3"})-[:OCCURS]->(c5s2)
MERGE (dara:Entity {id:'dara'})
SET  dara:Human,
  dara.name = coalesce(dara.name,'Dara Lorimar'),
  dara.aliasList = apoc.coll.union(["Dara Lorimar","Princess of the Plains"],dara.aliasList),
  dara.title = coalesce(dara.title,"lady"),
  dara.titleList = apoc.coll.union(["lady","princess"],dara.titleList),
  dara.birthyear = coalesce(dara.birthyear,"20 SC")
MERGE (dara)-[daraIsOfLorimar:IS_A_x_OF]->(lorimar)
SET  daraIsOfLorimar.descriptor = coalesce(daraIsOfLorimar.descriptor,'daughter'),
  daraIsOfLorimar.descriptorList = apoc.coll.union(["daughter"],daraIsOfLorimar.descriptorList)
MERGE (c5conv4 {id:"c5conv4"})-[:OCCURS]->(c5s2)
SET reynaud.titleList = apoc.coll.union(["captain"],reynaud.titleList)
MERGE (reynaud)-[:ATTAINED_RANK]->(captain)
MERGE (c5s2)-[:SETTING]->(tShinareGarnet)
MERGE (c5npcTempShinCleric {id:"TempShinCleric",description:"a cleric with white robes trimmed in gold"})-[:OCCURS]->(c5s2)
MERGE (c5conv6 {id:"c5conv6"})-[:OCCURS]->(c5s2)
MERGE (c5enc1:Encounter {name:"heist at the Temple of Shinare in Garnet", type:"skirmish"})-[:OCCURS]->(c5s2)
MERGE (patriarchTempShinGarn:Combatant:Human {name:'Patriarch of the Temple of Shinare in Garnet'})-[:ANTAGONIST]->(c5s2)
MERGE (patriarchTempShinGarn)-[:LEADER_OF {title:'Temple Master'}]->(tShinareGarnet)
MERGE (patriarchTempShinGarn)-[:HAS_OCCUPATION]->(priest)
MERGE (patriarchTempShinGarn)-[:ATTAINED_RANK]->(patriarch)
MERGE (patriarchTempShinGarn)-[:CONVERSATION {reference:'Lord of the Rose:c5s2', dialog_exchange:2}]->(dram)
MERGE (patriarchTempShinGarn)-[:CONVERSATION {reference:'Lord of the Rose:c5s2', dialog_exchange:8}]->(jaymes)
MERGE (patriarchTempShinGarn)-[:SLAIN_BY {description:'a crossbow dart to the chest, he collapsed with a groan. The power of his spell was broken in that instant'}]-(jaymes)

// APPEARANCE
MERGE (dram)-[:APPEARANCE]->(c5s2)
MERGE (jaymes)-[:APPEARANCE]->(c5s2)
MERGE (reynaud)-[:APPEARANCE]->(c5s2)
MERGE (patriarchTempShinGarn)-[:APPEARANCE]->(c5s2)

// REFERENCE
MERGE (dara)-[:REFERENCE]->(c5s2)
MERGE (lorimar)-[:REFERENCE]->(c5s2)
MERGE (crawford)-[:REFERENCE]->(c5s2)

// DIALOG
MERGE (c5conv2)-[:STARTS]->(c5conv2db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,7], primaryTone:"cynical", toneList:["cynical"]})
MERGE (dram)-[:SAYS]->(c5conv2db1)
MERGE (c5conv2db1)-[:NEXT]->(c5conv2db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[9,8], primaryTone:"objective", toneList:["objective"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db2)-[:TO]->(dram)
MERGE (c5conv2db2)-[:NEXT]->(c5conv2db3:DialogBlock {sentenceCnt:6, wordsPerSentence:[8,4,15,20,16,5], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dram)-[:SAYS]->(c5conv2db3)-[:TO]->(jaymes)
MERGE (c5conv2db3)-[:NEXT]->(c5conv2db4:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,14], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db4)-[:TO]->(dram)
MERGE (c5conv2db4)-[:NEXT]->(c5conv2db5:DialogBlock {sentenceCnt:3, wordsPerSentence:[16,19,12], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dram)-[:SAYS]->(c5conv2db5)-[:TO]->(jaymes)
MERGE (c5conv2db5)-[:NEXT]->(c5conv2db6:DialogBlock {sentenceCnt:2, wordsPerSentence:[15,20], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dram)-[:SAYS]->(c5conv2db6)-[:TO]->(jaymes)
MERGE (c5conv2db6)-[:NEXT]->(c5conv2db7:DialogBlock {sentenceCnt:5, wordsPerSentence:[1,6,5,10,17], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db7)-[:TO]->(dram)
MERGE (c5conv2db7)-[:NEXT]->(c5conv2db8:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,3], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv2db8)-[:TO]->(jaymes)
MERGE (c5conv2db8)-[:NEXT]->(c5conv2db9:DialogBlock {gestureCnt:1, primaryGesture:"pointing-look there", gestureDescriptionList:["pointing-look there"], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:GESTURES]->(c5conv2db9)-[:TO]->(jaymes)
MERGE (c5conv2db9)-[:NEXT]->(c5conv2db10:DialogBlock {sentenceCnt:1, wordsPerSentence:[1], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db10)-[:TO]->(dram)
MERGE (c5conv2db10)-[:NEXT]->(c5conv2db11:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv2db11)-[:TO]->(jaymes)
MERGE (c5conv2db11)-[:NEXT]->(c5conv2db12:DialogBlock {sentenceCnt:4, wordsPerSentence:[3,2,17,8], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db12)-[:TO]->(dram)
MERGE (c5conv2db12)-[:NEXT]->(c5conv2db13:DialogBlock {sentenceCnt:3, wordsPerSentence:[1,8,10], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv2db13)-[:TO]->(jaymes)
MERGE (c5conv2db13)-[:NEXT]->(c5conv2db14:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,11], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv2db14)-[:TO]->(dram)

MERGE (c5conv3)-[:STARTS]->(c5conv3db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[9], primaryTone:"neutral", toneList:["neutral"]})
MERGE (c5npcRoseflowerBarmaid)-[:SAYS]->(c5conv3db1)-[:TO]->(dram)
MERGE (c5conv3db1)-[:TO]->(jaymes)
MERGE (c5conv3db1)-[:NEXT]->(c5conv3db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv3db2)-[:TO]->(c5npcRoseflowerBarmaid)
MERGE (c5conv3db2)-[:NEXT]->(c5conv3db3:DialogBlock {sentenceCnt:3, wordsPerSentence:[8,7,25], primaryTone:"earnest", toneList:["earnest"]})
MERGE (c5npcRoseflowerBarmaid)-[:SAYS]->(c5conv3db3)-[:TO]->(dram)
MERGE (c5conv3db3)-[:NEXT]->(c5conv3db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv3db4)-[:TO]->(c5npcRoseflowerBarmaid)
MERGE (c5conv3db4)-[:NEXT]->(c5conv3db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,17], primaryTone:"earnest", toneList:["earnest"]})
MERGE (c5npcRoseflowerBarmaid)-[:SAYS]->(c5conv3db5)-[:TO]->(jaymes)
MERGE (c5conv3db5)-[:NEXT]->(c5conv3db6:DialogBlock {sentenceCnt:2, wordsPerSentence:[1,1], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv3db6)-[:TO]->(c5npcRoseflowerBarmaid)
MERGE (c5conv3db6)-[:NEXT]->(c5conv3db7:DialogBlock {sentenceCnt:3, wordsPerSentence:[5,19,12], primaryTone:"earnest", toneList:["earnest"]})
MERGE (c5npcRoseflowerBarmaid)-[:SAYS]->(c5conv3db7)-[:TO]->(dram)
MERGE (c5conv3db7)-[:NEXT]->(c5conv3db8:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"deferential", toneList:["deferential"]})
MERGE (dram)-[:SAYS]->(c5conv3db8)-[:TO]->(c5npcRoseflowerBarmaid)

MERGE (c5conv4)-[:STARTS]->(c5conv4db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:"empathetic", toneList:["empathetic"]})
MERGE (dram)-[:SAYS]->(c5conv3db5db1)-[:TO]->(jaymes)
MERGE (c5conv4db1)-[:NEXT]->(c5conv4db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"ambivalent", toneList:["ambivalent"]})
MERGE (jaymes)-[:SAYS]->(c5conv4db2)-[:TO]->(dram)
MERGE (c5conv4db2)-[:NEXT]->(c5conv4db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv4db3)-[:TO]->(jaymes)
MERGE (c5conv4db3)-[:NEXT]->(c5conv4db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[6], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv4db4)-[:TO]->(jaymes)
MERGE (c5conv4db4)-[:NEXT]->(c5conv4db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[1,10], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv4db5)-[:TO]->(dram)
MERGE (c5conv4db5)-[:NEXT]->(c5conv4db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv4db6)-[:TO]->(jaymes)
MERGE (c5conv4db6)-[:NEXT]->(c5conv4db7:DialogBlock {sentenceCnt:3, wordsPerSentence:[10,5,8], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv4db7)-[:TO]->(dram)
MERGE (c5conv4db7)-[:NEXT]->(c5conv4db8:DialogBlock {sentenceCnt:1, wordsPerSentence:[6,10], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv4db8)-[:TO]->(jaymes)
MERGE (c5conv4db8)-[:NEXT]->(c5conv4db9:DialogBlock {sentenceCnt:1, wordsPerSentence:[6], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv4db9)-[:TO]->(dram)

MERGE (c5conv6)-[:STARTS]->(c5conv6db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[2,12], primaryTone:"earnest", toneList:["earnest"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db1)-[:TO]->(jaymes)
MERGE (c5conv6db1)-[:NEXT]->(c5conv6db2:DialogBlock {sentenceCnt:3, wordsPerSentence:[2,13,6], primaryTone:"accusatory", toneList:["accusatory"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db2)-[:TO]->(c5npcTempShinCleric)
MERGE (c5conv6db2)-[:NEXT]->(c5conv6db3:DialogBlock {sentenceCnt:3, wordsPerSentence:[4,30,9], primaryTone:"diplomatic", toneList:["diplomatic"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db3)-[:TO]->(jaymes)
MERGE (c5conv6db3)-[:NEXT]->(c5conv6db4:DialogBlock {sentenceCnt:2, wordsPerSentence:[6,3], primaryTone:"accusatory", toneList:["accusatory"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db4)-[:TO]->(c5npcTempShinCleric)
MERGE (c5conv6db4)-[:NEXT]->(c5conv6db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[1,4], primaryTone:"demanding", toneList:["demanding"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db5)-[:TO]->(jaymes)
MERGE (c5conv6db5)-[:NEXT]->(c5conv6db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[8], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db6)-[:TO]->(c5npcTempShinCleric)
MERGE (c5conv6db6)-[:NEXT]->(c5conv6db7:DialogBlock {sentenceCnt:3, wordsPerSentence:[1,3,11], primaryTone:"blunt", toneList:["blunt"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db7)-[:TO]->(jaymes)
MERGE (c5conv6db7)-[:NEXT]->(c5conv6db8:DialogBlock {sentenceCnt:2, wordsPerSentence:[8,13], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db8)-[:TO]->(c5npcTempShinCleric)
MERGE (c5conv6db8)-[:NEXT]->(c5conv6db9:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv6db9)-[:TO]->(jaymes)
MERGE (c5conv6db9)-[:NEXT]->(c5conv6db10:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"neutral", toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db10)-[:TO]->(dram)
MERGE (c5conv6db10)-[:NEXT]->(c5conv6db11:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(c5conv6db11)-[:TO]->(jaymes)
MERGE (c5conv6db11)-[:NEXT]->(c5conv6db12:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,6], primaryTone:"accusatory", toneList:["accusatory"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db12)-[:TO]->(jaymes)
MERGE (c5conv6db12)-[:NEXT]->(c5conv6db13:DialogBlock {sentenceCnt:3, wordsPerSentence:[6,5,1], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (jaymes)-[:SAYS]->(c5conv6db13)-[:TO]->(c5npcTempShinCleric)
MERGE (c5conv6db13)-[:NEXT]->(c5conv6db14:DialogBlock {sentenceCnt:1, wordsPerSentence:[6], primaryTone:"hostile", toneList:["hostile"]})
MERGE (c5npcTempShinCleric)-[:SAYS]->(c5conv6db14)-[:TO]->(jaymes)
MERGE (c5conv6db14)-[:NEXT]->(c5conv6db15:DialogBlock {sentenceCnt:2, wordsPerSentence:[2,5], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dram)-[:SAYS]->(c5conv6db15)-[:TO]->(c5npcTempShinCleric)

// ENCOUNTER
MERGE (c5enc1)-[:SETTING]->(tShinareGarnet)
MERGE (c5enc1)-[:PROTAGONIST]->(dram)
MERGE (c5enc1)-[:PROTAGONIST]->(jaymes)
MERGE (c5enc1)-[:ANTAGONIST]->(c5npcTempShinCleric)
MERGE (c5enc1)-[:STARTS]->(c5enc1act1:Action:Attack:MeleeAttack {weapon:"giantsmiter"})
MERGE (jaymes)-[:MAKES_ACTION]->(c5enc1act1)-[:AGAINST {hits:TRUE, result:"incapacitates"}]->(c5npcTempShinCleric)
MERGE (c5enc1act1)-[:NEXT]->(c5enc1act2:Action:Attack:SpellAttack {description:"command spell", vocalization:"Halt!", completed:TRUE})
MERGE (patriarchTempShinGarn)-[:MAKES_ACTION]->(c5enc1act2)-[:AGAINST {hits:TRUE, result:"incapacitates"}]->(dram)
MERGE (patriarchTempShinGarn)-[:MAKES_ACTION]->(c5enc1act2)-[:AGAINST {hits:FALSE, result:"NA"}]->(jaymes)
MERGE (c5enc1act2)-[:NEXT]->(c5enc1act3:DialogBlock {sentenceCnt:3, wordsPerSentence:[12,9,10], primaryTone:"demanding", toneList:["demanding"]})
MERGE (patriarchTempShinGarn)-[:SAYS]->(c5enc1act3)-[:TO]->(jaymes)
MERGE (c5enc1act3)-[:TO]->(dram)
MERGE (c5enc1act3)-[:NEXT]->(c5enc1act4:DialogBlock {sentenceCnt:3, wordsPerSentence:[1,5,5], primaryTone:"bitter", toneList:["bitter"]})
MERGE (dram)-[:SAYS]->(c5enc1act4)-[:TO]->(patriarchTempShinGarn)
MERGE (c5enc1act4)-[:NEXT]->(c5enc1act5:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:"cynical", toneList:["cynical"]})
MERGE (jaymes)-[:SAYS]->(c5enc1act5)-[:TO]->(patriarchTempShinGarn)
MERGE (c5enc1act5)-[:NEXT]->(c5enc1act6:DialogBlock {sentenceCnt:3, wordsPerSentence:[7,4,8], primaryTone:"hostile", toneList:["hostile"]})
MERGE (patriarchTempShinGarn)-[:SAYS]->(c5enc1act6)-[:TO]->(jaymes)
MERGE (c5enc1act6)-[:NEXT]->(c5enc1act7:Action:Equip {unequippedWeapon:"giantsmiter", equippedWeapon:"crossbow"})
MERGE (jaymes)-[:MAKES_ACTION]->(c5enc1act7)
MERGE (c5enc1act7)-[:NEXT]->(c5enc1act8:Action:Attack:SpellAttack {description:"clerics command spell", vocalization:"Cease! Drop your weapon.", completed:TRUE})
MERGE (patriarchTempShinGarn)-[:MAKES_ACTION]->(c5enc1act8)-[:AGAINST {hits:FALSE, result:"resisted"}]->(jaymes)
MERGE (c5enc1act8)-[:NEXT]->(c5enc1act9:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"demanding", toneList:["demanding"]})
MERGE (jaymes)-[:SAYS]->(c5enc1act9)-[:TO]->(patriarchTempShinGarn)
MERGE (c5enc1act9)-[:NEXT]->(c5enc1act10:DialogBlock {sentenceCnt:2, wordsPerSentence:[6,4], primaryTone:"demanding", toneList:["demanding"]})
MERGE (patriarchTempShinGarn)-[:SAYS]->(c5enc1act10)-[:TO]->(jaymes)
MERGE (c5enc1act10)-[:NEXT]->(c5enc1act11:Action:Attack:RangedAttack {weapon:"crossbow"})
MERGE (jaymes)-[:MAKES_ACTION]->(c5enc1act11)-[:AGAINST {hits:TRUE, result:"kills"}]->(patriarchTempShinGarn)
MERGE (c5enc1act11)-[:NEXT]->(c5enc1act12:DialogBlock {sentenceCnt:1, wordsPerSentence:[8], primaryTone:"earnest", toneList:["earnest"]})
MERGE (dram)-[:SAYS]->(c5enc1act12)-[:TO]->(jaymes)
MERGE (c5enc1act12)-[:NEXT]->(c5enc1act13:DialogBlock {sentenceCnt:1, wordsPerSentence:[13], primaryTone:"earnest", toneList:["earnest"]})
MERGE (jaymes)-[:SAYS]->(c5enc1act13)-[:TO]->(dram)
MERGE (c5enc1act13)-[:NEXT]->(c5enc1act14:DialogBlock {gestureCnt:1, primaryGesture:"nod-yes", gestureDescriptionList:["nod-yes"], primaryTone:"neutral", toneList:["neutral"]})
MERGE (dram)-[:GESTURES]->(c5enc1act14)-[:TO]->(jaymes)
MERGE (c5enc1act14)-[:NEXT]->(c5enc1act15:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,8], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (jaymes)-[:SAYS]->(c5enc1act15)-[:TO]->(dram)














