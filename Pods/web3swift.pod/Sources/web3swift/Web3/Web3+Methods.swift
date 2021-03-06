//
//  Web3+Methods.swift
//  web3swift
//
//  Created by Alexander Vlasov on 21.12.2017.
//  Copyright © 2017 Bankex Foundation. All rights reserved.
//

import Foundation

/// Contains JsonRpc api methods and required number of parameters
public struct JsonRpcMethod: Encodable, Equatable {
	/// Method name
    public var api: String
	/// Required number of parameters
    public var parameters: Int
	
	/// init with api and parameters. Used for custom api methods
    public init(api: String, parameters: Int) {
        self.api = api
        self.parameters = parameters
    }
	
	/// ccm_gasPrice method
    public static let gasPrice = JsonRpcMethod(api: "ccm_gasPrice", parameters: 0)
	/// ccm_blockNumber method
    public static let blockNumber = JsonRpcMethod(api: "ccm_blockNumber", parameters: 0)
	/// net_version method
    public static let getNetwork = JsonRpcMethod(api: "net_version", parameters: 0)
	/// ccm_sendRawTransaction method
    public static let sendRawTransaction = JsonRpcMethod(api: "ccm_sendRawTransaction", parameters: 1)
    public static let sendethRawTransaction = JsonRpcMethod(api: "eth_sendRawTransaction", parameters: 1)
	/// ccm_sendTransaction method
    public static let sendTransaction = JsonRpcMethod(api: "ccm_sendTransaction", parameters: 1)
	/// ccm_estimateGas method
    public static let estimateGas = JsonRpcMethod(api: "ccm_estimateGas", parameters: 1)
	/// ccm_call method
    public static let call = JsonRpcMethod(api: "ccm_call", parameters: 2)
	/// ccm_getTransactionCount method
    public static let getTransactionCount = JsonRpcMethod(api: "ccm_getTransactionCount", parameters: 2)
    public static let getethTransactionCount = JsonRpcMethod(api: "eth_getTransactionCount", parameters: 2)
	/// ccm_getBalance method
    public static let getBalance = JsonRpcMethod(api: "eth_getBalance", parameters: 2)
    public static let getccmBalance = JsonRpcMethod(api: "ccm_getBalance", parameters: 2)
	/// ccm_getCode method
    public static let getCode = JsonRpcMethod(api: "ccm_getCode", parameters: 2)
	/// ccm_getStorageAt method
    public static let getStorageAt = JsonRpcMethod(api: "ccm_getStorageAt", parameters: 2)
	/// ccm_getTransactionByHash method
    public static let getTransactionByHash = JsonRpcMethod(api: "ccm_getTransactionByHash", parameters: 1)
	/// ccm_getTransactionReceipt method
    public static let getTransactionReceipt = JsonRpcMethod(api: "ccm_getTransactionReceipt", parameters: 1)
	/// ccm_accounts method
    public static let getAccounts = JsonRpcMethod(api: "ccm_accounts", parameters: 0)
	/// ccm_getBlockByHash method
    public static let getBlockByHash = JsonRpcMethod(api: "ccm_getBlockByHash", parameters: 2)
	/// ccm_getBlockByNumber method
    public static let getBlockByNumber = JsonRpcMethod(api: "ccm_getBlockByNumber", parameters: 2)
	/// ccm_sign method
    public static let personalSign = JsonRpcMethod(api: "ccm_sign", parameters: 1)
	/// personal_unlockAccount method
    public static let unlockAccount = JsonRpcMethod(api: "personal_unlockAccount", parameters: 1)
	/// ccm_getLogs method
    public static let getLogs = JsonRpcMethod(api: "ccm_getLogs", parameters: 1)
	/// txpool_status method
    public static let txPoolStatus = JsonRpcMethod(api: "txpool_status", parameters: 0)
	/// txpool_inspect method
    public static let txPoolInspect = JsonRpcMethod(api: "txpool_inspect", parameters: 0)
	/// txpool_content method
    public static let txPoolContent = JsonRpcMethod(api: "txpool_content", parameters: 0)
}
