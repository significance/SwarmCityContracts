const HashtagSimpleDeal = artifacts.require("HashtagSimpleDeal");
const ERC677BridgeToken = artifacts.require("ERC677BridgeToken");
const HashtagList = artifacts.require("HashtagList");

const tokenName = "Swarm City Token Bridged";
const tokenSymbol = "SWTTEST";
const decimals = 18;

const hashtagName = "TestSimpleDeal";
const hashtagFee = 1000000000;
const hashtagMetadataHash = "0xab12351253515235";

module.exports = function(deployer) {
  deployer.then(async () => {
    await deployer.deploy(ERC677BridgeToken, tokenName, tokenSymbol, decimals);
    await deployer.deploy(
      HashtagSimpleDeal,
      ERC677BridgeToken.address,
      hashtagName,
      hashtagFee,
      hashtagMetadataHash
    );
    await deployer.deploy(HashtagList);
  });
};
