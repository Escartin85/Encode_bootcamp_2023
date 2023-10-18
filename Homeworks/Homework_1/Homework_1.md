
**1. Why is client diversity important for Ethereum?**
The diversity makes the network more secure and resilient to attacks and bugs.

Security: Different client implementations are likely to have different codebases and architecture. This diversity acts as a safety net because vulnerabilities in one client may not affect others. It also reduces the risk of a single point of failure due to a bug or attack in a specific client.

Resilience: In the event of a client-specific bug or network upgrade, having multiple client implementations allows the network to continue functioning. If all nodes were running the same client and that client experienced a critical issue, it could lead to a network halt.

Also, the diversity increase collaboration and contributions to the Ethereum ecosystem by the community and developers.

**2. Where is the full Ethereum state held ?**
In the nodes of the network.

**3. What is a replay attack ? , which 2 pieces of information can prevent it ?**
A replay attack is a type of attack that occurs in the context of data communication, particularly in cryptographic protocols and network security. In a replay attack, an attacker intercepts and records data (such as messages or transactions) sent between two parties, and later retransmits or "replays" the same data in an attempt to impersonate one of the parties. This can lead to various malicious activities, including unauthorized access, fraud, and other security breaches.

To prevent replay attacks, two important pieces of information are typically used:

Timestamps: Including a timestamp in the transmitted data can help prevent replay attacks. Each message or transaction is associated with a specific timestamp, and the recipient can verify that the timestamp is within an acceptable time window. If the timestamp is too old or too far in the future, the recipient can reject the data as potentially being part of a replay attack.

Nonces: A nonce (number used once) is a unique identifier included in each message or transaction. It ensures that the data can only be used once. The recipient keeps track of the nonces it has seen and will reject any data with a previously used nonce. Nonces can be generated sequentially or randomly, as long as they are guaranteed to be unique.

By incorporating timestamps and nonces in the communication protocol or transaction data, systems can make it difficult or impossible for an attacker to replay the same data and carry out a successful replay attack. These mechanisms add an additional layer of security to ensure that the data exchanged between parties remains fresh and cannot be reused maliciously.

View more: [EIP-155](https://eips.ethereum.org/EIPS/eip-155)

**4. In a contract, how do we know who called a view function ?**
It's not possible to know it directly. A view functions are read-only and do not modify the blockchain state.

Whoever, we could implement mechanism like emitting an event before or after the function call. Also, we could do a kind of register, generating logs or writing in the logs.
