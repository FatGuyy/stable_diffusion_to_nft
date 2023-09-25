# Rename auth_example.py to auth.py, then paste your hugging face key in 
setup_locally:
	mv auth_example.py auth.py
	mv .env.example .env

# Clean the repo
clean  :; forge clean

# Install the forge Modules 
install-forge :; 
	forge install OpenZeppelin/openzeppelin-contracts
	forge install foundry-rs/forge-std

# Update Dependencies for forge
update:; forge update

# Builds forge
build  :; forge clean && forge build --optimize --optimizer-runs 1000000

source_env:
	source .env

