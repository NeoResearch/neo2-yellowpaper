# NeoVM and NeoContract

_This section is part of the Community Yellow Paper ^[See [Community Yellow Paper](https://github.com/neoresearch/yellowpaper) repository] initiative, a community-driven technical specification for Neo blockchain._

**WARNING:** this section is an **unreleased draft**.
It is expected to be incomplete or even to carry incorrect information, so feel free to contribute with us!

## Neo execution layers

Neo smart contract execution is performed in two different layers: NeoContract and NeoVM.

NeoVM is the lightweight low-level virtual machine that performs the most basic operations.
NeoContract is an interoperable layer that includes blockchain services, contract storage and more complex operations.

## NeoVM

NeoVM is a stack machine capable of processing items, called Stack Items.
These StackItems are limited to the following types:
- Array: an array of StackItems
- Boolean
- ByteArray
- Integer
- InteropInterface
- Map
- Struct

From Type          | Array | Boolean | ByteArray | Integer | Interop | Map | Struct
-------------:| ----- | ------- | --------- | ------- | ------- | --- | ------
Array         | * | True | Exception | | | |
Boolean       |  | * |  Boolean ? {0x01} : {} | Boolean ? BigInt(1) : BigInt(0) | | |
ByteArray     |  | (any byte != 0)? True : False | * | | | |
Integer       |  | (Integer == 0)? False : True | ToByteArray | * | | |
Interop       |  | (Interop == null)? False : True | Exception |  | * | |
Map           |  | True | Exception | |  | * |
Struct        |  | True | Exception | | | | *


## NeoContract
