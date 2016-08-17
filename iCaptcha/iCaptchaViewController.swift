//
//  iCaptchaViewController.swift
//  iCaptcha
//
//  Created by Andy Steinmann on 8/16/16.
//  Copyright © 2016 Andy Steinmann. All rights reserved.
//

import Foundation
class iCaptchaViewController: UIViewController {
    @IBOutlet var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        // always fill the view
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        view.backgroundColor = UIColor.clearColor()
        view.insertSubview(blurEffectView, belowSubview: self.containerView)

        containerView.layer.cornerRadius = 5;
        containerView.layer.borderWidth = 1;
        containerView.layer.borderColor = UIColor.darkGrayColor().CGColor

        containerView.layer.shadowColor = UIColor.blackColor().CGColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSizeZero
        containerView.layer.shadowRadius = 10
    }
}