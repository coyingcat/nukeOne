// The MIT License (MIT)
//
// Copyright (c) 2015-2020 Alexander Grebenyuk (github.com/kean).

import Foundation
import CoreGraphics


public extension ImagePipeline.Configuration {
 

    /// - warning: Soft-deprecated in 9.0. The default image decoder now
    /// automatically attaches image data to the newly added ImageContainer type.
    /// To learn how to implement animated image support using this new type,
    /// see the new Image Formats guide https://github.com/kean/Nuke/blob/9.2.0/Documentation/Guides/image-formats.md"
    static var isAnimatedImageDataEnabled: Bool {
        get { _isAnimatedImageDataEnabled }
        set { _isAnimatedImageDataEnabled = newValue }
    }
}

private var _animatedImageDataAK = "Nuke.AnimatedImageData.AssociatedKey"

extension PlatformImage {
    /// - warning: Soft-deprecated in Nuke 9.0.
    public var animatedImageData: Data? {
        get { _animatedImageData }
        set { _animatedImageData = newValue }
    }

    // Deprecated in 9.0
    internal var _animatedImageData: Data? {
        get { objc_getAssociatedObject(self, &_animatedImageDataAK) as? Data }
        set { objc_setAssociatedObject(self, &_animatedImageDataAK, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}

