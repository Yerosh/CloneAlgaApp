//
//  MessageTableViewCell.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/25/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    private lazy var wholeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var backIcon: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        return view
    }()
    
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
    
    private lazy var cellSubtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var chevronRight: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(iconsBack: UIColor, icons: String, title: String, subtitle: String){
        backIcon.backgroundColor = iconsBack
        icon.image = UIImage(systemName: icons)
        cellTitle.text = title
        cellSubtitle.text = subtitle
    }
}

// MARK: - setting ui methods
private extension MessageTableViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(wholeView)
        wholeView.addSubview(backIcon)
        backIcon.addSubview(icon)
        
        wholeView.addSubview(cellTitle)
        wholeView.addSubview(cellSubtitle)
        wholeView.addSubview(chevronRight)
        wholeView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        backIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(27)
        }
        
        cellTitle.snp.makeConstraints { make in
            make.leading.equalTo(backIcon.snp.trailing).offset(10)
            make.top.equalTo(backIcon).offset(5)
        }
        
        cellSubtitle.snp.makeConstraints { make in
            make.top.equalTo(cellTitle.snp.bottom).offset(5)
            make.leading.equalTo(cellTitle)
        }
        
        chevronRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
