MATCH (c0:Chapter {order:0})-[:OF_BOOK]->(lotr:Book {name: "Lord of the Rose"})

MERGE (c0s1:Section {name:"prologue section 1",order:1})-[:OF_CHAPTER]->(c0)
MERGE (takhisis:Entity {id:"takhisis"})
SET	takhisis.name = coalesce(takhisis.name,"Takhisis")
SET 	takhisis:God,
takhisis.aliasList = apoc.coll.union(["Takhisis","The Dark Queen","The One God"],takhisis.aliasList)
MERGE (takhisis)-[:REFERENCE]->(c0s1)
MERGE (silvanoshei:Entity {id:"silvanoshei"})
SET	silvanoshei.name = coalesce(silvanoshei.name,"Silvanoshei")
SET  silvanoshei:Elf,
  silvanoshei.aliasList = apoc.coll.union(["Silvanoshei","The elf heir"],silvanoshei.aliasList)
MERGE (silvanoshei)-[:REFERENCE]->(c0s1)
MERGE (paladine:Entity {id:"paladine"})
SET  paladine.name = coalesce(paladine.name,"Paladine")
SET  paladine:God,
  paladine.aliasList = apoc.coll.union(["Paladine","Patriarch of the Gods"],paladine.aliasList)
MERGE (paladine)-[:REFERENCE]->(c0s1)
MERGE (mina:Entity {id:"mina"})
SET mina.name=coalesce(mina.name,"Mina")
MERGE (mina)-[:REFERENCE]->(c0s1)
MERGE (mina)-[r:IS_A_x_OF]->(takhisis)
ON CREATE SET r.descriptor="prophet"
MERGE (silvanoshei)-[:SLAIN_BY]->(mina)
MERGE (solamnia:Entity {id:"solamnia"})
SET solamnia:Place:Nation,
  solamnia.name = coalesce(solamnia.name, "Solamnia")
MERGE (darkKnights:Entity {id:"darkKnights"})
SET  darkKnights.name = "The Dark Knights"
SET  darkKnights:Group,
  darkKnights.aliasList = apoc.coll.union(["The Dark Knights","The Knights of Takhisis"],darkKnights.aliasList)
MERGE (darkKnights)-[:WORSHIP]->(takhisis)
MERGE (darkKnights)-[:REFERENCE]->(c0s1)
MERGE (palanthas:Entity {id:"palanthas"})
SET palanthas.name = "Palanthas"
SET palanthas:Place:City
MERGE (palanthianDocks:Entity {id:"palanthianDocks"})
SET palanthianDocks.name = "The Palanthian Docks"
SET  palanthianDocks:Place:POI:Dock
MERGE (palanthianDocks)-[:REFERENCE]->(c0s1)
MERGE (palanthianDocks)-[:IN]->(palanthas)
MERGE (solanthus:Entity {id:"solanthus"})
SET solanthus.name = "Solanthus"
SET  solanthus:Place:City
MERGE (solanthianTreasury:Entity {id:"solanthianTreasury"})
SET solanthianTreasury.name = "The Solanthian Treasury"
SET  solanthianTreasury:Place:POI:Treasury
MERGE (solanthianTreasury)-[:IN]->(solanthus)
MERGE (solanthianTreasury)-[:REFERENCE]->(c0s1)
MERGE (caergoth:Entity {id:"caergoth"})
SET  caergoth.name = "Caergoth"
SET  caergoth:Place:City
MERGE (grainExchange:Entity {id:"grainExchange"})
SET grainExchange.name = "The Grain Exchange of Caergoth"
SET grainExchange:Place:POI:Marketplace
MERGE (grainExchange)-[:IN]->(caergoth)
MERGE (grainExchange)-[:REFERENCE]->(c0s1)
MERGE (garnet:Entity {id:"garnet"})
SET  garnet.name = "Garnet"
SET garnet:Place:City
MERGE (woolMarkets:Entity {id:"woolMarkets"})
SET woolMarkets.name = "The Wool Markets of Garnet"
SET woolMarkets:Place:POI:Marketplace
MERGE (woolMarkets)-[:IN]->(garnet)
MERGE (woolMarkets)-[:REFERENCE]->(c0s1)
MERGE (thelgaard:Entity {id:"thelgaard"})
SET thelgaard.name = "Thelgaard"
SET  thelgaard:Place:City
MERGE (kos:Entity {id:"kos"})
SET  kos.name = "The Knights of Solamnia"
SET kos:Group
MERGE (kos)-[:REFERENCE]->(c0s1)
MERGE (kosOathMeasure:Entity {id:"kosOathMeasure"})
SET  kosOathMeasure.text = "The Oath and The Measure"
SET  kosOathMeasure:Principle
MERGE (kos)-[:HAS_PRINCIPLE]->(kosOathMeasure)
MERGE (kosMyHonor:Entity {id:"kosMyHonor"})
SET kosMyHonor.text = "My honor is my life",
  kosMyHonor.orignialText = "Est Sularus oth Mithas"
