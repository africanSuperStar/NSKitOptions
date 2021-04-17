//
//  UIScrollView+Options.swift
//  UIKitOptions
//
//  Created by Pedro on 16.04.21.
//

import UIKit

@available(iOS 11.1, *)
public extension UIScrollView {
    
    func apply(scrollViewOptions: Option...) {
        apply(scrollViewOptions: scrollViewOptions)
    }
        
    func apply(scrollViewOptions: Options) {
        scrollViewOptions.forEach { option in
            switch option {
            case let .contentInset(contentInset):
                self.contentInset = contentInset
                
            case let .isDirectionalLockEnabled(isDirectionalLockEnabled):
                self.isDirectionalLockEnabled = isDirectionalLockEnabled
                
            case let .bounces(bounces):
                self.bounces = bounces
                
            case let .alwaysBounceVertical(alwaysBounceVertical):
                self.alwaysBounceVertical = alwaysBounceVertical
                
            case let .alwaysBounceHorizontal(alwaysBounceHorizontal):
                self.alwaysBounceHorizontal = alwaysBounceHorizontal
                
            case let .isPagingEnabled(isPagingEnabled):
                self.isPagingEnabled = isPagingEnabled
                
            case let .isScrollEnabled(isScrollEnabled):
                self.isScrollEnabled = isScrollEnabled
                
            case let .showsVerticalScrollIndicator(showsVerticalScrollIndicator):
                self.showsVerticalScrollIndicator = showsVerticalScrollIndicator
                
            case let .showsHorizontalScrollIndicator(showsHorizontalScrollIndicator):
                self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
                
            case let .indicatorStyle(indicatorStyle):
                self.indicatorStyle = indicatorStyle
                
            case let .decelerationRate(decelerationRate):
                self.decelerationRate = decelerationRate
                
            case let .keyboardDismissMode(keyboardDismissMode):
                self.keyboardDismissMode = keyboardDismissMode
                
            case let .scrollsToTop(scrollsToTop):
                self.scrollsToTop = scrollsToTop
                
            case let .viewOptions(viewOptions):
                apply(viewOptions: viewOptions)
                
            case let .contentOffset(contentOffset):
                self.contentOffset = contentOffset
                
            case let .contentSize(contentSize):
                self.contentSize = contentSize
                
            case let .contentInsetAdjustmentBehavior(contentInsetAdjustmentBehavior):
                self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
                
            #if swift(>=5.0)
            case let .automaticallyAdjustsScrollIndicatorInsets(automaticallyAdjustsScrollIndicatorInsets):
                if #available(iOS 13.0, *) {
                    self.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
                }
            #endif
                
            case let .delegate(delegate):
                self.delegate = delegate
                
            case let .verticalScrollIndicatorInsets(verticalScrollIndicatorInsets):
                self.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
                
            case let .horizontalScrollIndicatorInsets(horizontalScrollIndicatorInsets):
                self.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
                
            case let .scrollIndicatorInsets(scrollIndicatorInsets):
                self.scrollIndicatorInsets = scrollIndicatorInsets
                
            case let .delaysContentTouches(delaysContentTouches):
                self.delaysContentTouches = delaysContentTouches
                
            case let .canCancelContentTouches(canCancelContentTouches):
                self.canCancelContentTouches = canCancelContentTouches
                
            case let .indexDisplayMode(indexDisplayMode):
                self.indexDisplayMode = indexDisplayMode
            }
        }
    }
    
    typealias Options = [Option]
    
    enum Option {
        /// The point at which the origin of the content view is offset from the origin of the scroll view.
        case contentOffset(CGPoint)
        
        /// The size of the content view.
        case contentSize(CGSize)
        
        // MARK: - Content Inset
        
        /// The custom distance that the content view is inset from the safe area or scroll view edges.
        case contentInset(UIEdgeInsets)
        
        /// The custom distance that the content view is inset from the safe area or scroll view edges.
        public static func contentInset(top: CGFloat = .zero, left: CGFloat = .zero, bottom: CGFloat = .zero, right: CGFloat = .zero) -> Self {
            .contentInset(UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
        }
        
        /// The custom distance that the content view is inset from the safe area or scroll view edges.
        public static func contentInset<T: RawRepresentable>(top: T? = nil, left: T? = nil, bottom: T? = nil, right: T? = nil) -> Self where T.RawValue == CGFloat {
            .contentInset(UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
        }
        
        /// The behavior for determining the adjusted content offsets.
        case contentInsetAdjustmentBehavior(UIScrollView.ContentInsetAdjustmentBehavior)
        
        @available(iOS 13.0, *)
        /// Configures whether the scroll indicator insets are automatically adjusted by the system.
        case automaticallyAdjustsScrollIndicatorInsets(Bool)
        
        /// The delegate of the scroll-view object.
        case delegate(UIScrollViewDelegate?)
        
        /// A Boolean value that determines whether scrolling is disabled in a particular direction.
        case isDirectionalLockEnabled(Bool)

        /// A Boolean value that controls whether the scroll view bounces past the edge of content and back again.
        case bounces(Bool)

        /// A Boolean value that determines whether bouncing always occurs when vertical scrolling reaches the end of the content.
        case alwaysBounceVertical(Bool)

        /// A Boolean value that determines whether bouncing always occurs when horizontal scrolling reaches the end of the content view.
        case alwaysBounceHorizontal(Bool)

        /// A Boolean value that determines whether paging is enabled for the scroll view.
        case isPagingEnabled(Bool)

        /// A Boolean value that determines whether scrolling is enabled.
        case isScrollEnabled(Bool)
        
        /// A Boolean value that controls whether the vertical scroll indicator is visible.
        case showsVerticalScrollIndicator(Bool)

        /// A Boolean value that controls whether the horizontal scroll indicator is visible.
        case showsHorizontalScrollIndicator(Bool)

        /// The style of the scroll indicators.
        case indicatorStyle(UIScrollView.IndicatorStyle)
        
        /// The distance the scroll indicators are inset from the vettical edges of the scroll view.
        case verticalScrollIndicatorInsets(UIEdgeInsets)
        
        /// The distance the scroll indicators are inset from the horizontal edges of the scroll view.
        case horizontalScrollIndicatorInsets(UIEdgeInsets)
        
        /// The distance the scroll indicators are inset from the edge of the scroll view.
        case scrollIndicatorInsets(UIEdgeInsets)
        
        /// A floating-point value that determines the rate of deceleration after the user lifts their finger.
        case decelerationRate(UIScrollView.DecelerationRate)
        
        /// A Boolean value that determines whether the scroll view delays the handling of touch-down gestures.
        case delaysContentTouches(Bool)
        
        /// A Boolean value that controls whether touches in the content view always lead to tracking.
        case canCancelContentTouches(Bool)
        
        /// The manner in which the index is shown while the user is scrolling.
        case indexDisplayMode(UIScrollView.IndexDisplayMode)
        
        /// The manner in which the keyboard is dismissed when a drag begins in the scroll view.
        case keyboardDismissMode(UIScrollView.KeyboardDismissMode)
        
        /// A Boolean value that controls whether the scroll-to-top gesture is enabled. default is YES.
        case scrollsToTop(Bool)
        
        /// The appearance options of the view.
        case viewOptions(UIView.Options)
        
        /// The appearance options of the view.
        public static func viewOptions(_ options: UIView.Option...) -> Self {
            .viewOptions(options)
        }
        
        /// Describes the layer's appearance.
        public static func layerOptions(_ layerOptions: CALayer.Option...) -> Self {
            .viewOptions(.layerOptions(layerOptions))
        }
        
        /// Describes the view's layout compression and hugging priorities.
        public static func layoutCompression(_ options: LayoutCompressionOption...) -> Self {
            .viewOptions(.layoutCompression(options))
        }
    }
}
