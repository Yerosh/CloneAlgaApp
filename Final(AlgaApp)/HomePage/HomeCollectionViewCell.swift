//
//  HomeCollectionViewCell.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/27/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    private lazy var backIcon: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var chevronRight: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    func configure(iconsBackColor: UIColor, image: String, text: String?){
        backIcon.backgroundColor = iconsBackColor
        icon.image = UIImage(systemName: image)
        title.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - setting iui methods
private extension HomeCollectionViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(backIcon)
        backIcon.addSubview(icon)
        
        addSubview(title)
        addSubview(chevronRight)
    }
    
    func setupConstraints() {
        backIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.height.width.equalTo(45)
            make.centerY.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(backIcon.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        
        chevronRight.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
    }
}
