# fevm-content-delivery-system
Repo for ETHGlobal Space Warp Hackathon

# Functions Overiew

This code defines a smart contract called "contentRegistry" that implements the ERC721 standard, which is a standard for creating non-fungible tokens (NFTs) on the Ethereum blockchain. The contract also uses several OpenZeppelin libraries for added functionality, such as Ownable (for access control), ReentrancyGuard (for security against reentrancy attacks), Counters (for counting the total supply of tokens), and Strings (for handling strings). The hybrid low-code/ no-code solution “721.so” is a useful tool to explore the functionality of the ERC-721 standard. Solutions, resources, and tools made for the citizen developer are critical to adoption of blockchain technology.

The contract has the following functions:

- mint(): creates a new token with the given parameters and assigns it to the msg.sender. The token parameters include metadataSchemeType, IPFS_JSON and ownerAddress.

- tokenParameters(): returns the parameters of a given token.

- totalSupply(): returns the total supply of tokens.

- setregistrationIsActive(): sets the registrationIsActive status.

- setBaseURI(): sets the customBaseURI.

Additionally, the contract has the following variables:

- tokenParametersMap: a mapping of token IDs to their parameters.

- supplyCounter: a counter for the total supply of tokens.

- registrationIsActive: a boolean that determines whether token registration is currently active.

- customBaseURI: a string that holds the custom base URI.

It is important to note that the contract is using OpenZeppelin Library and it is following the best practices for smart contract development.

# Token Metadata Overview

The token parameters in this contract are defined in a struct called "TokenParameters". This struct contains fields that store metadata about the digital asset that the token represents. The specific fields included in the struct can vary depending on the use case, but in the sample data provided, the fields include:

- contentTypeID: An identifier that describes the type of content the token represents. In the sample data provided, the contentTypeID is set to "1" for video content and "2" for IOTeSimRegistration. This lookup table can be found on the Github page.

- contentIPFS: In the sample data provided, this field is used to store the IPFS hash for the content / dataset file.

- payableAddress: The Ethereum address of the content creator / dataset owner / the IOT device's owner.

- computingServiceRegionID: An array of identifiers that describe the regions where the content is available or where the device is being used. The computingServiceRegionID definition table can be found on the Github page.

- fileType: In the sample data provided, this field is used to store the file type of video content.

- fileSize: In the sample data provided, this field is used to store the file size of video content.

- IMEI: In the sample data provided, this field is used to store the IMEI number of IOT devices.

- ESN: In the sample data provided, this field is used to store the ESN number of IOT devices.

- example_source: In the sample data provided, this field is used to store the example_source that the IoT use case is demonstrated with.

These fields provide a comprehensive set of metadata about the digital assets, which can be used to identify, track and verify the authenticity of digital assets. For example, the combination of the contentTypeID, contentIPFS and payableAddress can be used to validate public datasets for downstream consumption in various applications. Similarly, the combination of the IMEI, ESN and example_source can be used to verify the authenticity of IOT devices.

The token parameters are stored in the tokenParametersMap mapping, which is a private variable in the contract. The mapping uses tokenId as the key and TokenParameters struct as the value. This mapping allows users to look up the metadata associated with a specific token by passing the tokenId to the tokenParameters() function.

# Example Use Cases

This contract could be used for a variety of applications that involve registering and tracking unique digital assets on the blockchain.

One use case could be for registering and tracking digital content from museums and archives of NYC libraries on the blockchain. For example, the NYC libraries could use this contract to register and track all the digital collections available in the city, such as historical photographs, documents, and videos. The mint function can be used to create a new token for each collection, with the metadata fields including a contentTypeID, an IPFS hash for the collection, a payable address for the collection's owner, and information about the computing service regions where the collection is highly available through network slicing. Users can then use the tokenParameters function to look up the metadata for a given collection token. The contract can also provide an API for third-party developers and researchers to access the registered digital collections, ensuring that the integrity and traceability of the data is maintained while providing a secure way for researchers to access the data without compromising the privacy of the data.

Another use case could be for registering and tracking public digital infrastructure such as charge stations, weather devices, and various other IOT devices in digitally connected cities. The mint function can be used to create a new token for each device, with the metadata fields including a contentTypeID, an IMEI number, a payable address for the device's owner, and information about the computing service regions where the device is used. Users can then use the tokenParameters function to look up the metadata for a given device token. The contract can also provide an API for third-party developers to access the registered public datasets, allowing them to easily access information about the infrastructure and its usage, and also to verify its authenticity and integrity. Additional functions would be necessary to facilitate data packet uploads to IPFS with association to a verified device.

Another use case could be for registering and tracking other digital assets like music, art, etc. The mint function can be used to create a new token for each asset, with the metadata fields including a contentTypeID, a IPFS hash for the asset file, a payable address for the asset's creator, and information about the computing service regions where the asset is available. Users can then use the tokenParameters function to look up the metadata for a given asset token.

