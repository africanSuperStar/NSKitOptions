//
//  NSAttributedString+Options.swift
//  NSKitOptions
//
//  Created by Pedro on 17.04.21.
//  Modified by Cameron de Bruyn on 22.02.22
//

import AppKit

public extension NSAttributedString
{
    typealias Options = [Option]
    
    enum Option
    {
        /// The font of the text.
        case font(NSFont)
        
        /// The paragraph style of the text.
        case paragraphStyle(NSParagraphStyle)
        
        /// The color of the text.
        case foregroundColor(NSColor)
        
        /// The color of the background behind the text.
        case backgroundColor(NSColor)
        
        public enum LigatureStyle: Int, RawRepresentable
        {
            case none = 0
            case allLigatures = 1
        }
        
        /// The ligature of the text.
        case ligature(LigatureStyle)
        
        /// The kerning of the text.
        case kern(Double)
        
        #if swift(>=5.3)
        /// The amount to modify default tracking. 0 means tracking is disabled.
        case tracking(Float)
        #endif
        
        /// The strikethrough style of the text.
        case strikethroughStyle(NSUnderlineStyle)
        
        /// The underline style of the text.
        case underlineStyle(NSUnderlineStyle)
        
        /// The color of the stroke.
        case strokeColor(NSColor)
        
        /// The width of the stroke.
        case strokeWidth(Double)
        
        /// The shadow of the text.
        case shadow(NSShadow)
        
        /// The text effect.
        case textEffect(TextEffectStyle)
        
        /// The attachment for the text.
        case attachment(NSTextAttachment)
        
        /// The link for the text.
        case link(NSURL)
        
        /// The vertical offset for the position of the text.
        case baselineOffset(Double)
        
        /// The color of the underline.
        case underlineColor(NSColor)
        
        /// The color of the strikethrough.
        case strikethroughColor(NSColor)
        
        /// The obliqueness of the text.
        case obliqueness(Double)
        
        /// The expansion factor of the text.
        case expansion(Double)
        
        /// The writing direction of the text.
        case writingDirection([NSWritingDirection])
        
        public enum GlyphForm: Int, RawRepresentable
        {
            case horizontal = 0
            case vertical = 1
        }
        
        /// The vertical glyph form of the text.
        case verticalGlyphForm(GlyphForm)
        
        // MARK: - Convenience
        
        /// Constants that describe the preferred styles for fonts.
        @available(macOS 11.0, *)
        public static func textStyle(
            _ style: NSFont.TextStyle
        )
        -> Self
        {
            .font(
                NSFont.preferredFont(forTextStyle: style)
            )
        }
    }
}

public typealias AttributesDictionary = [NSAttributedString.Key : Any]

public extension AttributesDictionary
{
    static func options(_ options: NSAttributedString.Option...) -> AttributesDictionary
    {
        self.options(options)
    }
    
    static func options(_ options: NSAttributedString.Options) -> AttributesDictionary
    {
        var dict = [Key: Any]()
        
        options.forEach
        {
            attribute in
            
            switch attribute
            {
            case let .font(font):
                dict[.font] = font
                
            case let .paragraphStyle(paragraphStyle):
                dict[.paragraphStyle] = paragraphStyle
                
            case let .foregroundColor(foregroundColor):
                dict[.foregroundColor] = foregroundColor
                
            case let .backgroundColor(backgroundColor):
                dict[.backgroundColor] = backgroundColor
                
            case let .ligature(ligature):
                dict[.ligature] = NSNumber(integerLiteral: ligature.rawValue)
                
            case let .kern(kern):
                dict[.kern] = NSNumber(floatLiteral: kern)
                
            #if swift(>=5.3)
            case let .tracking(tracking):
                if #available(macOS 11.0, *)
                {
                    dict[.tracking] = tracking
                }
            #endif
            
            case let .strikethroughStyle(strikethroughStyle):
                dict[.strikethroughStyle] = NSNumber(integerLiteral: strikethroughStyle.rawValue)
                
            case let .underlineStyle(underlineStyle):
                dict[.underlineStyle] = NSNumber(integerLiteral: underlineStyle.rawValue)
                
            case let .strokeColor(strokeColor):
                dict[.strokeColor] = strokeColor
                
            case let .strokeWidth(strokeWidth):
                dict[.strokeWidth] = NSNumber(floatLiteral: strokeWidth)
                
            case let .shadow(shadow):
                dict[.shadow] = shadow
                
            case let .textEffect(textEffect):
                dict[.textEffect] = textEffect
                
            case let .attachment(attachment):
                dict[.attachment] = attachment
                
            case let .link(link):
                dict[.link] = link
                
            case let .baselineOffset(baselineOffset):
                dict[.baselineOffset] = NSNumber(floatLiteral: baselineOffset)
                
            case let .underlineColor(underlineColor):
                dict[.underlineColor] = underlineColor
                
            case let .strikethroughColor(strikethroughColor):
                dict[.strikethroughColor] = strikethroughColor
                
            case let .obliqueness(obliqueness):
                dict[.obliqueness] = NSNumber(floatLiteral: obliqueness)
                
            case let .expansion(expansion):
                dict[.expansion] = NSNumber(floatLiteral: expansion)
                
            case let .writingDirection(writingDirection):
                dict[.writingDirection] = writingDirection.map {
                    NSNumber(integerLiteral: $0.rawValue)
                }
                
            case let .verticalGlyphForm(verticalGlyphForm):
                dict[.verticalGlyphForm] = NSNumber(integerLiteral: verticalGlyphForm.rawValue)
            }
        }
        
        return dict
    }
}
