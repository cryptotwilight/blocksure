// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;
/**
 * @author Taurai Ushewokunze 
 */

interface IBlockSureGateway { 
    
    
    function getAvailableInsurnacePolicyTypes() external returns (address [] memory insurancePolicyTypes);
    
    
    function createNewInsurancePolicy(string memory policyType, uint256 premium, address owner ) external payable returns (address _insurancePolicyUIAddress);
    
 
    function findInsurancePolicyByOwnerAddress( address _ownerAddress ) external returns (address [] memory _insurancePolicyUIAddress);
    

}

