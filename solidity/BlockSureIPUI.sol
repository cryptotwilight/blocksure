// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;

import "./BlockSureInsurancePolicy.sol";
import "./BlockSurePriceBroker.sol";
import "./IBlockSureInsurancePolicyUI.sol";
/**
 * @author Taurai Ushewokunze 
 */

contract BlockSureIPUI is IBlockSureInsurancePolicyUI { 
    
    address policyAddress; 
    address policyOwnerAddress; 
    
    BlockSureInsurancePolicy policy; 
    BlockSurePriceBorker priceBroker; 
    
    constructor(address _policyAddress, address _blocksurePriceBroker) {
        policyAddress = _policyAddress; 
        policy = BlockSureInsurancePolicy(policyAddress);
        policyOwner = policy.getPolicyOwnerAddress(); 
        priceBroker = BlockSurePriceBorker(_blocksurePriceBroker);
    }
    
 
    function cancelPolicy() external returns (uint256 _cancellationReference, uint256 _cancellationRefund) {
        require(msg.sender == policyOwnerAddress, 'bsipui - 00, No Cancellation Permission');
        return policy.triggerCancellation();
    }
    
    function exitPolicy() external returns (uint256 _exitReference, uint256 _exitBonus) {
        require(msg.sender == policyOwnerAddress, 'bsipui - 01, No Cancellation Permission');
        return policy.triggerExit(); 
    }
    
    
    function getPolicyStatus() external view returns(string memory _status){
        return  policy.getPolicyStatus();
    }

    function getPolicyEndDate() external view returns (uint256 _endDate){
        return policy.getPolicyEndDate();
    }
    
    function getPolicyStartDate() external view returns (uint256 _startDate){
        return policy.getPolicyStartDate();
    }
    
    function getPolicyAddress() external view returns (address _policyAddress){
        return policyAddress;
    }
    
    function getPolicyOwnerAddress() external view returns (address _ownerAddress){
        return policyOwnerAddress;
    }
    

    function getMaxInsuredValue(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount){
        uint256 displayFactor = priceBroker.getPrice(_displayCurrency);
        uint256 miv = policy.getMaxInsuredValue(); 
        uint256 displayCurrencyAmount = miv * displayFactor;
        return (miv, displayCurrencyAmount);
    }
 
    function getPaidPremium(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount){
        uint256 displayFactor = priceBroker.getPrice(_displayCurrency);
        uint256 premium = policy.getPaidPremium();
        uint256 displayCurrencyAmount = premium * displayFactor; 
        return (premium, displayCurrencyAmount);
        
    }
    
    function getMaxExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount) {
        uint256 displayFactor = priceBroker.getPrice(_displayCurrency);
        uint256 meb = policy.getMaxExitBonus(); 
        uint256 displayCurrencyAmount = meb * displayFactor; 
        return (meb, displayCurrencyAmount);
        
    }

    function getEstimatedExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount){
        uint256 displayFactor = priceBroker.getPrice(_displayCurrency);
        uint256 eeb = policy.getEstimatedExitBonus(); 
        uint256 displayCurrencyAmount = eeb * displayCurrency; 
        return (eeb, displayCurrencyAmount);
        
    }
 
    function getEarnedExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount){
        uint256 displayFactor = priceBroker.getPrice(_displayCurrency);
        uint256 eeb = policy.getEarnedExitBonus(); 
        uint256 displayCurrencyAmount = eeb * displayCurrency;
        return (eeb, displayCurrencyAmount);
    }
}
    