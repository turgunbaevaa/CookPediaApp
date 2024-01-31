//
//  MakerView.swift
//  CookPediaApp
//
//  Created by Aruuke Turgunbaeva on 30/1/24.
//

import Foundation
import UIKit

class MakerView: UIViewController, UITextFieldDelegate{
    
    static let shared = MakerView()
    
    func makeLabel(text: String,
                   textColor: UIColor,
                   textSize: CGFloat, textWeight: UIFont.Weight,
                   textAlignment: NSTextAlignment = .left,
                   numberOfLines: Int = 0,
                   lineBreakMode: NSLineBreakMode = .byWordWrapping ) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: textWeight)
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        return label
    }
    
    func makeTextField(placeholder: String = "Fill the field",
                       placeholderFontSize: CGFloat = 13.0,
                       textColor: UIColor = .black,
                       keyboardType: UIKeyboardType = .default,
                       leftViewMode: UITextField.ViewMode,
                       rightViewTarget: Any? = nil,
                       rightViewAction: Selector? = nil,
                       cornerRadius: CGFloat = 2,
                       isSecureTextEntry: Bool = false, tag: Int = 0) -> UITextField {
        
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: placeholderFontSize)])
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = leftView
        tf.leftViewMode = leftViewMode
        
        if let target = rightViewTarget, let action = rightViewAction {
            let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
            rightView.isUserInteractionEnabled = true
            rightView.addTarget(target, action: action, for: .touchUpInside)
            tf.rightView = rightView
            tf.rightViewMode = .always
        }
        
        tf.layer.cornerRadius = cornerRadius
        tf.isSecureTextEntry = isSecureTextEntry
        tf.tintColor = .black
        tf.tag = tag
        return tf
    }
    
    func makeImage (image: UIImage? = nil,
                    cornerRadius: CGFloat,
                    contentMode: UIView.ContentMode) -> UIImageView {
        let img = UIImageView()
        img.layer.cornerRadius = cornerRadius
        img.image = image
        img.contentMode = contentMode
        img.clipsToBounds = true
        return img
    }
    
    func makeView(backgroundColor: UIColor) -> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    func makeButton(title: String?,
                    backgroundColor: UIColor,
                    titleColor: UIColor?,
                    cornerRadius: CGFloat,
                    font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = font
        return button
    }
    
    func makeHorizontalStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
    
    func makeBackButton(backgroundColor: UIColor = .white, image: UIImage?) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setImage(image, for: .normal)
        return button
    }

    
}