SET kosMyHonor:Slogan
MERGE (kos)-[:HAS_SLOGAN]->(kosMyHonor)
MERGE (sanction:Entity {id:"sanction"})
SET  sanction.name = coalesce(sanction.name,"Sanction")
SET  sanction:Place:City
MERGE (kos)-[kosBPsanction:BASE_OF_POWER_IN]->(sanction)
ON CREATE SET kosBPsanction.type = "Bastion"
MERGE (tasgall:Entity {id:"tasgall"})
SET  tasgall.name = coalesce(tasgall.name,"Tasgall")
SET  tasgall:Human,
  tasgall.aliasList = apoc.coll.union(["Tasgall","Chairman of the Whitestone Council"],tasgall.aliasList),
  tasgall.titleList = apoc.coll.union(["lord","lord chairman"],tasgall.titleList)
MERGE (tasgall)-[:REFERENCE]->(c0s1)
MERGE (tasgall)-[:LIVES_IN]->(sanction)
MERGE (whitestoneCouncil:Entity {id:"whitestoneCouncil"})
SET  whitestoneCouncil.name = coalesce(whitestoneCouncil.name,"The Whitestone Council")
SET  whitestoneCouncil:Group
MERGE (whitestoneCouncil)-[:REFERENCE]->(c0s1)
MERGE (whitestoneCouncil)-[whitestoneCouncilBPsanction:BASE_OF_POWER_IN]->(sanction)
SET whitestoneCouncilBPsanction.type = "Headquarter"
MERGE (tasgall)-[tasgallLeadWhitestone:LEADER_OF]->(whitestoneCouncil)
SET tasgallLeadWhitestone.titleList = apoc.coll.union(["chairman"],tasgallLeadWhitestone.titleList)
MERGE (whitestoneCouncil)-[whitestoneLeadKOS:LEADER_OF]->(kos)
SET whitestoneLeadKOS.title="governing council"
MERGE (kosCrown:Entity {id:"kosCrown"})
SET kosCrown:Group,
  kosCrown.name = coalesce(kosCrown.name,"Order of the Crown")
MERGE (kosCrown)-[:REFERENCE]->(c0s1)
MERGE (kosCrown)-[:ORDER_OF]->(kos)
MERGE (kosRose:Entity {id:"kosRose"})
SET kosRose:Group,
  kosRose.name = coalesce(kosRose.name,"Order of the Rose")
MERGE (kosRose)-[:REFERENCE]->(c0s1)
MERGE (kosRose)-[:ORDER_OF]->(kos)
MERGE (kosSword:Entity {id:"kosSword"})
SET kosSword:Group,
  kosSword.name = coalesce(kosSword.name,"Order of the Sword")
MERGE (kosSword)-[:REFERENCE]->(c0s1)
MERGE (kosSword)-[:ORDER_OF]->(kos)
MERGE (kiriJolith:Entity {id:"kiriJolith"})
SET  kiriJolith:God,
  kiriJolith.name = coalesce(kiriJolith.name,"Kiri-Jolith"),
  kiriJolith.aliasList = apoc.coll.union(["Kiri-Jolith","Kiri-Jolith the Just"],kiriJolith.aliasList)
