//
//  UILabel+Chainable.swift
//  UIChainable
//
//  Created by yfm on 2019/3/7.
//  Copyright © 2019年 yfm. All rights reserved.
//

import Foundation
import SnapKit

extension UILabel {
    convenience init(background: UIColor,
                     text: String,
                     font: UIFont,
                     textAlignment: NSTextAlignment,
                     textColor: UIColor,
                     numberOfLines: Int) {
        self.init(frame: .zero)
        
        self.backgroundColor = background
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = font
    }
    
    internal final class Builder {
        private var background: UIColor = .clear
        private var text: String = ""
        private var font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        private var textAlignment: NSTextAlignment = .left
        private var textColor: UIColor = .white
        private var numberOfLines: Int = 1
        
        func background(color: UIColor) -> Self {
            self.background = color
            return self
        }
        
        func text(text: String) -> Self {
            self.text = text
            return self
        }
        
        func textColor(color: UIColor) -> Self {
            self.textColor = color
            return self
        }
        
        func textAlignment(textAlignment: NSTextAlignment) -> Self {
            self.textAlignment = textAlignment
            return self
        }
        
        func font(font: UIFont) -> Self {
            self.font = font
            return self
        }
        
        func numberOfLines(numberOfLines: Int) -> Self {
            self.numberOfLines = numberOfLines
            return self
        }
        
        func build() -> UILabel {
            return UILabel(background: self.background,
                           text: self.text,
                           font: self.font,
                           textAlignment: self.textAlignment,
                           textColor: self.textColor,
                           numberOfLines: self.numberOfLines)
        }
    }
    
    func addTo(superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    
    func layout(closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.makeConstraints { (make) in
            closure(make)
        }
    }
    
}
