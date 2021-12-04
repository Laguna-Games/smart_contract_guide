# Configure MetaMask and Blockchain Environments

MetaMask is a Chrome/Firefox browser plugin that holds your crypto keys and cryptographically signs blockchain transactions.

Ganache is an Ethereum blockchain that runs on your local computer. 

---
## Install the plugin
1. Download and install the MetaMask plugin from https://metamask.io/
2. Go to https://polygonscan.com/ and scroll to the bottom of the page.
	* Click the button to Add Polygon Network. MetaMask will prompt you to add the Polygon network.
3. Go to https://mumbai.polygonscan.com/ and scroll to the bottom of the page. 
	* Click the button to Add Mumbai Network. MetaMask will prompt you to add the Mumbai testnet.

---
## Install Ganache
1. Download and install Ganache from https://trufflesuite.com/ganache/
	* Alternately, use Homebrew: `brew install --cask ganache`
2. Start Ganache and create a New Workspace.
3. Import the Ganache test wallet(s) into MetaMask:
	* If you are fully logged out of MetaMask, click the link to `import Using Secret Recovery Phrase` and enter the MNEMONIC from the top of the Ganache window.
	* If you are already logged into MetaMask, click the identicon in the top right corner of MetaMask and choose Import Account; copy the private key from Ganache using the key icon on the right side of each wallet entry.
4. Open MetaMask and open the `⋮` menu, choose Expand View.
5. In the top of the MetaMask page, open the Networks menu and choose Add Network.
6. Name the new network `Ganache (Localhost)` and copy the values at the top of the Ganache window into the MetaMask configuration: 
	* RPC SERVER » New RPC URL
	* NETWORK ID » Chain ID
7. Save the new network and select it in MetaMask.

---
## Environments
Note that your "wallet" is just a private key (mnemonic), and the same keys work across all of the different blockchains. On each blockchain, your wallet will have different balances of different tokens. Be mindful of the wallet and network you have selected at all times.

#### Ethereum Mainnet
* The real Ethereum blockchain, using real money.
* Don't use test keys/wallets here.
* Don't deploy to Ethereum Mainnet unless you are deploying something real.

#### Polygon Mainnet
* The real Polygon blockchain, using real money.
* Don't use test keys/wallets here.
* Polygon is much faster and cheaper than Ethereum so it is cheaper to try things here. 
* Use the faucet https://matic.supply/ to send yourself a small amount of gas money.

#### Mumbai Testnet
* A free copy of the Polygon blockchain, using fake money.
* Use test keys/wallets here.
* Don't push sensitive information to this blockchain.
* Use this faucet https://faucet.polygon.technology/ to send yourself test coins.
* This is a good place to deploy test code and integrate with contracts in a realistic environment.

#### Ganache (Localhost) 
* A localhost copy of the Ethereum blockchain, using fake money.
* Ganache gives you test keys/wallets.
* Free to deploy.
* Free to nuke and reset.
* Use the CLI version for headless integrations: https://www.npmjs.com/package/ganache-cli

#### Remix
* A web IDE with built-in test networks (JavaScript VM)
* Javascript VMs are instances of cloud blockchains. Inaccessible to others, but not secured.
* Change Remix to `Injected Web3` to force the IDE to use the network MetaMask is pointed to.
