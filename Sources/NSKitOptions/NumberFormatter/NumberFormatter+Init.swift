//
//  NumberFormatter+Init.swift
//  NSKitOptions
//
//  Created by Pedro on 17.04.21.
//  Modified by Cameron de Bruyn on 22.02.22
//

import Foundation

public extension NumberFormatter
{
    convenience init(_ options: Option...)
    {
        self.init(options)
    }
    
    convenience init(_ options: Options)
    {
        self.init()
    
        apply(numberFormatterOptions: options)
    }
}
