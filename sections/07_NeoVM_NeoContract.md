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

### Opcodes

#### Value pushing / constants

Word          | Opcode | Hex | Input     | Output  | Parameter | Description
-------------:| ------ | --- | --------- | ------- | --------- | -----------
PUSH0/PUSHF   | 0      | 00  | none      | {0x''}  | none      | An empty array of bytes is pushed onto the stack
PUSHBYTES{1..75} | 1..75 | 01..4B | none | data | data (1..75 bytes) | The next opcode bytes is data to be pushed onto the stack
PUSHDATA1 | 76 | 4C | none | data | 1 byte + data  | The next byte contains the number of bytes to be pushed onto the stack
PUSHDATA2 | 77 | 4D | none | data | 2 bytes + data  | The next two bytes contain the number of bytes to be pushed onto the stack
PUSHDATA4 | 78 | 4E | none | data | 4 bytes + data  | The next four bytes contain the number of bytes to be pushed onto the stack
PUSHM1 | 79 | 4F | none | BigInt(-1) or {0xff}  | none  | The number -1 is pushed onto the stack.
PUSH1 / PUSHT | 81 | 51 | none | BigInt(1) or {0x01}  | none  | The number 1 is pushed onto the stack.
PUSH{K=2..16} | 82..96 | 52..60 | none | BigInt(K) or hex(K)  | none  | The number K is pushed onto the stack.

## NeoContract
