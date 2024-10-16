MATCH (c1:Chapter {order:1})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})
MERGE (c1s1:Section {name:"chapter 1 section 1",order:1})-[:OF_CHAPTER]->(c1)

MERGE (cornellus:Entity {id:"cornellus"})
SET cornellus:HalfOgre:HalfHuman,
  cornellus.name = coalesce(cornellus.name,"Cornellus")
MERGE (dram:Entity {id:"dram"})
SET  dram:Dwarf,
  dram.name = coalesce(dram.name,"Dram Feldspar")
MERGE (jaymes:Entity {id:"jaymes"})
SET  jaymes:Human,
  jaymes.name = coalesce(jaymes.name,"Jaymes Markham"),
  jaymes.aliasList = apoc.coll.union(["Stranger", "Warrior"],jaymes.aliasList),
  jaymes.rightHanded = TRUE
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

// APPEARANCE
MERGE (dram)-[:APPEARANCE]->(c1s1)
MERGE (jaymes)-[:APPEARANCE]->(c1s1)

// REFERENCE
MERGE (cornellus)-[:REFERENCE]->(c1s1)

// Dialog
MERGE (conv1:Conversation {id:"conv1"})-[:OCCURS]->(c1s1)
MERGE (conv1)-[:STARTS]->(conv1db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[12,17], toneList:["concealed","hushed","informative"]})
MERGE (dram)-[:SAYS]->(conv1db1)-[:TO]->(jaymes)
MERGE (conv1db1)-[:NEXT]->(conv1db2:DialogBlock {gestureCnt:1, gestureDescriptionList:["concealed glance"], toneList:["casual","unconcern"]})
MERGE (jaymes)-[:GESTURES]->(conv1db2)
MERGE (conv1db2)-[:NEXT]->(conv1db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[8], toneList:["concealed","hushed","informative"]})
MERGE (dram)-[:SAYS]->(conv1db3)-[:TO]->(jaymes)
MERGE (conv1db3)-[:NEXT]->(conv1db4:DialogBlock {sentenceCnt:2, wordsPerSentence:[7,8], toneList:["loud","casual announcment","unconcern"]})
MERGE (dram)-[:SAYS]->(conv1db4)
MERGE (conv1db4)-[:NEXT]->(conv1db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[12], toneList:["concealed","hushed","informative"]})
MERGE (dram)-[:SAYS]->(conv1db5)-[:TO]->(jaymes)
MERGE (conv1db5)-[:NEXT]->(conv1db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[11], toneList:["concealed","hushed"]})
MERGE (jaymes)-[:SAYS]->(conv1db6)-[:TO]->(dram)
MERGE (conv1db6)-[:NEXT]->(conv1db7:DialogBlock {sentenceCnt:1, wordsPerSentence:[12], toneList:["concealed","hushed","informative"]})
MERGE (dram)-[:SAYS]->(conv1db7)-[:TO]->(jaymes)
MERGE (conv1db7)-[:NEXT]->(conv1db8:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], toneList:["concealed","hushed"]})
MERGE (jaymes)-[:SAYS]->(conv1db8)-[:TO]->(dram)
MERGE (conv1db8)-[:NEXT]->(conv1db9:DialogBlock {sentenceCnt:4, wordsPerSentence:[4,8,11,4], toneList:["loud","casual announcment","unconcern"]})
MERGE (dram)-[:SAYS]->(conv1db9)

MERGE (conv2:Conversation {id:"conv2"})-[:OCCURS]->(c1s1)
MERGE (conv2)-[:STARTS]->(conv2db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[8,8], toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(conv2db1)-[:TO]->(jaymes)
MERGE (conv2db1)-[:NEXT]->(conv2db2:DialogBlock {gestureCnt:1, gestureDescriptionList:["agree","nod"], toneList:["neutral"]})
MERGE (jaymes)-[:GESTURES]->(conv2db2)-[:TO]->(dram)

MERGE (conv3:Conversation {id:"conv3"})-[:OCCURS]->(c1s1)
MERGE (conv3)-[:STARTS]->(conv3db1:DialogBlock {gestureCnt:1, gestureDescriptionList:["questioning"], toneList:["mild impatience"]})
MERGE (jaymes)-[:GESTURES]->(conv3db1)-[:TO]->(dram)
MERGE (conv3db1)-[:NEXT]->(conv3db2:DialogBlock {sentenceCnt:3, wordsPerSentence:[5,2,9], toneList:["mild discontent"]})
MERGE (dram)-[:SAYS]->(conv3db2)-[:TO]->(jaymes)
MERGE (conv3db2)-[:NEXT]->(conv3db3:DialogBlock {sentenceCnt:1, wordsPerSentence:[7], toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(conv3db3)-[:TO]->(dram)


