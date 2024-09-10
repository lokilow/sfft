# San Francisco Food Truck (SFFT)
SFFT is a [GraphQL](https://graphql.org/learn/) endpoint written in Elixir using [Phoenix](https://hexdocs.pm/phoenix/overview.html) and [Absinthe](https://hexdocs.pm/absinthe/overview.html) for San Francisco's public data of [food permits](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/about_data) (aka food trucks) and their associated [schedules](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b/about_data)

It re-fetches the latest data [every morning at 8am Pacific Time](https://github.com/lokilow/sfft/blob/main/lib/sfft/data_fetcher.ex#L6) 

See running app [here](https://sfft.fly.dev/graphiql)
Try running the query 
```graphQL
{
  allPermits {
    locationId
    name
    type
    schedules {
      day
      open
      close
    }
  }
}
```

## Ops
API endpoint tests are located in [test/sfft_web/api_test.exs](https://github.com/lokilow/sfft/blob/main/test/sfft_web/api_test.exs)
Github Actions CI workflow is in [.github/workflows/elixir.yml](https://github.com/lokilow/sfft/blob/main/.github/workflows/elixir.yml)

### Next Steps
Extend the GraphQL schema to allow querying for a schedule by location id
