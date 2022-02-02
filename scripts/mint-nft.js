require('dotenv').config();
const STAGING_ALCHEMY_KEY = process.env.STAGING_ALCHEMY_KEY;
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(STAGING_ALCHEMY_KEY);

const contract = require("../artifacts/contracts/farhan_erc20.sol/farhan_erc20.json");
const contractAddress = "0xA7085DEa56107e5a5A28cE223B3f97c39D22665B";
const nftContract = new web3.eth.Contract(contract.abi, contractAddress);

async function mint() {
  const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY, 'latest'); //get latest nonce

//the transaction
  const tx = {
    'from': PUBLIC_KEY,
    'to': contractAddress,
    'nonce': nonce,
    'gas': 500000,
    'data': nftContract.methods.mint(PUBLIC_KEY, 1000).encodeABI()
  };

  const signPromise = web3.eth.accounts.signTransaction(tx, PRIVATE_KEY)
  signPromise.then((signedTx) => {
      web3.eth.sendSignedTransaction(
        signedTx.rawTransaction,
        function (err, hash) {
          if (!err) {
            console.log(
              "The hash of your transaction is: ",
              hash,
              "\nCheck Alchemy's Mempool to view the status of your transaction!"
            )
          } else {
            console.log(
              "Something went wrong when submitting your transaction:",
              err
            )
          }
        }
      )
    })
    .catch((err) => {
      console.log(" Promise failed:", err)
    })
}

mint()