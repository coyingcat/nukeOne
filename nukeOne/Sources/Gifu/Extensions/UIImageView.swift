#if os(iOS) || os(tvOS)
/// Makes `UIImageView` conform to `GifImageContainer`
import UIKit
extension UIImageView: GifImageContainer {}
#endif
