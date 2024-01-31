//
//  NewPwdPageController.swift
//  CookPediaApp
//
//  Created by Aruuke Turgunbaeva on 30/1/24.
//

import UIKit
import SnapKit

class NewPwdPageController: UIViewController, UITextFieldDelegate {
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var createNewPwdLabel = MakerView.shared.makeLabel(text: "Create New Password 🔐", textColor: .black, textSize: 30, textWeight: .bold)
    
    private lazy var newPwdDescLabel = MakerView.shared.makeLabel(text: "Enter your new password. If you forget it, then you have to do forgot password.", textColor: .black, textSize: 18, textWeight: .regular, numberOfLines: 0)
    
    private lazy var pwdTFLabel = MakerView.shared.makeLabel(text: "Password", textColor: .black, textSize: 16, textWeight: .bold)
    
    private lazy var pwdTF = MakerView.shared.makeTextField(leftViewMode: .always, rightViewTarget: self, rightViewAction: #selector(togglePasswordVisibility(_:)), isSecureTextEntry: true, tag: 0)
    
    private lazy var pwdTFViewLine = MakerView.shared.makeView(backgroundColor: .red)
    
    private lazy var confirmPwdTFLabel = MakerView.shared.makeLabel(text: "Confirm Password", textColor: .black, textSize: 16, textWeight: .bold)
    
    private lazy var confirmPwdTF = MakerView.shared.makeTextField(leftViewMode: .always, rightViewTarget: self, rightViewAction: #selector(toggleConfirmPasswordVisibility(_:)), isSecureTextEntry: true, tag: 1)
    
    private lazy var confirmPwdTFViewLine = MakerView.shared.makeView(backgroundColor: .red)
    
    private var isChecked = false
    
    private lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: isChecked ? "checked" : "unchecked"), for: .normal)
        button.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var checkBoxTitle: UILabel = MakerView().makeLabel(text: "Remember Me",
                                                                    textColor: .black,
                                                                    textSize: 18,
                                                                    textWeight: .semibold)
    
    private lazy var continueButton = MakerView.shared.makeButton(title: "Continue", backgroundColor: .init(hex: "#F5484A"), titleColor: .white, cornerRadius: 25, font: .systemFont(ofSize: 16, weight: .bold))
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI(){
        setupExitButton()
        
        setupNewPwdLabel()
        setupNewPwdDescLabel()
        
        setupPwdTFLabel()
        setupPwdTF()
        setupPwdTFViewLine()
        
        setupConfirmPwdTFLabel()
        setupConfirmPwdTF()
        setupConfirmPwdTFViewLine()
        
        setupCheckBox()
        setupCheckBoxTitle()
        
        setupContinueButton()
    }
    
