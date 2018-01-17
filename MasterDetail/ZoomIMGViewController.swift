//
//  ZoomIMGViewController.swift
//  MasterDetail
//
//  Created by vietanh on 1/13/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class ZoomIMGViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // maximumZoomScale mac dinh =1, zoom bang do phan giai anh goc, khong bi vo anh, nhung phai gui anh goc vao
            scrollView.minimumZoomScale = 1  // ti le zoom nho
            scrollView.maximumZoomScale = 3 // ti le zoom to
            scrollView.zoomScale = 1
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!

    var dataImageView: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = dataImageView
    }

    // zoom image
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    // can hinh o giua kho zoom nho lai
    fileprivate func updateConstraintsForSize(_ size: CGSize) {
        
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
   
}
