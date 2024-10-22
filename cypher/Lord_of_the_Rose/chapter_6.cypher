MATCH (c6:Chapter {order:6})-[:OF_BOOK]->(lotr:Book {name: 'Lord of the Rose'})

//-- c6s1
MERGE (c6s1:Section {name:'chapter 6 section 1',order:1})-[:OF_CHAPTER]->(c6)
MERGE (overlord:Entity {id:'overlord'})
SET  overlord:Title,
  overlord.title = 'Overlord'
MERGE (khellendros:Entity {id:'khellendros'})
SET  khellendros:Dragon,
  khellendros.name = coalesce(khellendros.name,'Khellendros'),
  khellendros.title = coalesce(khellendros.title,'overlord'),
  khellendros.titleList = apoc.coll.union(["overlord"],khellendros.titleList)
MERGE (khellendros)-[:ATTAINED_RANK]->(overlord)
MERGE (beryl:Entity {id:'beryl'})
SET  beryl:Dragon,
  beryl.name = coalesce(beryl.name,'Khellendros'),
  beryl.title = coalesce(beryl.title,'overlord'),
  beryl.titleList = apoc.coll.union(["overlord"],beryl.titleList)
MERGE (beryl)-[:ATTAINED_RANK]->(overlord)
MERGE (ariakan:Entity {id:'ariakan'})
SET  ariakan.name = coalesce(ariakan.name,'Ariakan'),
  ariakan.aliasList = apoc.coll.union(["Lord Ariakan"],ariakan.aliasList),
  ariakan.title = coalesce(ariakan.title,"lord"),
  ariakan.titleList = apoc.coll.union(["lord"],ariakan.titleList)
MERGE (chieftain:Entity {id:'chieftain'})
MERGE (bonechisel:Entity {id:'bonechisel'})
SET  bonechisel:Hobgoblin,
  bonechisel.name = coalesce(bonechisel.name,'Bonechisel'),
  bonechisel.aliasList = apoc.coll.union(["Bonechisel","Bonechisel Hobgoblin", "Bonechisel Hob"], bonechisel.aliasList),
  bonechisel.title = coalesce(bonechisel.title,"chieftain"),
  bonechisel.titleList = apoc.coll.union(["chieftain"], bonechisel.titleList)
MERGE (bonechisel)-[:SUBORDINATE_OF]->(ariakan)
MERGE (bonechisel)-[:ATTAINED_RANK]->(chieftain)
MERGE (laka:Entity {id:'laka'})
SET  laka:Hobgoblin,
  laka.name = coalesce(laka.name,'Laka'),
  laka.aliasList = apoc.coll.union(["Laka Hobgoblin","Laka, wife of Bonechisel"],laka.aliasList)
MERGE (laka)-[lakaIsOfBonechisel:IS_A_x_OF]->(bonechisel)
SET lakaIsOfBonechisel.descriptor = coalesce(lakaIsOfBonechisel.descriptor,'wife'),
  lakaIsOfBonechisel.descriptorList = apoc.coll.union(["wife"], lakaIsOfBonechisel.descriptorList)
MERGE (c6npcGiant:Giant {id:'Giant',description:'bio father of ankhar'})-[:OCCURS]->(c6s1)
MERGE (c6enc1:Encounter {name:'Bonechisel looking for shelter', type:'skirmish'})-[:OCCURS]->(c6s1)
MERGE (c6npcOgress:Ogre {id:'Ogress',description:'bio mother of ankhar'})-[:OCCURS]->(c6s1)
SET bonechisel.name = 'Bonechisel Giant-Slayer',
  bonechisel.aliasList = apoc.coll.union(["Bonechisel Giant-Slayer"], bonechisel.aliasList)
MERGE (c6conv1 {id:'c6conv1'})-[:OCCURS]->(c6s1)
MERGE (ankhar:Entity {id:'ankhar'})
SET  ankhar:HalfOgre:HalfGiant,
  ankhar.name = coalesce(ankhar.name,'Ankhar'),
  ankhar.aliasList = apoc.coll.union(["Ankhar"],ankhar.aliasList)
MERGE (ankhar)-[ankharIsOfc6npcGiant:IS_A_x_OF]->(c6npcGiant)
SET ankharIsOfc6npcGiant.descriptor = coalesce(ankharIsOfc6npcGiant.descriptor,'biological son'),
    ankharIsOfc6npcGiant.descriptorList = apoc.coll.union(["biological son"], ankharIsOfc6npcGiant.descriptorList)
