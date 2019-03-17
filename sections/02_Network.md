# Neo Network

_This section is part of the Community Yellow Paper ^[See [Community Yellow Paper](https://github.com/neoresearch/yellowpaper) repository] initiative, a community-driven technical specification for Neo blockchain._

**WARNING:** this section is an **unreleased draft**.
It is expected to be incomplete or even to carry incorrect information, so feel free to contribute with us!

## Blockchain Networks: nodes and wallets

A Blockchain can be seen and defined differently, depending on the interests around it.
For example, technically speaking, a blockchain can be seen as a data structure capable of handling immutability of records and transparency, however it can also be seen as a **protocol** that allows operations between untrusted agents.
As a network protocol, it is necessary to clearly define how these agents may interact and exchange information.

Blockchain networks are usually composed by full nodes and lightweight nodes.
Full nodes persist and validate the whole blockchain, being able to provide all kinds of informations to other nodes, such as lightweight nodes.
Lightweight nodes are usually linked to user wallets, that only have limited blockchain information and depend on full nodes to have access to detailed blockchain information (in order to validate transactions, for example).

A special type of node is capable of **generating** new blocks on the blockchain, which is the bookkeeper node^[On Bitcoin network, these nodes are called Miners (due to proof-of-work paradigm), however on Neo no mining process is required to achieve consensus].
On Neo network, these bookkeeper nodes are also called Consensus Nodes, which are ellected by means of public voting and are capable of systematically proposing new blocks (by ordering and validating pending network transactions).
Detailed information for Neo Consensus Protocol (called Delegated Byzantine Fault Tolerance) is presented on [Section @Sec:dBFT].

## Communication between nodes

Nodes communicate on Neo blockchain via two network protocols: peer-to-peer (P2P) and remote procedure call (RPC).

### P2P Protocol Specification

P2P commands can be found on [Neo Project](https://https://github.com/neo-project/neo) repository^[Developers can look directly on _neo/Network/P2P_ folder, while this section is a work on progress].

### RPC Protocol Specification

RPC commands can be found on [Neo Project](https://https://github.com/neo-project/neo) repository and also [Neo Plugins](https://https://github.com/neo-project/neo-plugins).

A summary of RPC commands on Neo network:

* `getaccountstate`
* `getassetstate`
* `getbestblockhash`
* `getblock`
* `getblockcount`
* `getblockhash`
* `getblockheader`
* `getblocksysfee`
* `getconnectioncount`
* `getcontractstate`
* `getpeers`
* `getrawmempool`
* `getrawtransaction`
* `getstorage`
* `gettransactionheight`
* `gettxout`
* `getvalidators`
* `getversion`
* `invoke`
* `invokefunction`
* `invokescript`
* `sendrawtransaction`
* `submitblock`
* `validateaddress`

These extra RPC commands can be found on [Neo Plugins](https://github.com/neo-project/neo-plugins).

RpcWallet plugin (`RpcWallet/RpcWallet.cs`):

* `claimgas`
* `dumpprivkey`
* `getbalance`
* `getnewaddress`
* `getunclaimedgas`
* `getwalletheight`
* `importprivkey`
* `listaddress`
* `sendfrom`
* `sendmany`
* `sendtoaddress`

RpcNep5Tracker plugin (`RpcNep5Tracker/RpcNep5Tracker.cs`):

* `getnep5balances`

If you feel some information is still missing here, please refer to the [Official Neo API Documentation](https://docs.neo.org/en-us/node/cli/latest-version/api.html).

## Assets and Smart Contracts
