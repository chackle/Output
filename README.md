# 📢 Output
<p>
    <a href="https://travis-ci.com/chackle/Output">
      <img src="https://travis-ci.com/chackle/Output.svg?branch=master" alt="Travis CI" />
    </a>
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" />
    <a href="https://swift.org/package-manager">
      <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="https://img.shields.io/badge/platforms-ios%20linux%20mac-brightgreen.svg?style=flat" alt="iOS, Mac & Linux" />
</p>

Output is a simple print statement wrapper to make your application's logging more descriptive and easier to understand.

## 📝 Simple logging with descriptive syntax

Output uses Swift's strong type system to make it obvious what your print statements are meant to be displaying both in your code and in your program's output:

``` swift
log(.success("Successfully downloaded image!"))
```
=>

```
✅ Successfully downloaded image!
```

### Smart Result type logging

Output also provides helpers to make logging work the way it should do. We often deal with `Result` types when we're dealing with asynchronous actions such as web requests. Passing a `Result` type to Output's `log` function will bridge the outcome to either `.success` or `.failure` resulting in a more descriptive output:

``` swift
let result: Result<Any, LocalizedNetworkError> = .failure(NetworkError.forbidden)
log(result)
```
=>

```
❌ Error 403: Forbidden - Your LocalizedNetworkError description
```

