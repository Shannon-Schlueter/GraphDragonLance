MERGE (wotc:Entity {id:"wotc"})
SET wotc:Publisher,
  wotc.name = coalesce(wotc.name,"Wizards of the Coast LLC. Hasbro SA"),
  wotc.nameList = apoc.coll.union(["Wizards of the Coast LLC. Hasbro SA"], wotc.nameList)
