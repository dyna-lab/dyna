// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../VaultMSData.sol";

interface IVaultUtils {
    function getTaxSetting( ) external view returns (   uint256 taxDuration, uint256 taxMax,uint256 nonProfitTime );



    // function validateTokens(uint256 _baseMode, address _collateralToken, address _indexToken, bool _isLong) external view returns (bool);
    function isLiquidator(address _account) external view returns (bool);
    function setLiquidator(address _liquidator, bool _isActive) external;

    // function validateIncreasePosition(address _collateralToken, address _indexToken, uint256 _size, uint256 _sizeDelta, bool _isLong) external view;
    function validateDecreasePosition(VaultMSData.Position memory _position, uint256 _sizeDelta, uint256 _collateralDelta) external view;

    // function getDelta(address _indexToken, uint256 _size, uint256 _averagePrice, bool _isLong, uint256 _lastIncreasedTime, uint256 _colSize) external view returns (bool, uint256);
    function getDelta(VaultMSData.Position memory _position, uint256 _price) external view returns (bool, uint256, uint256);
    // function updateRate(address _token) external view returns (VaultMSData.TradingFee memory);
    // function getPremiumFee(VaultMSData.Position memory _position, VaultMSData.TradingFee memory _tradingFee) external view returns (int256);
    // function getPremiumFee(address _indexToken, bool _isLong, uint256 _size, int256 _entryPremiumRate) external view returns (int256);
    function getLiqPrice(bytes32 _posKey) external view returns (int256);
    function getPositionFee(address _indexToken, uint256 _sizeDelta) external view returns (uint256);
    function getBuyLpFeeBasisPoints(address _token, uint256 _usdxAmount) external view returns (uint256);
    function getSellLpFeeBasisPoints(address _token, uint256 _usdxAmount) external view returns (uint256);
    function getSwapFeeBasisPoints(address _tokenIn, address _tokenOut, uint256 _usdxAmount) external view returns (uint256);
    function getFeeBasisPoints(address _token, uint256 _usdxDelta, uint256 _feeBasisPoints, uint256 _taxBasisPoints, bool _increment) external view returns (uint256);
    function getPositionKey(address _account,address _collateralToken, address _indexToken, bool _isLong, uint256 _keyID) external view returns (bytes32);

    // function getLatestFundingRatePerSec(address _token) external view returns (uint256);
    // function getLatestLSRate(address _token) external view returns (int256, int256);


    function fundingRateSec(uint256 _resvAmount, uint256 _poolAmount) external view returns (uint64);

    // function validateLiquidationPos(VaultMSData.Position memory position, bool _raise) external view;

    // function addPosition(bytes32 _key,address _account, address _collateralToken, address _indexToken, bool _isLong) external;
    // function removePosition(bytes32 _key) external;
    // function getDiscountedFee(address _account, uint256 _origFee, address _token) external view returns (uint256);
    // function getSwapDiscountedFee(address _user, uint256 _origFee, address _token) external view returns (uint256);
    // function uploadFeeRecord(address _user, uint256 _feeOrig, uint256 _feeDiscounted, address _token) external;

    function MAX_FEE_BASIS_POINTS() external view returns (uint256);
    function MAX_LIQUIDATION_FEE_USD() external view returns (uint256);

    function liquidationFeeUsd() external view returns (uint256);
    function taxBasisPoints() external view returns (uint256);
    function stableTaxBasisPoints() external view returns (uint256);
    function mintBurnFeeBasisPoints() external view returns (uint256);
    function swapFeeBasisPoints() external view returns (uint256);
    function stableSwapFeeBasisPoints() external view returns (uint256);
    function marginFeeBasisPoints() external view returns (uint256);

    // function hasDynamicFees() external view returns (bool);
    function maxLeverage() external view returns (uint256);
    function maxReserveRatio() external view returns (uint256);
    function setMaxLeverage(uint256 _maxLeverage) external;

    function errors(uint256) external view returns (string memory);

    // function spreadBasis(address) external view returns (uint256);
    // function maxSpreadBasis(address) external view returns (uint256);
    // function minSpreadCalUSD(address) external view returns (uint256);
    // function maxPremiumBasisErrorUSD() external view returns (uint256);


    // function getNextAveragePrice(bytes32 _key, address _indexToken, uint256 _size, uint256 _averagePrice,
        // bool _isLong, uint256 _nextPrice, uint256 _sizeDelta, uint256 _lastIncreasedTime ) external view returns (uint256);
    // function getNextAveragePrice(bytes32 _key, bool _isLong, uint256 _price,uint256 _sizeDelta) external view returns (uint256);           
    function getNextIncreaseTime(uint256 _prev, uint256 _prev_size,uint256 _sizeDelta) external view returns (uint256);          
    // function getPositionDelta(address _account, address _collateralToken, address _indexToken, bool _isLong) external view returns (bool, uint256);
    function calculateTax(uint256 _profit, uint256 _aveIncreaseTime) external view returns(uint256);    
    function getPositionNextAveragePrice(uint256 _size, uint256 _averagePrice, uint256 _nextPrice, uint256 _sizeDelta, bool _isIncrease) external pure returns (uint256);

    function getNextAveragePrice(uint256 _size, uint256 _averagePrice,  uint256 _nextPrice, uint256 _sizeDelta, bool _isIncrease) external pure returns (uint256);
    // function getDecreaseNextAveragePrice(uint256 _size, uint256 _averagePrice,  uint256 _nextPrice, uint256 _sizeDelta ) external pure returns (uint256);
    // function getPositionNextAveragePrice(address _indexToken, uint256 _size, uint256 _averagePrice, bool _isLong, uint256 _nextPrice, uint256 _sizeDelta, uint256 _lastIncreasedTime) external pure returns (uint256);
    function setFees(
        uint256 _taxBasisPoints,
        uint256 _stableTaxBasisPoints,
        uint256 _mintBurnFeeBasisPoints,
        uint256 _swapFeeBasisPoints,
        uint256 _stableSwapFeeBasisPoints,
        uint256 _marginFeeBasisPoints,
        uint256 _liquidationFeeUsd,
        bool _hasDynamicFees
    ) external;
    
    function tokenUtilization(address _token) external view returns (uint256);
    function setInPrivateLiquidationMode(bool _inPrivateLiquidationMode) external;
    function inPrivateLiquidationMode() external view returns (bool);
    function validLiq(address _account) external view;

    // function fundingRateFactor() external view returns (uint256);
    // function stableFundingRateFactor() external view returns (uint256);
    function maxProfitRatio() external view returns (uint256);

    function getSpread( address _token) external view returns ( 
            uint256 spreadBasisMax,
            uint256 sizeSpreadGapStart,
            uint256 sizeSpreadGapMax);
}