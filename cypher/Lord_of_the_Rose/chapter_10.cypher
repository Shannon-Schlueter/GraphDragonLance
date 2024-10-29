MATCH (c10:Chapter {order: 10})-[:OF_BOOK]->(lotr:Book {name: 'Lord of the Rose'})

MATCH (crawford:Entity {id:'crawford'})
MATCH (hiddukel:Entity {id:'hiddukel'})
MATCH (issel:Entity {id:'issel'})

MATCH (selinda:Entity {id:'selinda'})
MATCH (marckus:Entity {id:'marckus'})
MATCH (martha:Entity {id:'martha'})
MATCH (jarrod:Entity {id:'jarrod'})
MATCH (rathskell:Entity {id:'rathskell'})
MATCH (castleCaergoth:Entity {id:'castleCaergoth'})
MATCH (knight:Entity {id:'knight'})
MATCH (captain:Entity {id:'captain'})
MATCH (kosSword:Entity {id:'kosSword'})
MATCH (reynaud:Entity {id:'reynaud'})

MATCH (garnet:Entity {id:'garnet'})
MATCH (kosRose:Entity {id:'kosRose'})
MATCH (ankhar:Entity {id:'ankhar'})

MATCH (laka:Entity {id:"laka"})



//-- Activity in c10s1
MERGE (c10s1:Section {name: 'chapter 10 section 1', order: 1})-[:OF_CHAPTER]->(c10)
MERGE (c10conv1 {id:'c10conv1'})-[:OCCURS]->(c10s1)
SET hiddukel.titleList = apoc.coll.union(["god of greed and corruption"],hiddukel.titleList),
  hiddukel.aliasList = apoc.coll.union(["the broken scale"],hiddukel.aliasList)
SET issel.titleList = apoc.coll.union (["nightmaster"],issel.titleList)

// APPEARANCE
MERGE (crawford)-[:APPERANCE]->(c10s1)
MERGE (issel)-[:APPERANCE]->(c10s1)

// REFERENCE
MERGE (hiddukel)-[:REFERENCE]->(c10s1)

