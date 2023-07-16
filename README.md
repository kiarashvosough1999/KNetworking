# KNetworking

![Swift](https://img.shields.io/badge/Swift-5.8_or_Higher-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS-Green?style=flat-square)
![SPM](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![Twitter](https://img.shields.io/badge/Twitter-@Vosough_k-blue.svg?style=flat-square)](https://twitter.com/vosough_k)
[![Linkedin](https://img.shields.io/badge/Linkedin-KiarashVosough-blue.svg?style=flat-square)](https://www.linkedin.com/in/kiarashvosough/)

Many times I use this structure for network layer of my own built applications. I came into a decision to make a package out of it.

It streamlines sending HTTP requests with simple structure, beneficial for small tasks and projects.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Contributors](#Contributors)
- [License](#license)


## Features

- [x] Send HTTP data requests.
- [x] Support different HTTP Methods.
- [x] Support url parameters.
- [x] Support http body.
- [x] Support http headers.
- [x] Support all status codes.
- [x] Support different routes and gateways
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

Once you have your Swift package set up, adding `KNetworking` as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/kiarashvosough1999/KNetworking.git", .upToNextMajor(from: "1.0.0"))
]
```

## Contributors

Feel free to share your ideas or any other problems. Pull requests are welcomed.

## License

`KNetwork` is released under an MIT license. See [LICENSE](https://github.com/kiarashvosough1999/KNetworking/blob/master/LICENSE) for more information.
