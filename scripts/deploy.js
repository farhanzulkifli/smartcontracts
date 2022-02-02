async function main() {
    const farhanContract = await ethers.getContractFactory("farhan_erc721")
  
    // Start deployment, returning a promise that resolves to a contract object
    const farhanDeploy = await farhanContract.deploy()
    await farhanDeploy.deployed()
    console.log("Contract deployed to address:", farhanDeploy.address)
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  