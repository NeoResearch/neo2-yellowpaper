# Cryptography basics: Digital Signatures and Hash Functions

Neo mainly uses SHA-256 and RIPEMD-160 functions for hashing.
Digital Signatures are performed via elliptic curves (ECDSA), standard P-256 (secp256r1), which is quite similar to Bitcoin (secp256k1).

## Current cryptography and NeoQS

NeoQS envisioned a cryptographic system based on Lattice problems.
In particular, in the White Paper, a mechanism based on Shortest Vector Problem (SVP) and Closest Vector Problem (CVP)
were considered.

State-of-the-art studies and reports indicate these classes of problems @regev2009lattices, with specific pre-defined conditions,
are able generate NP-Hard instances of these problems even in the worst case.
However, some other properties were not accomplished, such as revealing parts of the secret after signing.
Thus, for accomplishing the requirements of a complete cryptographic system, the mechanism should be able to sign $N$ messages
without disclosing information about its secret.
Currently, some slightly different variants are being proposed such as Learning with Errors (LWE) and its compact version known as Ring Learning with Errors (R-LWE).

In this chapter, we describe the basic background of such problems and its perspectives of resolutions based on
the assumption that $P != NP$.