MERGE (ankhar)-[ankharIsOfc6npcOgress:IS_A_x_OF]->(c6npcOgress)
SET ankharIsOfc6npcOgress.descriptor = coalesce(ankharIsOfc6npcOgress.descriptor,'biological son'),
    ankharIsOfc6npcOgress.descriptorList = apoc.coll.union(["biological son"], ankharIsOfc6npcOgress.descriptorList)
MERGE (ankhar)-[ankharIsOfLaka:IS_A_x_OF]->(laka)
SET  ankharIsOfLaka.descriptor = coalesce(ankharIsOfLaka.descriptor,'adopted son'),
  ankharIsOfLaka.descriptorList = apoc.coll.union(["adopted son"], ankharIsOfLaka.descriptorList)

// APPEARANCE
MERGE (bonechisel)-[:APPEARANCE]->(c6s1)
MERGE (laka)-[:APPEARANCE]->(c6s1)
MERGE (c6npcGiant)-[:APPEARANCE]->(c6s1)
MERGE (c6npcOgress)-[:APPEARANCE]->(c6s1)
MERGE (ankhar)-[:APPEARANCE]->(c6s1)

// REFERENCE
MERGE (khellendros)-[:REFERENCE]->(c6s1)
MERGE (beryl)-[:REFERENCE]->(c6s1)
MERGE (ariakan)-[:REFERENCE]->(c6s1)

// DIALOG
MERGE (c6conv1)-[:STARTS]->(c6conv1db1:DialogBlock {sentenceCnt:3, wordsPerSentence:[3,2,5], primaryTone:'demanding', toneList:['demanding']})
MERGE (bonechisel)-[:SAYS]->(c6conv1db1)-[:TO]->(laka)
MERGE (c6conv1db1)-[:NEXT]->(c6conv1db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,4], primaryTone:'hostile', toneList:['hostile']})
MERGE (laka)-[:SAYS]->(c6conv1db2)-[:TO]->(bonechisel)

// ENCOUNTER
MERGE (c6enc1)-[:PROTAGONIST]->(bonechisel)
MERGE (c6enc1)-[:ANTAGONIST]->(c6npcGiant)
MERGE (c6enc1)-[:STARTS]->(c6enc1act1:Action:Attack:MeleeAttack {weapon:'granite axe'})
MERGE (bonechisel)-[:MAKES_ACTION]->(c6enc1act1)-[:AGAINST {hits:true, result:'kills'}]->(c6npcGiant)
MERGE (c6npcGiant)-[:SLAIN_BY {description:'granite axe to the forehead'}]->(bonechisel)
MERGE (c6enc1act1)-[:NEXT]->(c6enc1act2:Action:Attack:MeleeAttack {weapon:'granite axe'})
MERGE (bonechisel)-[:MAKES_ACTION]->(c6enc1act2)-[:AGAINST {hits:true, result:'NA'}]->(c6npcOgress)


//-- c6s2
MERGE (c6s2:Section {name:'chapter 6 section 2',order:2})-[:OF_CHAPTER]->(c6)
SET ankhar.birthyearAC = 405,
  ankhar.birthyearSC = 22
MERGE (hiddukel:Entity {id:'hiddukel'})
SET  hiddukel:God,
  hiddukel.name = coalesce(hiddukel.name,'Hiddukel'),
  hiddukel.aliasList = apoc.coll.union(["Hiddukel","Prince of Lies"], hiddukel.aliasList)
MERGE (highPriest:Entity {id:'highPriest'})
SET  highPriest:Title,
  highPriest.title = 'High Priest'
MERGE (laka)-[:ATTAINED_RANK]->(highPriest)
SET laka.title = coalesce(laka.title,'high priestess'),
  laka.titleList = apoc.coll.union(["high priestess"], laka.titleList)
MERGE (laka)-[:WORSHIP]->(hiddukel)
MERGE (tinCup:Entity {id:'tinCup'})
SET  tinCup:Place:City,
  tinCup.name = coalesce(tinCup.name,'Tin Cup'),
  tinCup.aliasList = apoc.coll.union(["Tin Cup"], tinCup.aliasList)
MERGE (c6s2)-[c6s2setting:SETTING]->(tinCup)
SET c6s2setting.yearSC = 40,
  c6s2setting.yearAC = 423
