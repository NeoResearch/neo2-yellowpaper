# Neo Network

_This section is part of the Community Yellow Paper ^[See [Community Yellow Paper repository](https://github.com/neoresearch/yellowpaper)] initiative, a community-driven technical specification for Neo blockchain._

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
