//
//  SVGDemoViewController.swift
//  NukeDemo
//
//  Created by Alexander Grebenyuk on 27.03.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit



final class SwiftSVGDemoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = UIColor.white
        }

        ImageDecoderRegistry.shared.register { context in
            // Replace this with whatever works for. There are no magic numbers
            // for SVG like are used for other binary formats, it's just XML.
            let isSVG = context.urlResponse?.url?.absoluteString.hasSuffix(".svg") ?? false
            return isSVG ? ImageDecoders.Empty() : nil
        }

        var url = URL(string: "https://en.wikipedia.org/w/skins/Vector/resources/skins.vector.styles/images/arrow-down.svg")!
        url = URL(string: "https://blog.hubspot.com/hubfs/svg-orange-circle.svg")!
      //  url = URL(string: "https://blog.hubspot.com/hubfs/hs-logo-svg-example-blog-post.svg")!
            
            
        // If you know that all images downloaded by the pipeline are going to be SVG,
        // you can just call `loadData(with:)` instead and not register an Empty decoder.
        ImagePipeline.shared.loadImage(with: url) { [weak self] result in
            guard let self = self, let data = try? result.get().container.data else {
                return
            }

            // You can render image using whatever size you want, vector!
            let targetBounds = CGRect(origin: .zero, size: CGSize(width: 300, height: 300))
            let svgView = UIView(svgData: data, parser: nil) { (layer) in
                layer.fillColor = UIColor.orange.cgColor
                layer.resizeToFit(targetBounds)
            }

            self.view.addSubview(svgView)

            svgView.bounds = targetBounds
            svgView.center = self.view.center
        }
    }
}