// DIALOG
MERGE (c10conv1)-[:STARTS]->(c10conv1db1:DialogBlock {sentenceCnt:4, wordsPerSentence:[4,10,9,21], primaryTone:'reverent', toneList:['reverent']})
MERGE (crawford)-[:SAYS]->(c10conv1db1)-[:TO]->(hiddukel)
MERGE (c10conv1db1)-[:NEXT]->(c10conv1db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[11], primaryTone:'demanding', toneList:['demanding']})
MERGE (issel)-[:SAYS]->(c10conv1db2)-[:TO]->(crawford)
MERGE (c10conv1db2)-[:NEXT]->(c10conv1db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[13], primaryTone:'deferential', toneList:['deferential']})
MERGE (crawford)-[:SAYS]->(c10conv1db3)-[:TO]->(issel)
MERGE (c10conv1db3)-[:NEXT]->(c10conv1db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[9], primaryTone:'demanding', toneList:['demanding']})
MERGE (issel)-[:SAYS]->(c10conv1db4)-[:TO]->(crawford)
MERGE (c10conv1db4)-[:NEXT]->(c10conv1db5:DialogBlock {sentenceCnt:2, wordsPerSentence:[10,12], primaryTone:'earnest', toneList:['earnest']})
MERGE (crawford)-[:SAYS]->(c10conv1db5)-[:TO]->(issel)
MERGE (c10conv1db5)-[:NEXT]->(c10conv1db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[24], primaryTone:'demanding', toneList:['demanding']})
MERGE (issel)-[:SAYS]->(c10conv1db6)-[:TO]->(crawford)
MERGE (c10conv1db6)-[:NEXT]->(c10conv1db7:DialogBlock {sentenceCnt:1, wordsPerSentence:[12], primaryTone:'deferential', toneList:['deferential']})
MERGE (crawford)-[:SAYS]->(c10conv1db7)-[:TO]->(issel)
MERGE (c10conv1db7)-[:NEXT]->(c10conv1db8:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], primaryTone:'earnest', toneList:['earnest']})
MERGE (issel)-[:SAYS]->(c10conv1db8)-[:TO]->(crawford)
MERGE (c10conv1db8)-[:NEXT]->(c10conv1db9:DialogBlock {sentenceCnt:1, wordsPerSentence:[2], primaryTone:'critical', toneList:['critical']})
MERGE (crawford)-[:SAYS]->(c10conv1db9)-[:TO]->(issel)
MERGE (c10conv1db9)-[:NEXT]->(c10conv1db10:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,40], primaryTone:'critical', toneList:['critical']})
MERGE (issel)-[:SAYS]->(c10conv1db10)-[:TO]->(crawford)
MERGE (c10conv1db10)-[:NEXT]->(c10conv1db11:DialogBlock {sentenceCnt:2, wordsPerSentence:[9,7], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (crawford)-[:SAYS]->(c10conv1db11)-[:TO]->(issel)
MERGE (c10conv1db11)-[:NEXT]->(c10conv1db12:DialogBlock {sentenceCnt:2, wordsPerSentence:[1,25], primaryTone:'demanding', toneList:['demanding']})
MERGE (issel)-[:SAYS]->(c10conv1db12)-[:TO]->(crawford)
MERGE (c10conv1db12)-[:NEXT]->(c10conv1db13:DialogBlock {sentenceCnt:3, wordsPerSentence:[1,14,6], primaryTone:'deferential', toneList:['deferential']})
MERGE (crawford)-[:SAYS]->(c10conv1db13)-[:TO]->(issel)
MERGE (c10conv1db13)-[:NEXT]->(c10conv1db14:DialogBlock {sentenceCnt:4, wordsPerSentence:[3,3,2,4], primaryTone:'earnest', toneList:['earnest']})
MERGE (issel)-[:SAYS]->(c10conv1db14)-[:TO]->(crawford)

//-- Activity in c10s2
MERGE (c10s2:Section {name:'chapter 10 section 2', order:2})-[:OF_CHAPTER]->(c10)
MERGE (c10s2)-[:SETTING]->(castleCaergoth)
MERGE (c10conv2 {id:'c10conv2'})-[:OCCURS]->(c10s2)
MERGE (percival:Entity {id:'percival'})
SET percival:Human,
    percival.name = coalesce(percival.name,'Percival'),
    percival.aliasList = apoc.coll.union(["Percival"], percival.aliasList),
    percival.title = coalesce(percival.title,'sir'),
    percival.titleList = apoc.coll.union(["sir","captain of scouts"], percival.titleList)
MERGE (percival)-[:HAS_OCCUPATION]->(knight)
MERGE (percival)-[:ATTAINED_RANK]->(captain)
MERGE (percival)-[:MEMBER_OF]->(kosSword)
MERGE (c10conv3 {id:'c10conv3'})-[:OCCURS]->(c10s2)
MERGE (c10conv4 {id:'c10conv4'})-[:OCCURS]->(c10s2)
MERGE (c10npcMessenger {id:'Messenger',description:'a messenger interupting the duke convention'})-[:OCCURS]->(c10s2)

// APPEARANCE
MERGE (selinda)-[:APPERANCE]->(c10s2)
MERGE (jarrod)-[:APPERANCE]->(c10s2)
MERGE (rathskell)-[:APPERANCE]->(c10s2)
MERGE (crawford)-[:APPERANCE]->(c10s2)
MERGE (martha)-[:APPERANCE]->(c10s2)
MERGE (issel)-[:APPERANCE]->(c10s2)
MERGE (percival)-[:APPERANCE]->(c10s2)
MERGE (reynaud)-[:APPERANCE]->(c10s2)
MERGE (marckus)-[:REFERENCE]->(c10s2)

// DIALOG
MERGE (c10conv2)-[:STARTS]->(c10conv2db1:DialogBlock {sentenceCnt:17, wordsPerSentence:[13,17,19,17,39,25,7,17,35,36,23,32,23,10,14,25,22], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (selinda)-[:SAYS]->(c10conv2db1)
MERGE (c10conv2db1)-[:NEXT]->(c10conv2db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[30], primaryTone:'deferential', toneList:['deferential']})
MERGE (rathskell)-[:SAYS]->(c10conv2db2)-[:TO]->(selinda)
MERGE (c10conv2db2)-[:NEXT]->(c10conv2db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[6], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (selinda)-[:SAYS]->(c10conv2db3)-[:TO]->(rathskell)
MERGE (c10conv2db3)-[:NEXT]->(c10conv2db4:DialogBlock {sentenceCnt:7, wordsPerSentence:[18,31,9,12,14,9,12], primaryTone:'deferential', toneList:['deferential']})
MERGE (rathskell)-[:SAYS]->(c10conv2db4)-[:TO]->(selinda)
MERGE (c10conv2db4)-[:NEXT]->(c10conv2db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:'deferential', toneList:['deferential']})
MERGE (selinda)-[:SAYS]->(c10conv2db5)-[:TO]->(rathskell)

MERGE (c10conv3)-[:STARTS]->(c10conv3db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,20], primaryTone:'earnest', toneList:['earnest']})
MERGE (issel)-[:SAYS]->(c10conv3db1)
MERGE (c10conv3db1)-[:NEXT]->(c10conv3db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,12], primaryTone:'deferential', toneList:['deferential']})
MERGE (reynaud)-[:SAYS]->(c10conv3db2)
MERGE (c10conv3db2)-[:NEXT]->(c10conv3db3:DialogBlock {sentenceCnt:3, wordsPerSentence:[4,17,38], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (jarrod)-[:SAYS]->(c10conv3db3)
MERGE (c10conv3db3)-[:NEXT]->(c10conv3db4:DialogBlock {sentenceCnt:2, wordsPerSentence:[12,12], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (rathskell)-[:SAYS]->(c10conv3db4)

MERGE (c10conv4)-[:STARTS]->(c10conv4db1:DialogBlock {sentenceCnt:3, wordsPerSentence:[5,7,14], primaryTone:'earnest', toneList:['earnest']})
MERGE (c10npcMessenger)-[:SAYS]->(c10conv4db1)
MERGE (c10conv4db1)-[:NEXT]->(c10conv4db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,7], primaryTone:'demanding', toneList:['demanding']})
MERGE (crawford)-[:SAYS]->(c10conv4db2)
MERGE (c10conv4db2)-[:NEXT]->(c10conv4db3:DialogBlock {sentenceCnt:2, wordsPerSentence:[3,22], primaryTone:'diplomatic', toneList:['diplomatic']})
MERGE (rathskell)-[:SAYS]->(c10conv4db3)-[:TO]->(crawford)
MERGE (c10conv4db3)-[:NEXT]->(c10conv4db4:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:'earnest', toneList:['earnest']})
MERGE (jarrod)-[:SAYS]->(c10conv4db4)


//-- Activity in c10s3
MERGE (c10s3:Section {name:'chapter 10 section 3', order:3})-[:OF_CHAPTER]->(c10)
MERGE (c10s3)-[:SETTING]->(garnet)
MERGE (sirMikel:Entity {id:'sirMikel'})
SET sirMikel:Human,
    sirMikel.name = coalesce(sirMikel.name,'Mikel Horn'),
    sirMikel.aliasList = apoc.coll.union(["Mikel Horn"], sirMikel.aliasList),
    sirMikel.title = coalesce(sirMikel.title,'sir'),
    sirMikel.titleList = apoc.coll.union(["captain","lord","sir"], sirMikel.titleList)
MERGE (sirMikel)-[:HAS_OCCUPATION]->(knight)
MERGE (sirMikel)-[:MEMBER_OF]-(kosRose)
MERGE (sirMikel)-[:ATTAINED_RANK]->(captain)
MERGE (squireDynrall:Entity {id:'squireDynrall'})
SET squireDynrall:Human,
    squireDynrall.name = coalesce(squireDynrall.name,'Dynrall Wickam'),
    squireDynrall.aliasList = apoc.coll.union(["Dynrall Wickam"], squireDynrall.aliasList),
    squireDynrall.title = coalesce(squireDynrall.title,'squire'),
    squireDynrall.titleList = apoc.coll.union(["squire","aide"], squireDynrall.titleList)
MERGE (squireDynrall)-[:MEMBER_OF]->(kosRose)
MERGE (squireDynrall)-[:SUBORDINATE_OF]->(sirMikel)
MERGE (c10conv5 {id:'c10conv5'})-[:OCCURS]->(c10s3)
MERGE (c10enc1:Encounter {name:'Battle at Garnet', type:'battle'})-[:OCCURS]->(c10s3)
MERGE (c10enc1)-[:SETTING]->(garnet)
MERGE (c10enc1)-[:PROTAGONIST]->(sirMikel)
MERGE (c10enc1)-[:PROTAGONIST]->(c10enc1p1 {name:'Defenders of Garnet'})
MERGE (c10enc1)-[:ANTAGONIST]->(ankhar)
MERGE (c10enc1)-[:ANTAGONIST]->(c10enc1p2 {name:"Ankhar's goblin horde"})
MERGE (c10enc1p2)-[:PARTY_MEMBER]->(c10enc1p2comb1:Combatant:Goblin {id:'c10enc1p2comb1', order:1})
MERGE (c10enc1p2)-[:PARTY_MEMBER]->(c10enc1p2comb2:Combatant:Goblin {id:'c10enc1p2comb2', order:2})

// APPEARANCE
MERGE (sirMikel)-[:APPERANCE]->(c10s3)
MERGE (squireDynrall)-[:APPERANCE]->(c10s3)
MERGE (ankhar)-[:APPERANCE]->(c10s3)

// DIALOG
MERGE (c10conv5)-[:STARTS]->(c10conv5db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[10], primaryTone:'earnest', toneList:['earnest']})
MERGE (squireDynrall)-[:SAYS]->(c10conv5db1)-[:TO]->(sirMikel)
MERGE (c10conv5db1)-[:NEXT]->(c10conv5db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:'deferential', toneList:['deferential']})
MERGE (squireDynrall)-[:SAYS]->(c10conv5db2)-[:TO]->(sirMikel)
MERGE (c10conv5db2)-[:NEXT]->(c10conv5db3:DialogBlock {sentenceCnt:3, wordsPerSentence:[2,15,6], primaryTone:'earnest', toneList:['earnest']})
MERGE (sirMikel)-[:SAYS]->(c10conv5db3)-[:TO]->(squireDynrall)
MERGE (c10conv5db3)-[:NEXT]->(c10conv5db4:DialogBlock {sentenceCnt:5, wordsPerSentence:[17,15,6,6,2], primaryTone:'deferential', toneList:['deferential']})
MERGE (squireDynrall)-[:SAYS]->(c10conv5db4)-[:TO]->(sirMikel)
MERGE (c10conv5db4)-[:NEXT]->(c10conv5db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], primaryTone:'earnest', toneList:['earnest']})
MERGE (sirMikel)-[:SAYS]->(c10conv5db5)-[:TO]->(squireDynrall)
MERGE (c10conv5db5)-[:NEXT]->(c10conv5db6:DialogBlock {sentenceCnt:4, wordsPerSentence:[13,6,17,15], primaryTone:'earnest', toneList:['earnest']})
MERGE (squireDynrall)-[:SAYS]->(c10conv5db6)-[:TO]->(sirMikel)
MERGE (c10conv5db6)-[:NEXT]->(c10conv5db7:DialogBlock {sentenceCnt:2, wordsPerSentence:[10,4], primaryTone:'earnest', toneList:['earnest']})
MERGE (sirMikel)-[:SAYS]->(c10conv5db7)-[:TO]->(squireDynrall)
MERGE (c10conv5db7)-[:NEXT]->(c10conv5db8:DialogBlock {sentenceCnt:3, wordsPerSentence:[5,14,14], primaryTone:'earnest', toneList:['earnest']})
MERGE (squireDynrall)-[:SAYS]->(c10conv5db8)-[:TO]->(sirMikel)
MERGE (c10conv5db8)-[:NEXT]->(c10conv5db9:DialogBlock {sentenceCnt:5, wordsPerSentence:[2,5,4,4,7], primaryTone:'earnest', toneList:['earnest']})
MERGE (sirMikel)-[:SAYS]->(c10conv5db9)-[:TO]->(squireDynrall)
MERGE (c10conv5db9)-[:NEXT]->(c10conv5db10:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,3], primaryTone:'earnest', toneList:['earnest']})
MERGE (sirMikel)-[:SAYS]->(c10conv5db10)-[:TO]->(squireDynrall)

