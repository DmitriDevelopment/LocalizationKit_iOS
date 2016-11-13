//
//  NavigationItem+Localization.swift
//  Pods
//
//  Created by Will Powell on 13/11/2016.
//
//

import Foundation
import ObjectiveC
import UIKit

private var localizationKey: UInt8 = 1

extension UINavigationItem {
    @IBInspectable
    public var LocalizeKey: String? {
        get {
            return objc_getAssociatedObject(self, &localizationKey) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &localizationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            updateLocalisation()
            setup();
        }
    }
    
    func clear(){
        NotificationCenter.default.removeObserver(self)
    }
    
    func setup(){
        self.clear()
        NotificationCenter.default.addObserver(self, selector: #selector(updateFromNotification), name: Localization.ALL_CHANGE, object: nil)
        let eventHighlight = "LOC_HIGHLIGHT_\(LocalizeKey!)"
        NotificationCenter.default.addObserver(self, selector: #selector(highlight), name: NSNotification.Name(rawValue:eventHighlight), object: nil)
        let eventText = "LOC_TEXT_\(LocalizeKey!)"
        NotificationCenter.default.addObserver(self, selector: #selector(updateFromNotification), name: NSNotification.Name(rawValue:eventText), object: nil)
        
    }
    
    @objc private func updateFromNotification() {
        //self.morphingEnabled = true
        DispatchQueue.main.async(execute: {
            self.updateLocalisation()
        })
        
    }
    
    
    public func highlight() {
        /*DispatchQueue.main.async(execute: {
            let originalCGColor = self.layer.backgroundColor
            UIView.animate(withDuration: 0.4, animations: {
                self.layer.backgroundColor = UIColor.red.cgColor
            }, completion: { (okay) in
                UIView.animate(withDuration: 0.4, delay: 0.4, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                    self.layer.backgroundColor = originalCGColor
                }, completion: { (complete) in
                    
                })
            })
        })*/
    }
    
    public func updateLocalisation() {
        if ((self.LocalizeKey?.isEmpty) != nil)  {
            var languageString = Localization.get(self.LocalizeKey!, alternate:self.LocalizeKey!)
            /*if self.uppercased == true {
             languageString = languageString.uppercased()
             }*/
            self.title = languageString
        } else {
            self.title = ""
        }
    }
}