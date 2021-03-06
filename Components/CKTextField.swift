//
//  CKTextField.swift
//  Browser
//
//  Created by Blake Tsuzaki on 5/11/18.
//  Copyright © 2018 Modoki. All rights reserved.
//

import UIKit

@IBDesignable
class CKTextField: CKContentWrapperView {
    @IBInspectable
    var textSize: CGFloat = 30 {
        didSet { textfield.font = UIFont(name: CKDefaults.fontName, size: textSize) }
    }
    
    @IBInspectable
    var placeholderText: String = "" {
        didSet { textfield.placeholder = placeholderText }
    }
    
    @IBInspectable
    var text: String? {
        get { return textfield.text }
        set { textfield.text = newValue }
    }
    
    class _TextField: UITextField {
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            var frame = bounds
            frame.origin.x = 5
            frame.size.width -= 5
            return frame
        }
        
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            var frame = bounds
            frame.origin.x = 5
            frame.size.width -= 5
            return frame
        }
    }
    
    let textfield = _TextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    private func configure() {
        isOpaque = false
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.font = UIFont(name: CKDefaults.fontName, size: 30)
        
        textfield.backgroundColor = .white
        contentView.removeFromSuperview()
        contentView = textfield
        addSubview(contentView)
    }
    
    func hideKeyboard() {
        textfield.resignFirstResponder()
    }
}
