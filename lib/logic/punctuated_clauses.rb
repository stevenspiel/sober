require_relative 'short_clauses'
require_relative 'medium_clauses'

punctuated_clauses = [
  [short_clauses.sample[0..-1] + [Filler.n + Filler.pcn] + short_clauses.sample],
  [medium_clauses.sample[0..-1] + [Filler.n + Filler.pcn] + short_clauses.sample]
]