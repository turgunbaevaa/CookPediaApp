//
//  CustomTableViewCell.swift
//  CookPediaApp
//
//  Created by Aruuke Turgunbaeva on 31/1/24.
//

import Foundation

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let notificationsCellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
    }()
    
    private let titlesStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let mainImg = MakerView.shared.makeImage(image: UIImage(named: "user1"), cornerRadius: 25, contentMode: .scaleAspectFill)
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private let dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(hex: "#616161")
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let postImg = MakerView.shared.makeImage(image: UIImage(named: "toast"), cornerRadius: 15, contentMode: .scaleAspectFill)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(notificationsCellView)
        notificationsCellView.snp.makeConstraints { make in
            notificationsCellView.snp.makeConstraints { make in
                make.top.equalTo(contentView.snp.top).offset(24) // Add a top offset
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalTo(contentView.snp.bottom).offset(-24) // Add a bottom offset
                make.height.equalTo(85)
            }
        }
        
        notificationsCellView.addSubview(mainImg)
        mainImg.snp.makeConstraints { make in
            make.top.equalTo(notificationsCellView.snp.top).offset(18)
            make.leading.equalTo(notificationsCellView.snp.leading)
            make.height.width.equalTo(48)
        }
        
        notificationsCellView.addSubview(titlesStackView)
        titlesStackView.snp.makeConstraints { make in
            make.top.equalTo(notificationsCellView.snp.top)
            make.leading.equalTo(mainImg.snp.trailing).offset(16)
            make.bottom.equalTo(notificationsCellView.snp.bottom)
            make.centerY.equalTo(mainImg.snp.centerY)
        }
        titlesStackView.addArrangedSubview(mainLabel)
        titlesStackView.addArrangedSubview(dateAndTimeLabel)
        
        notificationsCellView.addSubview(postImg)
        postImg.snp.makeConstraints { make in
            make.top.equalTo(notificationsCellView.snp.top).offset(6)
            make.leading.equalTo(titlesStackView.snp.trailing).offset(12)
            make.trailing.equalTo(notificationsCellView.snp.trailing).offset(-12)
            make.height.equalTo(72)
            make.width.equalTo(72)
        }
        
    }
    
    func setData(_ image: String, mainTitle: String, dateAndTime: String, postImgName: String) {
        mainImg.image = UIImage(named: image)
        mainLabel.text = mainTitle
        dateAndTimeLabel.text = dateAndTime
        postImg.image = UIImage(named: postImgName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
