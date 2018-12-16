//
//  WREvent.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 29..
//
//

import UIKit
import DateToolsSwift

open class WREvent: TimePeriod {
    open var title: String = ""
    open var id: Int = 0
    open var color: UIColor = UIColor.yellow
    
    open class func make(date:Date, chunk: TimeChunk, title: String, id: Int = 0, color: UIColor) -> WREvent {
        let event = WREvent(beginning: date, chunk: chunk)
        event.title = title
        event.id = id
        event.color = color
        return event
    }
}

