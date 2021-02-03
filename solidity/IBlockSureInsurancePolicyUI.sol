// SPDX-License-Identifier: UNLICENSED

pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;
/**
 * @author Taurai Ushewokunze 
 */

interface BlockSureInsurancePolicyUI {

    
    function cancelPolicy() external returns (uint256 _cancellationReference);
    
    function exitPolicy() external returns (uint256 _exitReference, uint256 _exitBonus);
    
    
    function getPolicyStatus() external view returns(string memory _status);

    function getPolicyEndDate() external view returns (uint256 _endDate);
    
    function getPolicyStartDate() external view returns (uint256 _startDate);
    
    function getPolicyAddress() external view returns (address _policyAddress);
    
    function getPolicyOwnerAddress() external view returns (address _ownerAddress);
    

    function getMaxInsuredValue(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount);
 
    function getPaidPremium(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount);
    
    function getMaxExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount);

    function getEstimatedExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount);
 
    function getEarnedExitBonus(string memory _displayCurrency) external view returns (uint256 _amount, uint256 _displayCurrencyAmount);
    
    
}