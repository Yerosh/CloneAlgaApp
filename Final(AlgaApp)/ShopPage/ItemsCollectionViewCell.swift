//
//  ItemsCollectionViewCell.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/28/23.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    private lazy var likeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var likeICon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart"))
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var likesNumber: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var itemImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var labelsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var itemName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var availabilityStatus: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var availablePcs: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    func configure(image: String, likes: String, name: String, status: String, pcs: String){
        itemImage.image = UIImage(named: image)
        likesNumber.text = likes
        itemName.text = name
        availabilityStatus.text = status
        availablePcs.text = pcs
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
private extension ItemsCollectionViewCell {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        addSubview(itemImageView)
        itemImageView.addSubview(itemImage)
        itemImageView.addSubview(likeView)
        
        likeView.addSubview(likeICon)
        likeView.addSubview(likesNumber)
        
        addSubview(labelsView)
        labelsView.addSubview(itemName)
        labelsView.addSubview(availabilityStatus)
        labelsView.addSubview(availablePcs)
    }
    
    func setupConstraints() {
        itemImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.55)
        }
        
        itemImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.8)
        }
        
        likeView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview().multipliedBy(0.17)
        }
        
        likeICon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.centerY.equalToSuperview()
        }
        
        likesNumber.snp.makeConstraints { make in
            make.leading.equalTo(likeICon.snp.trailing)
            make.centerY.equalToSuperview()
        }
        
        labelsView.snp.makeConstraints { make in
            make.top.equalTo(itemImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        itemName.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(5)
        }
        
        availabilityStatus.snp.makeConstraints { make in
            make.top.equalTo(itemName.snp.bottom).offset(10)
            make.leading.equalTo(itemName)
        }
        
        availablePcs.snp.makeConstraints { make in
            make.top.equalTo(availabilityStatus.snp.bottom).offset(10)
            make.leading.equalTo(itemName)
        }
    }
}
