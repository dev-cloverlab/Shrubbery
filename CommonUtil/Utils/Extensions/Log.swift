//
//  Log.swift
//  Shrubbery
//
//  Created by jieyi on 2018/05/17.
//  Copyright © 2018 CloverLab. Inc. All rights reserved.
//

import SwiftyBeaver

public let loggerFormat = "$Dyyyy-MM-dd HH:mm:ss$d $L ($N.swift:$l): $M"
public let swiftyLogger = SwiftyBeaver.self

public func logv(_ message: @autoclosure () -> Any,
          _file: String = #file,
          _ function: String = #function,
          line: Int = #line,
          context: Any? = nil) {
    swiftyLogger.verbose(message, _file, function, line: line, context: context)
}

public func logd(_ message: @autoclosure () -> Any,
                 _file: String = #file,
                 _ function: String = #function,
                 line: Int = #line,
                 context: Any? = nil) {
    swiftyLogger.debug(message, _file, function, line: line, context: context)
}

public func logi(_ message: @autoclosure () -> Any,
                 _file: String = #file,
                 _ function: String = #function,
                 line: Int = #line,
                 context: Any? = nil) {
    swiftyLogger.info(message, _file, function, line: line, context: context)
}

public func logw(_ message: @autoclosure () -> Any,
                 _file: String = #file,
                 _ function: String = #function,
                 line: Int = #line,
                 context: Any? = nil) {
    swiftyLogger.warning(message, _file, function, line: line, context: context)
}

public func loge(_ message: @autoclosure () -> Any,
                 _file: String = #file,
                 _ function: String = #function,
                 line: Int = #line,
                 context: Any? = nil) {
    swiftyLogger.error(message, _file, function, line: line, context: context)
}