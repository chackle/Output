/**
*  Output
*  Copyright (c) Michael Green 2020
*  MIT license, see LICENSE file for details
*/

public enum LogMessage {
  
  case success(Any)
  case warning(Any)
  case failure(Any)
  case message(Any)
  case cancelled(Any)
  case finished(Any)

  var description: String {
    switch self {
    case .success(let value): return "✅ \(value)"
    case .warning(let value): return "⚠️ \(value)"
    case .failure(let value): return "❌ \(value)"
    case .message(let value): return "💬 \(value)"
    case .cancelled(let value): return "⛔ \(value)"
    case .finished(let value): return "🏁 \(value)"
    }
  }
}

public func log(_ message: Any, terminator: String = "\n") {
  #if DEBUG
    print(message, terminator: terminator)
  #endif
}

public func log(_ message: LogMessage, terminator: String = "\n") {
  log(message.description, terminator: terminator)
}

public func log<T, E>(_ result: Result<T, E>) {
  log(result.logMessage)
}

extension Result {
  
  var logMessage: LogMessage {
    switch self {
    case .success(let value): return .success(value)
    case .failure(let value): return .failure(value)
    }
  }
}
