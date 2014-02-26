module LongClauses
  def long_clauses
    [
      [Filler.n,Filler.a,Filler.c,Filler.n,Filler.v,Filler.a,Filler.pp,Filler.n,Filler.v,Filler.c,Filler.n,Filler.v,Filler.n],
      short_clauses[0] + short_clauses[1],
      short_clauses[2] + short_clauses[3],
      short_clauses[4] + short_clauses[5],
      medium_clauses[0] + medium_clauses[1],
      medium_clauses[2] + medium_clauses[3],
      medium_clauses[4] + short_clauses[5]
    ].shuffle
  end
end
