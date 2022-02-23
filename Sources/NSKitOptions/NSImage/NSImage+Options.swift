//
//  NSImage+Options.swift
//  NSKitOptions
//
//  Created by Pedro on 16.04.21.
//  Modified by Cameron de Bruyn on 22.02.22
//

import AppKit

extension NSImage
{
    func withOptions(_ imageOptions: NSImage.Option...) -> NSImage
    {
        withOptions(imageOptions)
    }
    
    func withOptions(_ imageOptions: NSImage.Options) -> NSImage
    {
        var newImage = self
        
        imageOptions.forEach
        {
            option in
            
            switch option
            {
            case let .blendMode(blendMode):
                
                guard let blended = newImage.copy() as? NSImage
                else
                {
                    return
                }
                
                blended.lockFocus()
                
                let imageRect = NSRect(
                    origin: NSZeroPoint,
                    size:   newImage.size
                )
                imageRect.fill(using: blendMode)

                blended.unlockFocus()
                newImage = blended
                
            case let .tintColor(tintColor, blendMode):
                
                guard let tinted = newImage.copy() as? NSImage
                else
                {
                    return
                }
                
                tinted.lockFocus()
                tintColor.set()

                let imageRect = NSRect(
                    origin: NSZeroPoint,
                    size:   newImage.size
                )
                imageRect.fill(using: blendMode)

                tinted.unlockFocus()
                newImage = tinted
            }
        }
        
        return newImage
    }
    
    typealias Options = [Option]
    
    enum Option
    {
        /// The rendering mode controls how UIKit uses color information to display an image.
        case blendMode(NSCompositingOperation)
        
        case tintColor(
            _ tintColor: NSColor,
            blendMode:   NSCompositingOperation = .sourceAtop
        )
    }
}
