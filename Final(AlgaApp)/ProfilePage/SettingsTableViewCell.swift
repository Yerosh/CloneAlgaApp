//
//  SettingsTableViewCell.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 12/14/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var chevronRight: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(icons: String, title: String){
        icon.image = UIImage(systemName: icons)
        cellTitle.text = title
    }

}


// MARK: - setting iui methods
private extension SettingsTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(icon)
        addSubview(cellTitle)
        addSubview(chevronRight)
    }
    
    func setupConstraints() {
        icon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        cellTitle.snp.makeConstraints { make in
            make.leading.equalTo(icon.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        chevronRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
}

