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
[dependencies.MasterChef]
git = 'https://github.com/AnimeSwap/v1-staking.git'
rev = 'v0.1.0'
subdir = 'MasterChef'
```
