#!/bin/sh

# MasterChef
# deployer address
MasterChefDeployer = "0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78"
aptos account fund-with-faucet --amount 100000000 --account 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78
# publish
aptos move publish --package-dir PATH_TO_REPO/MasterChef/

# add LPCoin
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::add \
--args u64:500 \
--type-args 0xe73ee18380b91e37906a728540d2c8ac7848231a26b99ee5631351b3543d7cf2::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::add \
--args u64:500 \
--type-args 0xe73ee18380b91e37906a728540d2c8ac7848231a26b99ee5631351b3543d7cf2::LPCoinV1::LPCoin\<0x1::aptos_coin::AptosCoin,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
# get dev fee
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::register_ANI
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::withdraw_dao_fee
# stake/leave ANI
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::enter_staking \
--args u64:100000000
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::leave_staking \
--args u64:100000000
# deposit/withdraw LPCoin
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::deposit \
--args u64:1000 \
--type-args 0xe73ee18380b91e37906a728540d2c8ac7848231a26b99ee5631351b3543d7cf2::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
aptos move run --function-id 0x3e8c3184eef4aba3a91e2d99a08c47354320bc0b4d3ce7d5216d58ecacc0ef78::AnimeMasterChefV1::withdraw \
--args u64:1000 \
--type-args 0xe73ee18380b91e37906a728540d2c8ac7848231a26b99ee5631351b3543d7cf2::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
