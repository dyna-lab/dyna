// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.2;

enum YieldMode {
    AUTOMATIC,
    VOID,
    CLAIMABLE
}


interface IWETHUSDBRebasing {
    function configure(YieldMode) external returns (uint256);
}

interface IBlast{
    // // configure
    // function configureContract(address contractAddress, YieldMode _yield, GasMode gasMode, address governor) external;
    // function configure(YieldMode _yield, GasMode gasMode, address governor) external;

    // // base configuration options
    // function configureClaimableYield() external;
    // function configureClaimableYieldOnBehalf(address contractAddress) external;
    // function configureAutomaticYield() external;
    // function configureAutomaticYieldOnBehalf(address contractAddress) external;
    // function configureVoidYield() external;
    // function configureVoidYieldOnBehalf(address contractAddress) external;
    function configureClaimableGas() external;
    // function configureClaimableGasOnBehalf(address contractAddress) external;
    // function configureVoidGas() external;
    // function configureVoidGasOnBehalf(address contractAddress) external;
    function configureGovernor(address _governor) external;
    // function configureGovernorOnBehalf(address _newGovernor, address contractAddress) external;

}

// BlastYieldContract  : 0x4300000000000000000000000000000000000002
// Blast WETH rebasing : 0x4300000000000000000000000000000000000002
// Blast USDB rebasing : 0x4200000000000000000000000000000000000023
abstract contract BlastBase {
    
    constructor() {
            //configure claimable yield for USDB
            IWETHUSDBRebasing(0x4200000000000000000000000000000000000022).configure(YieldMode.CLAIMABLE);

            //configure claimable yield for WETH
            IWETHUSDBRebasing(0x4200000000000000000000000000000000000023).configure(YieldMode.CLAIMABLE);

            IBlast(0x4300000000000000000000000000000000000002).configureClaimableGas();
		    IBlast(0x4300000000000000000000000000000000000002).configureGovernor(msg.sender);
    }

}