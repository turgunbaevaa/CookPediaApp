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
                       cornerRadius: CGFloat = 2) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                          attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: placeholderFontSize)])
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        return tf
    }
    
    func makeImage (image: UIImage? = nil,
                    cornerRadius: CGFloat,
                    contentMode: UIView.ContentMode) -> UIImageView {
        let img = UIImageView()
        img.layer.cornerRadius = cornerRadius
        img.image = image
        img.contentMode = contentMode
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
                    //action: (Selector, UIViewController),
                    font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        //button.addTarget(action.1, action: action.0, for: .touchUpInside)
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
    
    func makeCodeButton(backgroundColor: UIColor = .white,
                        titleColor: UIColor? = .black,
                        cornerRadius: CGFloat,
                        borderWidth: CGFloat = 1,
                        borderColor: CGColor = UIColor.black.cgColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitle("X", for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
        return button
    }
    
    func makeCodeResetTF(placeholder: String = "Enter your mobile number or email",
                       placeholderFontSize: CGFloat = 13.0,
                       textColor: UIColor = .black,
                       keyboardType: UIKeyboardType = .default,
                       leftViewMode: UITextField.ViewMode,
                         cornerRadius: CGFloat = 5, backgroundColor: UIColor, borderColor: CGColor) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: placeholderFontSize)])
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = backgroundColor
        tf.layer.borderColor = borderColor
        tf.layer.borderWidth = 1.0
        tf.isEnabled = false
        return tf
    }
}