In all the above use cases, the mint function creates a new token with the given parameters and assigns it to the msg.sender. The setregistrationIsActive function controls whether token registration is currently active. The setBaseURI function sets the customBaseURI where the content is hosted.

# Data Validation

Data validation is a crucial aspect of smart contract development, as it ensures that the data stored on the blockchain is accurate and conforms to a specific format. One of the challenges with data validation is that, in cases where the data is stored on IPFS, the data needs to be retrieved from IPFS before it can be validated. Retrieving data from IPFS can be slow and resource-intensive, and if the data retrieval process fails, the validation process will also fail.

Another challenge with data validation is ensuring adherence to a JSON scheme standard. JSON is a popular data interchange format, but it is relatively unstructured and can take on many different forms. This makes it difficult to ensure that the data stored in IPFS conforms to a specific JSON schema, as there is no built-in mechanism for enforcing schema validation in JSON.

There are a few ways to address these challenges:

One solution is to use a JSON schema validation library, such as jsonschema, to validate the data stored in IPFS before it is added to the blockchain. This library allows developers to define a JSON schema and validate JSON data against it, which can help ensure that the data conforms to a specific format.

Another solution is to use a smart contract that can validate data stored in IPFS by checking certain properties of the data, such as its hash, size, format, etc. This can help ensure that the data is accurate and conforms to a specific format, without the need for a separate validation library.

Another way to address these challenges is to use an oracle service, which can fetch the data from IPFS and validate it against a schema before passing the validated data to the smart contract. This can help to ensure that the data conforms to a specific format and reduces the validation burden on the smart contract.

It's also important to note that, regardless of the method chosen to validate the data, it's important to make sure that the validation process is secure and cannot be easily circumvented by malicious actors.

# Deployment of registration smart contract

1) Create a metamask account: https://metamask.io/download/

2) Connect your metamask to the hyperspace testnet: https://metamask.io/download/. 

![image](https://user-images.githubusercontent.com/99636009/213929051-276d78bf-1539-484f-b36d-63d3b346dab2.png)

3) Get some test Filecoin for the hyperspace test: https://hyperspace.yoga/#faucet

![image](https://user-images.githubusercontent.com/99636009/213929354-2cf8213d-aba8-4802-ba9d-42161580588f.png)

![image](https://user-images.githubusercontent.com/99636009/213929485-04950056-a72d-425c-8bb0-8d65c344cddf.png)

4) Go the remix IDE and connect metamask (Injected provider)

![image](https://user-images.githubusercontent.com/99636009/213929573-9a1f1e78-a562-443e-a1ec-0533925df79e.png)

![image](https://user-images.githubusercontent.com/99636009/213929627-6d4d5d4a-c22e-410f-9da6-e385d9989342.png)

Successful remix connection:

![image](https://user-images.githubusercontent.com/99636009/213929726-666917e3-1907-407e-9f19-89aa09e93d64.png)

5) Import your contract to remix:

![image](https://user-images.githubusercontent.com/99636009/213929868-91efa155-ae52-4c27-86ab-ff6a00dd5274.png)


6) Compile your contract:

![image](https://user-images.githubusercontent.com/99636009/213929945-21150371-4069-472e-aa98-9e03809a111a.png)

7) Deploy, follow metamask prompts. Deployment may take some time:

![image](https://user-images.githubusercontent.com/99636009/213929999-db0c04f4-83ee-42d6-87c0-c617bff9fcb8.png)

![image](https://user-images.githubusercontent.com/99636009/213930022-353159f2-3eba-442b-93e4-96e010ffb4cc.png)

You now have a smart contract deployed to the hyperspace testnet.

![image](https://user-images.githubusercontent.com/99636009/213930052-7489ee37-867a-4fd7-b0e3-4e37b91d423b.png)

First deployment address: 0xC72968e4E4BE0F1175a645f63B57a7700e21D77f

You can register new registration tokens by passing an argument into the registration function like this:

[1, "QmPYg1wFgs8E5M4ErRU2dgsxLZv6WFyxWxavpTN34M6Bhw", "0x9acded31Eb1A4E4CB2cF53403dcaFf3ABE6eB897"]

The first argument declares the metadata scheme type, the second is the IPFS hash ID of the content. In this example it is not a JSON adhering to scheme type 1 JSON metadata standard, but a tiktok from artist Oblé Reed (@oblereed). Fiannly, the third is my wallet address created for this hackathon.

You can view the video here like this: https://ipfs.io/ipfs/QmPYg1wFgs8E5M4ErRU2dgsxLZv6WFyxWxavpTN34M6Bhw

Paste the contract ID and register to your heart's content:

![image](https://user-images.githubusercontent.com/99636009/213931606-3980764e-8c17-4d22-a8e5-ec2631c90e88.png)


You can also use the FEVM Hardhat KIT to build Dapps, and automate registration: https://github.com/filecoin-project/fevm-hardhat-kit