MERGE (c6conv2 {id:"c6conv2"})-[:OCCURS]->(c6s1)
MERGE (underChief:Entity {id:"underChief"})
SET underChief:Title,
    underChief.title = 'under-chief'
MERGE (notch:Entity {id:"notch"})
SET notch:Hobgoblin,
    notch.name = coalesce(notch.name,'Notch'),
    notch.aliasList = apoc.coll.union(["Notch"], notch.aliasList),
    notch.title = coalesce(notch.title,'under-chief'),
    notch.titleList = apoc.coll.union(["under-chief"], notch.titleList)
MERGE (c6enc2:Encounter {name:"The Big House", type:"skirmish"})-[:OCCURS]->(c6s2)

// APPEARANCE
MERGE (bonechisel)-[:APPEARANCE]->(c6s2)
MERGE (ankhar)-[:APPEARANCE]->(c6s2)
MERGE (laka)-[:APPEARANCE]->(c6s2)

// REFERENCE
MERGE (hiddukel)-[:REFERENCE]->(c6s2)

// DIALOG
MERGE (c6conv2)-[:STARTS]->(c6conv2db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:"announcement", toneList:["announcement"]})
MERGE (bonechisel)-[:SAYS]->(c6conv2db1)
MERGE (c6conv2db1)-[:NEXT]->(c6conv2db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,18], primaryTone:"announcement", toneList:["announcement"]})
MERGE (bonechisel)-[:SAYS]->(c6conv2db2)
MERGE (c6conv2db2)-[:NEXT]->(c6conv2db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[16], primaryTone:"critical", toneList:["critical"]})
MERGE (ankhar)-[:SAYS]->(c6conv2db3)-[:TO]->(bonechisel)
MERGE (c6conv2db3)-[:NEXT]->(c6conv2db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[6], primaryTone:"earnest", toneList:["earnest"]})
MERGE (bonechisel)-[:SAYS]->(c6conv2db4)-[:TO]->(ankhar)
MERGE (c6conv2db4)-[:NEXT]->(c6conv2db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,3], primaryTone:"critical", toneList:["critical"]})
MERGE (ankhar)-[:SAYS]->(c6conv2db5)-[:TO]->(bonechisel)
MERGE (c6conv2db5)-[:NEXT]->(c6conv2db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[1], primaryTone:"demanding", toneList:["demanding"]})
MERGE (bonechisel)-[:SAYS]->(c6conv2db6)
MERGE (c6conv2db6)-[:NEXT]->(c6conv2db7:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:"demanding", toneList:["demanding"]})
MERGE (bonechisel)-[:SAYS]->(c6conv2db7)-[:TO]->(notch)

// ENCOUNTER
MERGE (c6enc2)-[:STARTS]->(c6enc2act1:Action:Attack:MeleeAttack {weapon:"knife"})
MERGE (bonechisel)-[:MAKES_ACTION]->(c6enc2act1)-[:AGAINST {hits:TRUE, result:"angers"}]->(notch)
MERGE (c6enc2act1)-[:NEXT]->(c6enc2act2:DialogBlock {sentenceCnt:1, wordsPerSentence:[2], primaryTone:"demanding", toneList:["demanding"]})
MERGE (ankhar)-[:SAYS]->(c6enc2act2)
MERGE (c6enc2act2)-[:NEXT]->(c6enc2act3:Action:Attack:UnarmedAttack {weapon:"hands"})
MERGE (notch)-[:MAKES_ACTION]->(c6enc2act3)-[:AGAINST {hits:TRUE, result:"grapples"}]->(bonechisel)
MERGE (c6enc2act3)-[:NEXT]->(c6enc2act4:Action:Attack:MeleeAttack {weapon:"knife"})
MERGE (bonechisel)-[:MAKES_ACTION]->(c6enc2act4)-[:AGAINST {hits:TRUE, result:"kills"}]->(notch)
MERGE (notch)-[:SLAIN_BY]->(bonechisel)
MERGE (c6enc2act4)-[:NEXT]->(c6enc2act5:Action:Attack:MeleeAttack {weapon:"spear"})
MERGE (ankhar)-[:MAKES_ACTION]->(c6enc2act5)-[:AGAINST {hits:TRUE, result:"kills"}]->(bonechisel)
MERGE (bonechisel)-[:SLAIN_BY]->(ankhar)