// ENCOUNTER
MERGE (c10enc1)-[:STARTS]->(c10enc1act1:Action:Attack)
MERGE (c10enc1p2)-[:MAKES_ACTION]->(c10enc1act1)-[:AGAINST {hits:true, result:'Overcomes'}]->(c10enc1p1)
MERGE (c10enc1act1)-[:NEXT]->(c10enc1act2:Action:Attack:MeleeAttack {weapon:'broadsword'})
MERGE (sirMikel)-[:MAKES_ACTION]->(c10enc1act2)-[:AGAINST {hits:true, result:'kills'}]->(c10enc1p2comb1)
MERGE (c10enc1act2)-[:NEXT]->(c10enc1act3:Action:Attack:MeleeAttack {weapon:'broadsword'})
MERGE (sirMikel)-[:MAKES_ACTION]->(c10enc1act3)-[:AGAINST {hits:true, result:'kills'}]->(c10enc1p2comb2)
MERGE (c10enc1act3)-[:NEXT]->(c10enc1act4:Action:Attack:MeleeAttack {weapon:'spear'})
MERGE (ankhar)-[:MAKES_ACTION]->(c10enc1act4)-[:AGAINST {hits:true, result:'kills'}]->(sirMikel)
MERGE (sirMikel)-[:SLAIN_BY {description:"the haft struck home, shattering Sir Mikel's helmet in two, crushing the man's skull"}]->(ankhar)
MERGE (c10enc1act4)-[:NEXT]->(c10enc1act5:Action:Attack:MeleeAttack {weapon:''})
MERGE (c10enc1p2)-[:MAKES_ACTION]->(c10enc1act5)-[:AGAINST {hits:true, result:'sacks'}]->(garnet)
MERGE (garnet)-[:SACKED_BY]->(c10enc1p2)


