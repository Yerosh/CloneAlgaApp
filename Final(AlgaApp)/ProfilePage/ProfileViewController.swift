//
//  ProfileViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/25/23.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var backView1: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backPersonView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var personIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Yernur A."
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.text = "@yeroma"
        label.tintColor = .systemGray
        return label
    }()
    
    private lazy var backStepsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stepsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var energyIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "bolt"))
        imageView.tintColor = .orange
        return imageView
    }()
    
    private lazy var stepsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "139,647"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var stepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Steps counted"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var scopedStepsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var completedIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle"))
        imageView.tintColor = .systemGreen
        return imageView
    }()
    
    private lazy var scopedStepsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "50,000"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var scopedStepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Steps counted"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var backFriendsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var friendsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var topFriendsView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var friendsTitle: UILabel = {
        let label = UILabel()
        label.text = "My friends"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var addIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.badge.plus"))
        imageView.tintColor = UIColor(red: 0, green: 155/255, blue: 247/255, alpha: 1)
        return imageView
    }()
    
    private lazy var friendsLabel: UILabel = {
        let label = UILabel()
        label.text = "You don't have any friends yet"
        label.textColor = .systemGray
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
    }
    
    @objc private func openSettings() {
        print("button")
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}



// MARK: - setting iui methods
private extension ProfileViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backView1)
        backView1.addSubview(backPersonView)
        backPersonView.addSubview(personIcon)
        
        backView1.addSubview(nameLabel)
        
        backView1.addSubview(tagLabel)
        
        view.addSubview(backStepsView)
        backStepsView.addSubview(stepsView)
        backStepsView.addSubview(scopedStepsView)
        
        stepsView.addSubview(energyIcon)
        stepsView.addSubview(stepsCountLabel)
        stepsView.addSubview(stepsLabel)
        
        scopedStepsView.addSubview(completedIcon)
        scopedStepsView.addSubview(scopedStepsCountLabel)
        scopedStepsView.addSubview(scopedStepsLabel)
        
        view.addSubview(backFriendsView)
        backFriendsView.addSubview(friendsView)
        
        friendsView.addSubview(topFriendsView)
        topFriendsView.addSubview(friendsTitle)
        topFriendsView.addSubview(addIcon)
        
        friendsView.addSubview(friendsLabel)
    }
    
    func setupConstraints() {
        backView1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        backPersonView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(backView1.snp.top).offset(20)
            make.height.equalToSuperview().multipliedBy(0.45)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        personIcon.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(backPersonView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        backStepsView.snp.makeConstraints { make in
            make.top.equalTo(backView1.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.14)
        }
        
        stepsView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.46)
        }
        
        energyIcon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        
        stepsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(energyIcon.snp.bottom).offset(13)
            make.leading.equalTo(energyIcon)
        }
        
        stepsLabel.snp.makeConstraints { make in
            make.top.equalTo(stepsCountLabel.snp.bottom).offset(5)
            make.leading.equalTo(stepsCountLabel)
        }
        
        scopedStepsView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalToSuperview().multipliedBy(0.46)
        }
        
        completedIcon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(15)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        
        scopedStepsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(completedIcon.snp.bottom).offset(13)
            make.leading.equalTo(completedIcon)
        }
        
        scopedStepsLabel.snp.makeConstraints { make in
            make.top.equalTo(scopedStepsCountLabel.snp.bottom).offset(5)
            make.leading.equalTo(scopedStepsCountLabel)
        }
        
        backFriendsView.snp.makeConstraints { make in
            make.top.equalTo(backStepsView.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.2)
            make.leading.trailing.equalToSuperview()
        }
        
        friendsView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        topFriendsView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        friendsTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        
        addIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
            make.width.equalToSuperview().multipliedBy(0.07)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        friendsLabel.snp.makeConstraints { make in
            make.top.equalTo(topFriendsView.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
