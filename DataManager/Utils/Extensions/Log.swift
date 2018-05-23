//
//  Log.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import SwiftyBeaver

let loggerFormat = "$Dyyyy-MM-dd HH:mm:ss$d $L ($N.swift:$l): $M"
let swiftyLogger = SwiftyBeaver.self

func logv(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.verbose(message, _file, function, line: line, context: context)
}

func logd(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.debug(message, _file, function, line: line, context: context)
}

func logi(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.info(message, _file, function, line: line, context: context)
}

func logw(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.warning(message, _file, function, line: line, context: context)
}

func loge(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.error(message, _file, function, line: line, context: context)
}