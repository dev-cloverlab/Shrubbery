# Shrubbery

A showcase for an iOS+Swift app, the concept is the same as the ** [Kloveroid](https://github.com/dev-cloverlab/Kloveroid) **. We hope can provide a
complete iOS basic architecture. Once we have a need to build an app, developers can focus on the
business flow/logic and don't have to create from 0 again and again.

# Architecture

This project mixes two current popular architectures, one is **VIPER**, another is **Clean
Architecture**. We keep the benefits from those two architectures and Repository Pattern,
additionally, they're modified as following ** [Kloveroid](https://github.com/dev-cloverlab/Kloveroid) ** project.

- VIPER
  - View
  - Interactor
  - Presenter
  - Entity
  - Router
- Repository Pattern (Data Manager)
  - Remote Repository
  - Local Repository

Here is our project architecture image

***

# How to use

# Future

- [ ] Add unit test for each module
- [ ] Add router how to work
- [ ] Add more interactors
- [ ] Add fetch a list and put into list table
- [ ] Add load image into a view

# Third-party Library

We're using a lot of **Rx** methods for getting the responses instead of using the interface to be
callback methods. There might be some hidden risks but let developers focus on coding that's a
better way we think.

- Rx
  - RxSwift
  - RxCocoa
  - ...
- DataBase
  - CoreData
  - Realm
- Dependency Injection
  - Swinject
- Internet
  - Alamofire
  - Moya
- Log
  - SwiftyBeaver
- Image
  - Kingfisher
- Json
  - ObjectMapper
  - SwiftyJSON

# License

```
MIT License

Copyright (c) 2018 Clover Lab, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

