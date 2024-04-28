//
//  InvitingViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 12/31/23.
//

import UIKit

class InvitingViewController: UIViewController {
    
    private lazy var backIcon: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var messageIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.up.message"))
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let items = ["Invite", "Invited(3)"]
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    private lazy var inviteView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var linkTextField: UILabel = {
        let text = UILabel()
//        text.attributedText = NSAttributedString("Invitation link")
//        text.placeholder = "http://referrals.alga-app.kz/yeroma"
        text.text = "http://referrals.alga-app.kz/yeroma"
        return text
    }()
    
    private lazy var invitedView: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
        
        title = "Invite friend"
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func indexChanged(_ segmentedControl: UISegmentedControl){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            inviteView.isHidden = false
            invitedView.isHidden = true
        case 1:
            inviteView.isHidden = true
            invitedView.isHidden = false
        default:
            break
        }
    }
}


// MARK: - setting iui methods
private extension InvitingViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
        print("hellp")
    }
    
    func setupViews() {
        view.addSubview(backIcon)
        backIcon.addSubview(messageIcon)
        
        view.addSubview(segmentedControl)
        
        view.addSubview(inviteView)
        inviteView.addSubview(linkTextField)
    }
    
    func setupConstraints() {
        backIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.13)
            make.width.equalToSuperview().multipliedBy(0.25)
        }
        
        messageIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(0.8)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(backIcon.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        inviteView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        linkTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
}
