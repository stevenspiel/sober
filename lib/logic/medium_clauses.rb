module MediumClauses
  def medium_clauses
    [
      [self.pp,self.pr,self.ad,self.ad,self.n,self.ar,self.pn,self.v,self.a],
      [self.pn,self.pp,self.n,self.pp,self.ar,self.ad,self.ad,self.n],
      [self.pr,self.ad,self.lv,self.c,self.a,self.ar,self.n],
      [self.lv,self.n,self.v,self.ad,self.ar,self.ar,self.n],
      [self.v,self.ad,self.n,self.pp,self.ar,self.n,self.v],
      [self.ar,self.n,self.lv,self.ad,self.a,self.n]
    ].shuffle
  end
end