//-- Activity in c10s4
MERGE (c10s4:Section {name:'chapter 10 section 4', order:4})-[:OF_CHAPTER]->(c10)
MERGE (c10s4)-[:SETTING]->(garnet)

// APPEARANCE
MERGE (laka)-[:APPERANCE]->(c10s4)
MERGE (c10conv6 {id:"c10conv6"})-[:OCCURS]->(c10s4)

// DIALOG
MERGE (c10conv6)-[:STARTS]->(c10conv6db1:DialogBlock {sentenceCnt:1, wordsPerSentence:[2], primaryTone:"earnest", toneList:["earnest"]})
MERGE (laka)-[:SAYS]->(c10conv6db1)-[:TO]->(ankhar)
MERGE (c10conv6db1)-[:NEXT]->(c10conv6db2:DialogBlock {sentenceCnt:4, wordsPerSentence:[1,2,7,8], primaryTone:"earnest", toneList:["earnest"]})
MERGE (ankhar)-[:SAYS]->(c10conv6db2)-[:TO]->(laka)
MERGE (c10conv6db2)-[:NEXT]->(c10conv6db3:DialogBlock {sentenceCnt:2, wordsPerSentence:[5,7], primaryTone:"sarcastic", toneList:["sarcastic"]})
MERGE (laka)-[:SAYS]->(c10conv6db3)-[:TO]->(ankhar)
MERGE (c10conv6db3)-[:NEXT]->(c10conv6db4:DialogBlock {sentenceCnt:4, wordsPerSentence:[12,5,4,4], primaryTone:"earnest", toneList:["earnest"]})
MERGE (ankhar)-[:SAYS]->(c10conv6db4)-[:TO]->(laka)
MERGE (c10conv6db4)-[:NEXT]->(c10conv6db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], primaryTone:"deferential", toneList:["deferential"]})
MERGE (laka)-[:SAYS]->(c10conv6db5)-[:TO]->(ankhar)
MERGE (c10conv6db5)-[:NEXT]->(c10conv6db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[3], primaryTone:"earnest", toneList:["earnest"]})
MERGE (ankhar)-[:SAYS]->(c10conv6db6)-[:TO]->(laka)
