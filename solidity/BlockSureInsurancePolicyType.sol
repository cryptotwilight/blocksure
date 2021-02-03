// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;
/**
 * @author Taurai Ushewokunze 
 */

contract BlockSureInsurancePolicyType { 
    
 
        string policyTypeName; 
        uint256 maxInsuredValue; 
        uint256 premium;
        uint256 maxExitBonus; 
        uint256 policyDuration; 
    
    
        constructor(string memory _policyTypeName, uint256 _maxInsuredValue,  uint256 _premium, uint256 _maxExitBonus, uint256 _policyDuration ) {
            policyTypeName = _policyTypeName;
            maxInsuredValue = _maxInsuredValue;
            premium = _premium; 
            maxExitBonus = _maxExitBonus;
            policyDuration = _policyDuration;
        }
    
        
        function getPolicyTypeName() external view returns (string memory _policyTypeName) {
            return policyTypeName;
        }
    
    
        function getMaxInsuredValue() external view  returns (uint256 _maxInsuredValue) {
            return maxInsuredValue;
        }
        
        function getPremium() external view returns (uint256 _oneTimePremium) {
            return premium;
        }
        
        function getMaxExitBonus() external view returns (uint256 _maxExitBonus) {
            return maxExitBonus; 
            
        }
        
        function getPolicyDuration() external view returns (uint256 _policyDuration) {
            return policyDuration;
        }
    

}