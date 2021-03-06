//
//  StringExtensions.swift
//  ProjectWorldFramework
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation

extension UIApplication {
    public var statusBarView : UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

extension UIView {
    func addConstraintsWithTheFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


extension String {
    
    public func toMiles() -> String? {
        if self.isEmpty { return nil }
        var stringWithoutChars: String?
        if self.contains("SKM"){
            stringWithoutChars = self.replacingOccurrences(of: "SKM", with: "")
        }
        guard let skmInt = Double(stringWithoutChars!) else { return "" }
        let miles = Float(skmInt * 0.621371)
        return "\(miles) Miles"
    }
    
    
    var length: Int {
        return self.count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String {
    public func toDouble() -> Double {
        guard let value = Double(self) else {
            return 0.00
        }
        return value
    }
}
