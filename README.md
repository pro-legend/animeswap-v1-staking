# AnimeSwap-Staking

**AnimeSwap** is AMM protocol for [Aptos](https://www.aptos.com/) blockchain. 

* [Contracts documents](https://docs.animeswap.org/docs/contracts)
* [SDK](https://github.com/AnimeSwap/v1-sdk)

The current repository contains: 

* MasterChef (Staking)
* AutoAni (WIP)

## Add as dependency

Update your `Move.toml` with

```toml
[dependencies.AnimeSwappStaking]
git = 'https://github.com/AnimeSwap/v1-staking.git'
rev = 'v0.0.1'
subdir = 'MasterChef'
```
