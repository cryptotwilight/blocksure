// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;

import "./IBlockSureGateway.sol";
import "./BlockSureInsurancePolicy.sol";
import "./BlockSureInsurancePolicyType.sol";
import "./BlockSurePolicyTypeManager.sol";
/**
 * @author Taurai Ushewokunze 
 */
contract BlockSureGatewayService is IBlockSureGateway { 
    
    
    address administrator; 
    address policyAdministrator; 
    address [] policyTypeAddresses; 
    
    BlockSurePolicyTypeManager policyTypeManager; 
    
    mapping(string=>address) insurancePolicyTypeAddressesByTypeName; 
    
    mapping(address=>address[]) insurancePolicyAddressByOwnerAddress;
    
    constructor(address _administrator, address _policyAdministrator, address _policyTypeManagerAddress) { 
        administrator = _administrator; 
        policyAdministrator = _policyAdministrator; 
        policyTypeManager = PolicyTypeManager(_policyTypeManagerAddress);
    }
    

    
    function createNewInsurancePolicy( string memory _policyType, uint256 _premium, address _owner ) external payable override returns (address _insurancePolicyUIAddress) {
        require(msg.value == _premium);
        require(msg.sender == _owner);
        address policyTypeAddress = insurancePolicyTypeAddressesByTypeName[_policyType]; 
        BlockSureInsurancePolicyType bsiptype = BlockSureInsurancePolicyType(policyTypeAddress);
        require(bsiptype.getPremium() == _premium, 'bsgs - 00, Premium requirement mismatch.');
        
        BlockSureInsurancePolicy policy = new BlockSureInsurancePolicy(_owner, policyAdministrator, policyTypeAddress);
        
        
        address uiAddress = policy.getPolicyUIAddress(); 
        
        
        return uiAddress; 
    }
 
 
    function findInsurancePolicyByOwnerAddress( address _ownerAddress ) external override view returns (address [] memory _insurancePolicyUIAddress) {
        return insurancePolicyAddressByOwnerAddress[_ownerAddress];
    }
    

    function getAvailableInsurnacePolicyTypes() override external view returns (address [] memory insurancePolicyTypes) { 
        return policyTypeAddresses;  
    }
    
    
}