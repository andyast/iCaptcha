//
//  iCaptcha.swift
//  iCaptcha
//
//  Created by Andy Steinmann on 8/16/16.
//  Copyright © 2016 Andy Steinmann. All rights reserved.
//

import Foundation
public class iCaptcha {

    public static func load() -> UIViewController {

        let storyboardName = "iCaptcha"
        let storyboardBundle = NSBundle(forClass: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)

        return storyboard.instantiateInitialViewController()!
    }
}