    private func setupExitButton() {
        view.addSubview(exitButton)
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20 )
            make.leading.equalTo(view.snp.leading).offset(24)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
    }
    
    private func setupNewPwdLabel() {
        view.addSubview(createNewPwdLabel)
        createNewPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp.bottom).offset(34)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
    }
    
    private func setupNewPwdDescLabel(){
        view.addSubview(newPwdDescLabel)
        newPwdDescLabel.snp.makeConstraints { make in
            make.top.equalTo(createNewPwdLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
    }
    
    private func setupPwdTFLabel(){
        view.addSubview(pwdTFLabel)
        pwdTFLabel.snp.makeConstraints { make in
            make.top.equalTo(newPwdDescLabel.snp.bottom).offset(32)
            make.leading.equalTo(view.snp.leading).offset(24)
        }
    }
    
    private func setupPwdTF(){
        view.addSubview(pwdTF)
        pwdTF.snp.makeConstraints { make in
            make.top.equalTo(pwdTFLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
        pwdTF.delegate = self
        pwdTF.addTarget(self, action: #selector(continueButtonEnabled), for: .editingChanged)
    }
    
    private func setupPwdTFViewLine(){
        view.addSubview(pwdTFViewLine)
        pwdTFViewLine.snp.makeConstraints { make in
            make.top.equalTo(pwdTF.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.height.equalTo(1)
        }
    }
    
    private func setupConfirmPwdTFLabel(){
        view.addSubview(confirmPwdTFLabel)
        confirmPwdTFLabel.snp.makeConstraints { make in
            make.top.equalTo(pwdTFViewLine.snp.bottom).offset(24)
            make.leading.equalTo(view.snp.leading).offset(24)
        }
    }
    
    private func setupConfirmPwdTF(){
        view.addSubview(confirmPwdTF)
        confirmPwdTF.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTFLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
        confirmPwdTF.delegate = self
        confirmPwdTF.addTarget(self, action: #selector(continueButtonEnabled), for: .editingChanged)
    }
    
    private func setupConfirmPwdTFViewLine(){
        view.addSubview(confirmPwdTFViewLine)
        confirmPwdTFViewLine.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTF.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.height.equalTo(1)
        }
    }
    
    private func setupCheckBox(){
        view.addSubview(checkBoxButton)
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTFViewLine.snp.bottom).offset(24)
            make.leading.equalTo(view.snp.leading).inset(24)
            make.height.width.equalTo(30)
        }
    }
    
    private func setupCheckBoxTitle(){
        view.addSubview(checkBoxTitle)
        checkBoxTitle.snp.makeConstraints { make in
            make.top.equalTo(confirmPwdTFViewLine.snp.bottom).offset(24)
            make.leading.equalTo(checkBoxButton.snp.trailing).offset(10)
            make.centerY.equalTo(checkBoxButton.snp.centerY)
        }
    }
    
    private func setupContinueButton(){
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-36)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.height.equalTo(58)
        }
        continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
        continueButton.isEnabled = false
    }
    
    @objc private func checkBoxTapped() {
        isChecked.toggle()
        checkBoxButton.setImage(UIImage(named: isChecked ? "checked" : "unchecked"), for: .normal)
    }
    
    @objc private func continueButtonEnabled(_ sender: UITextField) {
        if pwdTF.text == confirmPwdTF.text, pwdTF.text?.count ?? 0 >= 4 {
            continueButton.isEnabled = true
            continueButton.backgroundColor = .init(hex: "#F5484A")
            check()
        } else {
            confirmPwdTFLabel.text = "Passwords do not match"
            confirmPwdTFLabel.textColor = .red
            confirmPwdTF.layer.borderWidth = 1
            confirmPwdTF.layer.borderColor = UIColor.red.cgColor
            continueButton.backgroundColor = .darkGray
        }
    }
    
    func check() {
        checkField(text: pwdTF.text, title: pwdTFLabel, textField: pwdTF)
        checkField(text: confirmPwdTF.text, title: confirmPwdTFLabel, textField: confirmPwdTF)
    }
    
    func checkField(text: String?, title: UILabel, textField: UITextField, minLength: Int = 6) {
        if let text = text, text.count >= minLength {
            title.text = (textField == pwdTF) ? "Password" : "Confirm Password"
            title.textColor = .init(hex: "#A5A5A5")
            textField.layer.borderColor = UIColor.white.cgColor
            textField.layer.borderWidth = 1
        } else {
            title.text = "Please, fill the field"
            title.textColor = .red
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @objc private func continueButtonTapped(_ sender: UIButton) {
        let vc = NotificationController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func exitButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc private func togglePasswordVisibility(_ sender: UIButton) {
        if sender.tag == 0 {
            pwdTF.isSecureTextEntry = !pwdTF.isSecureTextEntry
            let imageName = pwdTF.isSecureTextEntry ? "eye.slash" : "eye"
            sender.setBackgroundImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    @objc private func toggleConfirmPasswordVisibility(_ sender: UIButton) {
        if sender.tag == 0 {
            confirmPwdTF.isSecureTextEntry = !confirmPwdTF.isSecureTextEntry
            let imageName = confirmPwdTF.isSecureTextEntry ? "eye.slash" : "eye"
            sender.setBackgroundImage(UIImage(systemName: imageName), for: .normal)
        }
    }
     
}
