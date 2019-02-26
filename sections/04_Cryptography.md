# Cryptography basics: Digital Signatures and Hash Functions

Neo mainly uses SHA-256 and RIPEMD-160 functions for hashing.
Digital Signatures are performed via elliptic curves (ECDSA), standard P-256 (secp256r1), which is quite similar to Bitcoin (secp256k1).

## Current cryptography and NeoQS

NeoQS envisioned a cryptographic system based on Lattice problems.
In particular, in the White Paper, a mechanism based on Shortest Vector Problem (SVP) and Closest Vector Problem (CVP)
were considered.

State-of-the-art studies and reports points out that this family of problems can really generate Hard problems
is worst case situation.
On the other hand, slightly different mechanisms are being proposed, such as Learning with Errors (LWE) and its variant
of Ring Learning with Errors (R-LWE).

In this chapter, we describe the basic background of such problems and its perspectives of resolutions based on
the assumption that $P != NP$.
