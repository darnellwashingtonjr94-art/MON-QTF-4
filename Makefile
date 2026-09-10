-include .env

.PHONY: all test clean deploy

all: clean remove update build

clean:
	forge clean

remove:
	rm -rf lib && touch .gitmodules

install:
	forge install foundry-rs/forge-std --no-commit

update:
	forge update

build:
	forge build --sizes

test:
	forge test --fork-url $(MONAD_TESTNET_RPC) -vvv

deploy-testnet:
	forge script script/deploy/MonQTFExecution.s.sol:DeployMonQTF --rpc-url $(MONAD_TESTNET_RPC) --private-key $(DEPLOYER_PRIVATE_KEY) --broadcast --verify
