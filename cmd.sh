#!/bin/sh

# MasterChef
# deployer address
MasterChefDeployer = "0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c"
aptos account fund-with-faucet --amount 100000000 --account 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c
# publish
aptos move publish --package-dir PATH_TO_REPO/MasterChef/

# add LPCoin
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::add \
--args u64:500 \
--type-args 0x796900ebe1a1a54ff9e932f19c548f5c1af5c6e7d34965857ac2f7b1d1ab2cbf::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::add \
--args u64:500 \
--type-args 0x796900ebe1a1a54ff9e932f19c548f5c1af5c6e7d34965857ac2f7b1d1ab2cbf::LPCoinV1::LPCoin\<0x1::aptos_coin::AptosCoin,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
# get dao fee
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::register_ANI
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::withdraw_dao_fee
# stake/leave ANI
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::enter_staking \
--args u64:100000000
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::leave_staking \
--args u64:100000000
# deposit/withdraw LPCoin
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::deposit \
--args u64:1000 \
--type-args 0x796900ebe1a1a54ff9e932f19c548f5c1af5c6e7d34965857ac2f7b1d1ab2cbf::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
aptos move run --function-id 0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::AnimeMasterChefV1::withdraw \
--args u64:1000 \
--type-args 0x796900ebe1a1a54ff9e932f19c548f5c1af5c6e7d34965857ac2f7b1d1ab2cbf::LPCoinV1::LPCoin\<0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::BTC,0x16fe2df00ea7dde4a63409201f7f4e536bde7bb7335526a35d05111e68aa322c::TestCoinsV1::USDT\>
