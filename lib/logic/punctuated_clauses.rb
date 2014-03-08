module PunctuatedClauses
  def punctuated_clauses
    [
      [short_clauses.sample[0..-1] + [TextEng.n + TextEng.pcn] + short_clauses.sample],
      [medium_clauses.sample[0..-1] + [TextEng.n + TextEng.pcn] + short_clauses.sample]
    ].shuffle
  end
end
