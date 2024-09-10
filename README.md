# San Francisco Food Truck (SFFT)
SFFT is a [GraphQL](https://graphql.org/learn/) endpoint for San Francisco's public data of [food permits](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat/about_data) (aka food trucks) and their associated [schedules](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b/about_data)

It re-fetches the latest data [every morning at 8am](https://github.com/lokilow/sfft/blob/main/lib/sfft/data_fetcher.ex#L6)

See running app [here](fly.io link graphiql)