MERGE (kiriJolith)-[:REFERENCE]->(c0s1)
MERGE (kos)-[:WORSHIP]->(kiriJolith)
MERGE (mishakal:Entity {id:"mishakal"})
SET  mishakal:God,
  mishakal.name = coalesce(mishakal.name,"Mishakal"),
  mishakal.aliasList = apoc.coll.union(["Mishakal","Mishakal the Merciful"],mishakal.aliasList)
MERGE (mishakal)-[:REFERENCE]->(c0s1)
MERGE (kos)-[:HONORED]->(mishakal)
MERGE (shinare:Entity {id:"shinare"})
SET  shinare:God,
  shinare.name = coalesce(shinare.name,"Shinare"),
  shinare.aliasList = apoc.coll.union(["Shinare","Shinare of the Scales","The Merchant God"],shinare.aliasList)
MERGE (shinare)-[:REFERENCE]->(c0s1)
MERGE (kos)-[:HONORED]->(shinare)
MERGE (coryn:Entity {id:"coryn"})
SET  coryn:Human,
  coryn.name = coalesce(coryn.name,"Coryn"),
  coryn.aliasList = apoc.coll.union(["Coryn","Coryn the White"],coryn.aliasList)
MERGE (coryn)-[:REFERENCE]->(c0s1)
MERGE (jenna:Entity {id:"jenna"})
SET  jenna:Human,
  jenna.name = coalesce(jenna.name,"Jenna"),
  jenna.aliasList = apoc.coll.union(["Jenna","Mistress of the Red Robe"],jenna.aliasList)
MERGE (jenna)-[:REFERENCE]->(c0s1)
MERGE (coryn)-[corynIsAOfJenna:IS_A_x_OF]->(jenna)
SET corynIsAOfJenna.descriptor = coalesce(corynIsAOfJenna.descriptor,"protégé")
MERGE (bakkard:Entity {id:"bakkard"})
SET  bakkard:Human,
  bakkard.aliasList = apoc.coll.union(["Bakkard","Lord Regent of Palanthas"],bakkard.aliasList),
  bakkard.name = "Bakkard Du Chagne",
  bakkard.titleList = apoc.coll.union(["lord regent","lord mayor","lord","prince"],bakkard.titleList)
MERGE (bakkard)-[:REFERENCE]->(c0s1)
MERGE (bakkard)-[bakkardLeadPalanthas:LEADER_OF]->(palanthas)
SET bakkardLeadPalanthas.titleList = apoc.coll.union(["lord mayor","lord regent"],bakkardLeadPalanthas.titleList)
MERGE (merchant:Entity {id:"merchant"})
SET  merchant:Occupation,
  merchant.name = "Merchant"
MERGE (bakkard)-[bakkardMerchantPrince:HAS_OCCUPATION]->(merchant)
SET  bakkardMerchantPrince.title = "Prince"
MERGE (prince:Entity {id:"prince"})
SET  prince:Title,
  prince.title = "Prince"
MERGE (bakkard)-[:HAS_BIRTHRIGHT]->(prince)
MERGE (bakkardInvLordRegePala:Entity {id:"bakkardInvLordRegePala"})
SET  bakkardInvLordRegePala:Event:Investiture,
  bakkardInvLordRegePala.year = "37 SC",
  bakkardInvLordRegePala.description = "Invested as Ruling Mayor and Lord Regent of Palanthas"
MERGE (bakkardInvLordRegePala)-[:REFERENCE]->(c0s1)
MERGE (bakkard)-[:INVESTED]->(bakkardInvLordRegePala)
MERGE (tasgall)-[:DECREED]->(bakkardInvLordRegePala)
MERGE (whitestoneCouncil)-[:DECREED]->(bakkardInvLordRegePala)
MERGE (lordRegent:Entity {id:"lordRegent"})
SET  lordRegent:Title,
  lordRegent.title = "Lord Regent"
