import SwiftyBeaver

let log = SwiftyBeaver.self

func logv(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    log.verbose(message, _file, function, line: line, context: context)
}

func logd(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    log.debug(message, _file, function, line: line, context: context)
}

func logi(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    log.info(message, _file, function, line: line, context: context)
}

func logw(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    log.warning(message, _file, function, line: line, context: context)
}

func loge(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    log.error(message, _file, function, line: line, context: context)
}