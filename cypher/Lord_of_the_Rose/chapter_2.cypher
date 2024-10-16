MATCH (c2:Chapter {order:2})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})
MATCH (c1Trip:Trip)-[:OCCURS]->(:Section {order:1})-[:OF_CHAPTER]->(:Chapter {order:1})-[:OF_BOOK]->(lotr)

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
SET cornellus.aliasList = apoc.coll.union(["Cornel"],cornellus.aliasList)
MERGE (knight:Entity {id:"knight"})
SET  knight:Occupation,
  knight.name = "Knight"
MERGE (reynaud:Entity {id:"reynaud"})
SET  reynaud:Human,
  reynaud.name = coalesce(reynaud.name,"Reynaud"),
  reynaud.titleList = apoc.coll.union(["sir"],reynaud.titleList)
MERGE (reynaud)-[:HAS_OCCUPATION]->(knight)
MERGE (reynaud)-[:MEMBER_OF]->(kosRose)
MERGE (reynaud)-[:CONVERSATION {reference:"Lord of the Rose:c2s1",dialog_exchange:6}]->(jaymes)
MERGE (dram)-[:CONVERSATION {reference:"Lord of the Rose:c2s1", dialog_exchange:1}]->(reynaud)
MERGE (kayolin:Entity {id:"kayolin"})
SET  kayolin:Place:Kingdom,
  kayolin.name = coalesce(kayolin.name,"Kayolin")
MERGE (dram)-[:ORIGINATES_FROM]->(kayolin)

// APPEARANCE
MERGE (dram)-[:APPEARANCE]->(c2s1)
MERGE (jaymes)-[:APPEARANCE]->(c2s1)
MERGE (reynaud)-[:APPEARANCE]->(c2s1)

// REFERENCE
MERGE (cornellus)-[:REFERENCE]->(c2s1)

// Dialog
MERGE (conv1:Conversation {id:"conv1"})-[:OCCURS]->(c2s1)
MERGE (conv1)-[:STARTS]->(conv1db1:DialogBlock {sentenceCnt:3, wordsPerSentence:[3,22,10], toneList:["informative","laconical"]})
MERGE (dram)-[:SAYS]->(conv1db1)-[:TO]->(jaymes)
MERGE (conv1db1)-[:NEXT]->(conv1db2:DialogBlock {sentenceCnt:2, wordsPerSentence:[12,11], toneList:["joking","laconical"]})
MERGE (dram)-[:SAYS]->(conv1db2)-[:TO]->(jaymes)

MERGE (conv2:Conversation {id:"conv2"})-[:OCCURS]->(c2s1)
MERGE (conv2)-[:STARTS]->(conv2db1:DialogBlock {sentenceCnt:2, wordsPerSentence:[8,8], toneList:["questioning","authoritative"]})
MERGE (reynaud)-[:SAYS]->(conv2db1)-[:TO]->(jaymes)
MERGE (conv2db1)-[:NEXT]->(conv2db2:DialogBlock {sentenceCnt:1, wordsPerSentence:[4], toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(conv2db2)-[:TO]->(reynaud)
MERGE (conv2db2)-[:NEXT]->(conv2db3:DialogBlock {sentenceCnt:2, wordsPerSentence:[4,4], toneList:["questioning","suspitious"]})
MERGE (reynaud)-[:SAYS]->(conv2db1)-[:TO]->(jaymes)
MERGE (conv2db3)-[:NEXT]->(conv2db4:DialogBlock {gestureCnt:1, gestureDescriptionList:["nope","nod"], toneList:["neutral"]})
MERGE (jaymes)-[:GESTURES]->(conv2db4)-[:TO]->(reynaud)
MERGE (conv2db4)-[:NEXT]->(conv2db2:DialogBlock {sentenceCnt:3, wordsPerSentence:[3,10,6], toneList:["questioning","suspitious"]})
MERGE (reynaud)-[:SAYS]->(conv2db4)-[:TO]->(jaymes)
MERGE (conv2db4)-[:NEXT]->(conv2db5:DialogBlock {sentenceCnt:1, wordsPerSentence:[1], toneList:["neutral"]})
MERGE (jaymes)-[:SAYS]->(conv2db2)-[:TO]->(reynaud)
MERGE (conv2db5)-[:NEXT]->(conv2db6:DialogBlock {sentenceCnt:1, wordsPerSentence:[5], toneList:["neutral"]})
MERGE (dram)-[:SAYS]->(conv2db2)-[:TO]->(reynaud)
