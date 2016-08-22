//
//  iCaptcha.swift
//  iCaptcha
//
//  Created by Andy Steinmann on 8/16/16.
//  Copyright © 2016 Andy Steinmann. All rights reserved.
//

import Foundation
@objc public class iCaptcha: NSObject {

    public static func show(completion: (Bool) -> ()) -> UIViewController {

        let storyboardName = "iCaptcha"
        let storyboardBundle = NSBundle(forClass: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)

        let vc = storyboard.instantiateInitialViewController() as! iCaptchaViewController

        vc.completion = completion
        return vc
    }
}