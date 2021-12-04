# Build, Deploy, and Test Simple Smart Contracts

---
## Create the smart contract code file
1. Go to https://remix.ethereum.org/ in a web browser.
2. Create new smart contracts and solidity libraries in the `/contracts` directory.
3. Here are some simple contracts to start with:
	* [TestCoin.sol - ERC20](TestCoin.sol)
	* [TestNFT.sol - ERC721](TestNFT.sol)

### Compile a smart contract
1. Remix automatically saves and compiles code. 
2. To manually compile, open the SOLIDITY COMPILER tab.
3. Make sure the correct contract is selected (this resets itself often) and click the blue Compile button.
4. After the contract is compiled, you can use the ABI button at the bottom to copy the contract interface for use in web3.js or other tools.

https://user-images.githubusercontent.com/89272620/144673605-71a3b033-0ee8-4be4-a21f-b1546520a89c.mp4

---
### Deploy to Cloud VM
1. Open the DEPLOY & RUN TRANSACTIONS tab.
2. Using JavaScript VM (Berlin) or (London) is a free, non-persistent, testing environment. These VMs are good for verifying smart contract functionality by hand.
3. Notice the ACCOUNT menu, this shows a wallet which is pre-generated for you. This wallet will be the "contract owner" when a smart contract is deployed.
4. Make sure the correct contract is selected (this resets itself often) and click the yellow Deploy button.

https://user-images.githubusercontent.com/89272620/144673618-9152ac06-7910-42a2-958b-9f48abb43632.mp4

Explanation of the video above: 
1. Choose the wallet (pre-generated) to deploy the contract from: `0x5B3...`
2. Copy the wallet address
3. Choose the smart contract to deploy to the blockchain (VM): TestNFT from the `TestNFT.sol` file.
4. Deploy the contract onto the blockchain.
5. Notice the contract is deployed at address `0x540...`
6. Send a transaction to the `createNFT` function, passing the wallet address above as a parameter.
7. Call the `balanceOf` function, passing the wallet address as a parameter. 
	* Result is `1`, meaning the wallet owns one NFT.
9. Call the `tokenByIndex` function, passing index the zeroth index.
	* Result is `1`, meaning the zeroth NFT has a tokenID of `1`.
	* NOTE: This call should have been `tokenOfOwnerByIndex`. The `tokenByIndex` is all NFTs globally, whereas we intended to fetch the tokenID of the first NFT owned by a specific wallet. In this case only one NFT exists, so the results coincidentally lined up.
12. Call the `tokenURI` function, passing the tokenID of `1` as a parameter.
	* Result is a URI string for the metadata of token `1`. (This URI is hard coded into the `createNFT` method for demonstration.)
14. Send a transaction to the `setTokenURI` function, passing tokenID `1` and uri `https://foo.bar` as parameters.
16. Repeat the call to `tokenURI`, passing the tokenID of `1` as a parameter. 
	* Result is the updated URI string for token `1`.
