module ShortClauses
  def short_clauses
    [
      [self.lv,self.n,self.v,self.ad,self.ar,self.n],
      [self.pp,self.ar,self.ad,self.n,self.lv,self.n],
      [self.pp,self.n,self.n,self.lv,self.n],
      [self.n,self.v,self.c,self.n,self.v],
      [self.n,self.v,self.ar,self.n],
      [self.n,self.lv,self.ar,self.n]
    ].shuffle
  end
end

