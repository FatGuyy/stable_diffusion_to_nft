# Rename auth_example.py to auth.py, then go in it and manually paste your hugging face key 
setup_locally:
	mv auth_example.py auth.py

# Clean the repo
clean  :; forge clean

# Install the Modules
install-forge :; 
	forge install OpenZeppelin/openzeppelin-contracts
	forge install foundry-rs/forge-std

# Update Dependencies
update:; forge update

# Builds
build  :; forge clean && forge build --optimize --optimizer-runs 1000000

source_env:
	source .env

