// SPDX-License-Identifier: UNLICENSED
pragma solidity >0.4.0 <0.9.0;

pragma experimental ABIEncoderV2;

import "https://github.com/tellor-io/usingtellor/blob/master/contracts/UsingTellor.sol";

/**
 * @author Taurai Ushewokunze 
 */

contract BlockSurePriceBroker is UsingTellor {
    
    address administrator; 
    mapping(string=>uint256) tellorRequestIdByCurrencyPair; 
    
    
    constructor(address _administrator, address payable _tellorAddress) UsingTellor(_tellorAddress) {
        administrator = _administrator;
        initializeIds();
    }
    
    
    function getPrice(string memory _currency) external view returns (uint256 _price) { 
        uint256 _tellorRequestId = resolveRequestId(_currency);
        return retrieveData(_tellorRequestId, block.timestamp);
          
    }    
    
    function resolveRequestId(string memory _currency) internal view returns (uint256 _tellorRequestId) { 
        return tellorRequestIdByCurrencyPair[_currency];
        
    }
    
    function initializeIds() internal returns (bool _done) {
        uint256 counter = 1; 
        tellorRequestIdByCurrencyPair["ETH/USD"] = counter;
        tellorRequestIdByCurrencyPair["BTC/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BNB/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BTC/USD 24 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["ETH/BTC"] = counter++;
        tellorRequestIdByCurrencyPair["BNB/BTC"] = counter++;
        tellorRequestIdByCurrencyPair["BNB/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["ETH/USD 24 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["ETH/USD EOD Median"] = counter++;
        tellorRequestIdByCurrencyPair["AMPL/USD Custom"] = counter++;
        tellorRequestIdByCurrencyPair["ZEC/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["TRX/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["XRP/USD"] = counter++;
        tellorRequestIdByCurrencyPair["XMR/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["ATOM/USD"] = counter++;
        tellorRequestIdByCurrencyPair["LTC/USD"] = counter++;
        tellorRequestIdByCurrencyPair["WAVES/BTC"] = counter++;
        tellorRequestIdByCurrencyPair["REP/BTC"] = counter++;
        tellorRequestIdByCurrencyPair["TUSD/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["EOS/USD"] = counter++;
        tellorRequestIdByCurrencyPair["IOTA/USD"] = counter++;        
        tellorRequestIdByCurrencyPair["ETC/USD"] = counter++;
        tellorRequestIdByCurrencyPair["ETH/PAX"] = counter++;
        tellorRequestIdByCurrencyPair["ETH/BTC 24 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["USDC/USDT"] = counter++;
        tellorRequestIdByCurrencyPair["XTZ/USD"] = counter++;
        tellorRequestIdByCurrencyPair["LINK/USD"] = counter++;
        tellorRequestIdByCurrencyPair["ZRX/BNB"] = counter++;
        tellorRequestIdByCurrencyPair["ZEC/USD"] = counter++;
        tellorRequestIdByCurrencyPair["XAU/USD"] = counter++;
        tellorRequestIdByCurrencyPair["MATIC/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BAT/USD"] = counter++;
        tellorRequestIdByCurrencyPair["ALGO/USD"] = counter++;
        tellorRequestIdByCurrencyPair["ZRX/USD"] = counter++;
        tellorRequestIdByCurrencyPair["COS/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BCH/USD"] = counter++;
        tellorRequestIdByCurrencyPair["REP/USD"] = counter++;
        tellorRequestIdByCurrencyPair["GNO/USD"] = counter++;
        tellorRequestIdByCurrencyPair["DAI/USD"] = counter++;    
        tellorRequestIdByCurrencyPair["STEEM/BTC"] = counter++;
        tellorRequestIdByCurrencyPair["USPCE"] = counter++;
        tellorRequestIdByCurrencyPair["BTC/USD EOD Median"] = counter++;
        tellorRequestIdByCurrencyPair["TRB/ETH"] = counter++;
        tellorRequestIdByCurrencyPair["BTC/USD 1 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["TRB/USD EOD Median"] = counter++;     
        tellorRequestIdByCurrencyPair["ETH/USD 1 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["BSV/USD"] = counter++;
        tellorRequestIdByCurrencyPair["MAKER/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BCH/USD 24 Hour TWAP"] = counter++;
        tellorRequestIdByCurrencyPair["TRB/USD"] = counter++;
        tellorRequestIdByCurrencyPair["XMR/USD"] = counter++;
        tellorRequestIdByCurrencyPair["XFT/USD"] = counter++;
        tellorRequestIdByCurrencyPair["BTCDominance"] = counter++;
        return true; 
    }
}