![Swift](https://img.shields.io/badge/Swift-5.4_or_Higher-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-Green?style=flat-square)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/Twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/vosough_k)
[![Linkedin](https://img.shields.io/badge/Linkedin-KiarashVosough-blue.svg?style=flat-square)](https://www.linkedin.com/in/kiarashvosough/)

Mockia: Easy Handling Mock's Expectations in Swift

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Contributors](#Contributors)
- [License](#license)


# KNetworking

Many time I use this structure for network layer of my own built application. I come into a descision to make a package of it.

It streamline sending HTTP request with simple structure, benficial for small task and projects.

## Features

- [x] Send HTTP data requests.
- [x] Support different HTTP Methods.
- [x] Support url parameters.
- [x] Support http body.
- [x] Support http headers.
- [x] Support all status code.
- [x] Support different route and gateways
- [x] build parameters, body and headers easily with @BodyBuilder and @KeyValueBuilder.

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.8 | [SPM](#spm) | Tested |
| macOS 10.15+ | 5.8 | [SPM](#spm) | Tested |
| macCatalyst 13+ | 5.8 | [SPM](#spm) | Tested |
| watchOs 6.0+ | 5.8 | [SPM](#spm) | NotTested |
| tvOS 13.0+ | 5.8 | [SPM](#spm) | NotTested |

## Installation

### SPM

The [Swift Package Manager](https://www.swift.org/package-manager) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding `KNetwork` as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/KNetworking.git", .upToNextMajor(from: "0.0.1"))
]
```

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

`KNetwork` is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/KNetworking/blob/master/LICENSE) for more information.