MERGE (bakkardInvLordRegePala)-[:WITH_TITLE]->(lordRegent)
MERGE (bakkardInvLordRegePala)-[:OVER]->(palanthas)
MERGE (bakkard)-[:ATTAINED_RANK]->(lordRegent)
MERGE (sancrist:Entity {id:"sancrist"})
SET  sancrist:Place:City,
  sancrist.name = "Sancrist"
MERGE (sancrist)-[:REFERENCE]->(c0s1)
MERGE (hubert:Entity {id:"hubert"})
SET  hubert:Human,
  hubert.name = coalesce(hubert.name,"Hubert"),
  hubert.titleList = apoc.coll.union(["lord","sir"],hubert.titleList)
MERGE (hubert)-[:REFERENCE]->(c0s1)
MERGE (hubert)-[hubertMemKosRose:MEMBER_OF]->(kosRose)
SET hubertMemKosRose.titleList = apoc.coll.union(["Captain of the Rose"],hubertMemKosRose.titleList)
MERGE (captain:Entity {id:"captain"})
SET  captain:Title,
  captain.title = "Captain"
MERGE (hubert)-[:ATTAINED_RANK]->(captain)
MERGE (duke:Entity {id:"duke"})
SET duke:Title,
  duke.title = "Duke"
MERGE (crawford:Entity {id:"crawford"})
SET  crawford:Human,
  crawford.aliasList = apoc.coll.union(["Crawford","Duke Crawford","Duke of Caergoth"],crawford.aliasList),
  crawford.name = coalesce(crawford.name,"Crawford"),
  crawford.titleList = apoc.coll.union(["duke","lord","sir"],crawford.titleList)
MERGE (crawford)-[:REFERENCE]->(c0s1)
MERGE (crawford)-[crawfordIsOfHubert:IS_A_x_OF]->(hubert)
SET  crawfordIsOfHubert.child = TRUE,
  crawfordIsOfHubert.descriptorList = apoc.coll.union(["son"],crawfordIsOfHubert.descriptorList)
MERGE (crawford)-[crawfordLeadCaergoth:LEADER_OF]->(caergoth)
SET crawfordLeadCaergoth.titleList = apoc.coll.union(["Duke of Caergoth"],crawfordLeadCaergoth.titleList)
MERGE (crawford)-[:ATTAINED_RANK]->(duke)
MERGE (crawfordInvDukeCaer:Entity {id:"crawfordInvDukeCaer"})
SET  crawfordInvDukeCaer:Investiture,
  crawfordInvDukeCaer.year = "39 SC",
  crawfordInvDukeCaer.descriptionList = apoc.coll.union(["Invested as the Duke of Caergoth"],crawfordInvDukeCaer.descriptionList)
MERGE (crawfordInvDukeCaer)-[:REFERENCE]->(c0s1)
MERGE (crawfordInvDukeCaer)-[:OVER]->(caergoth)
MERGE (crawfordInvDukeCaer)-[:WITH_TITLE]->(duke)
MERGE (crawfordInvDukeCaer)-[:SELECTED_BY]->(bakkard)
MERGE (crawford)-[:INVESTED]->(crawfordInvDukeCaer)
MERGE (lorimar:Entity {id:"lorimar"})
SET  lorimar:Human,
  lorimar.name = coalesce(lorimar.name,"Lorimar"),
  lorimar.aliasList = apoc.coll.union(["Lorimar"],lorimar.aliasList),
  lorimar.titleList = apoc.coll.union(["lord","sir"],lorimar.titleList)
MERGE (lorimar)-[:REFERENCE]->(c0s1)
MERGE (giantsmiter:Entity {id:"giantsmiter"})
SET  giantsmiter:Artifact,
  giantsmiter.name = coalesce(giantsmiter.name,"Giantsmiter"),
  giantsmiter.type = coalesce(giantsmiter.type,"long sword"),
  giantsmiter.description = coalesce(giantsmiter.description,"a mighty flaming sword, an ancient artifact of the knighthood")
MERGE (giantsmiter)-[:REFERENCE]->(c0s1)
MERGE (lorimar)-[:POSSESED]->(giantsmiter)
