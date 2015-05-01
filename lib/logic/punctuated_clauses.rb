module PunctuatedClauses
  def punctuated_clauses
    [
      [short_clauses.sample[0..-1] + [Sober.n + Sober.pcn] + short_clauses.sample],
      [medium_clauses.sample[0..-1] + [Sober.n + Sober.pcn] + short_clauses.sample]
    ].shuffle
  end
end
