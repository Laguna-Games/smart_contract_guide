# Use Remix to Call Endpoints on Mainnet Contracts

In most cases, we don't know the full API of a live smart contract, unless the code has been publicly shared. We can infer some endpoints, provided the contract is following known standards such as ERC20 or ERC721.

---
## Connect to a live contract

For this example, let's get the tokenURI from the Bored Ape Yacht Club project, for [token #9287](https://opensea.io/assets/0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d/9287). 

1. Figure out the blockchain and address where the contract is deployed. OpenSea tells us that the blockchain is Ethereum, and the NFT address is `0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D`.
2. We don't know anything about the code that Bored Ape uses, but we can guess that they follow the ERC721 interface.
3. Open Remix and set up a simple ERC721 contract, using OpenZeppelin's default implementation: 
```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TestNFT is ERC721 {
    constructor() ERC721("", "") {}
}
```
5. In the DEPLOY & RUN TRANSACTIONS tab, change the ENVIRONMENT to `Injected Web3`
6. Make sure MetaMask is on the matching blockchain (in this case `Ethereum Mainnet`).
	* Making deployments or `send` transactions will cost real Ethereum in this case. We can still query `view` and `pure` methods for free.
7. Set the CONTRACT field to use the TestNFT contract we created. This will give us the method signatures we inherit from OpenZeppelin's ERC721.
8. Paste the Bored Ape NFT contract address into the `Load contract from Address` field and click the At Address button. 

![](https://user-images.githubusercontent.com/89272620/144689060-3e7af735-0bab-4459-bf8e-b5bfc496df4e.png)

9. Expand the "Deployed Contract" and attempt to call some functions.

![](https://user-images.githubusercontent.com/89272620/144689148-23e18bbb-c538-4f5e-93ea-626b3046880c.png)

10. Calling the `tokenURI` method for token 9287 gives us: ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/9287
11. If we load the metadata in a browser, we can see the NFT's properties: 
```
{
	"image": "ipfs://QmRWU17GwdQHUPi77k4PN8PPPX8caj48n9FTbJ76FqfnVM",
	"attributes": [{
		"trait_type": "Eyes",
		"value": "3d"
	}, {
		"trait_type": "Background",
		"value": "Aquamarine"
	}, {
		"trait_type": "Clothes",
		"value": "Tuxedo Tee"
	}, {
		"trait_type": "Mouth",
		"value": "Tongue Out"
	}, {
		"trait_type": "Fur",
		"value": "Tan"
	}]
}
```
12. And finally, we can verify that the image we've retrieved from the blockchain matches what OpenSea is displaying. 

![](https://user-images.githubusercontent.com/89272620/144689673-2f473a55-87f8-43ee-a7b3-f18f8f9fa2df.png)

