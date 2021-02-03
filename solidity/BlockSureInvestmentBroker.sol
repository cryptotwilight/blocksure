// SPDX-License-Identifier: UNLICENSED
pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;

import "https://github.com/aave/protocol-v2/tree/master/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/aave/protocol-v2/tree/master/contracts/interfaces/ILendingPool.sol";
/**
 * @author Taurai Ushewokunze 
 */

contract BlockSureInvestmentBroker { 
    
    address administrator; 
    address aaveLendingPoolPRoviderAddress; 
    ILendingPoolAddressesProvider lendingPoolAddressesProvider; 
    ILendingPool lendingPool; 
    address ETH_ADDRESS = 0x030bA81f1c18d280636F32af80b9AAd02Cf0854e; 
    uint256 NO_REFERRAL = 0; 
    mapping(address=>uint256) insurancePremiumByPolicyAddress; 
    
    mapping(address=>uint256) insurancePolicyPremiumByAddress; 
    
    
    
   constructor (address _administrator, address _aaveLendingPoolProviderAddress) {
        administrator = _administrator;
        aaveLendingPoolPRoviderAddress = _aaveLendingPoolProviderAddress; 
        lendingPoolAddressesProvider = ILendingPoolAddressesProvider(_aaveLendingPoolProviderAddress);
        lendingPool = ILendingPool(lendingPoolAddressesProvider.getLendingPool());
    }
    
    
    function depositPremium(address _insurancePolicyAddress, uint256 _premiumAmount) external payable returns (uint256 _depositReference) {
        lendingPool.deposit(ETH_ADDRESS, _premiumAmount, _insurancePolicyAddress, NO_REFERRAL);
        uint256 ref = block.timestamp; 
        return ref; 
    }
    
    
    function withdrawPremiumPlusEarnings(address _insurancePolicyAddress) external returns (uint256 _premium, uint256 _earnings) {
       uint256 total =  lendingPool.withdraw(ETH_ADDRESS, type(uint256).max, _insurancePolicyAddress);
       uint256 premium = insurancePremiumByPolicyAddress[_insurancePolicyAddress];
       uint256 earnings = total - premium; 
       return (premium, earnings);
    }
    
    
}