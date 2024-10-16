MERGE (niles:Entity {id:"niles"})
SET niles:Author,
  niles.firstname = coalesce(niles.firstname,"Douglas"),
  niles.lastname = coalesce(niles.lastname,"Niles"),
  niles.name = coalesce(niles.name,"Douglas Niles")
