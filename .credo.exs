%{
  configs: [
    %{
      name: "default",
      checks: [
        {Credo.Check.Readability.StrictModuleLayout, priority: :high},
        {Credo.Check.Readability.UnnecessaryAliasExpansion, priority: :high},
        {Credo.Check.Refactor.CondStatements, priority: :high},
        {Credo.Check.Refactor.Nesting, priority: :high, max_nesting: 3},
        {Credo.Check.Refactor.PipeChainStart, priority: :high},
        {Credo.Check.Warning.UnsafeToAtom, priority: :high}
      ]
    }
  ]
}
