
// SPDX-License-Identifier: UNLICENSED
pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;

import "./BlockSureInsurancePolicyType.sol";
/**
 * @author Taurai Ushewokunze 
 */
contract BlockSurePolicyTypeManager { 
    
    
    address administrator; 
    
    address []  availablePolicyTypes;
    mapping(string=>address) policyTypeAddressByPolicyTypeName; 
    
    constructor(address _administrator) {
        administrator = _administrator; 
    }
    
    
    function getAvailablePolicyTypes() external view returns (address [] memory _availablePolicyTypes) {
        return availablePolicyTypes; 
    }
    
    
    function createNewPolicyType(string memory _policyTypeName, uint256 _maxInsuredValue,  uint256 _premium, uint256 _maxExitBonus, uint256 _policyDuration ) external returns (address _policyTypeAddress) {
        BlockSureInsurancePolicyType bsipt = new BlockSureInsurancePolicyType( _policyTypeName, _maxInsuredValue, _premium, _maxExitBonus, _policyDuration );
        address bsiptAddress = address(bsipt);
        availablePolicyTypes.push(bsiptAddress);
        policyTypeAddressByPolicyTypeName[_policyTypeName] = bsiptAddress; 
        return bsiptAddress; 
    }
    
    function retirePolicyType(string memory name) external returns (address _policyTypeAddress, string memory _retirementStatus, uint256 _retirementStartDate) {
        
        
    }
}