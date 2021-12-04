# Advanced Deploys From Remix

---
## Deploy to Ganache
1. Configure and start Ganache (see [EnvironmentSetup.md](EnvironmentSetup.md))
	* Configure MetaMask to use Ganache (Localhost).
	* Import your Ganache private keys or mnemonic phrase into MetaMask.
	* Confirm that MetaMask correctly shows the public wallet address that Ganache has generated, and the balance in both windows matches.
2. In Remix, open the DEPLOY & RUN TRANSACTIONS tab.
3. Change the ENVIRONMENT in Remix to `Injected Web3`. MetaMask should prompt you to connect to the webpage. 
4. Confirm that the ACCOUNT in Remix matches the public address selected in MetaMask (and Ganache).
	![Screen-Shot-2021-12-03-at-3 05 20-PM](https://user-images.githubusercontent.com/89272620/144684269-520138be-1c75-4a4c-be96-a68bba1791b2.png)
5. Choose a CONTRACT to deploy and click the yellow Deploy button.
6. MetaMask will prompt you to sign the transaction, paying the gas costs to deploy the new smart contract onto Ganache.
7. Check the TRANSACTIONS tab in Ganache; notice the most recent transaction shows a CREATED CONTRACT ADDRESS, this matches the deployed contract address listed in Remix. 
8. Expand the interface in Remix and call functions on the contract. Notice that blue "call" endpoints are read-only and do not cost gas, but yellow "send" endpoints write data onto the chain and require a MetaMask transaction to pay for the gas costs.
9. Note that other services running on your local machine, such as web3.js in a Node project, can target Ganache and import the smart contract you've deployed by using the ABI (copyable from Remix's SOLIDITY COMPILER tab) and the deployed contract address.
