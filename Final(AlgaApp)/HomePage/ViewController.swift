//
//  ViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/16/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    private var isBonus1Claimed = false
    private var isBonus2Claimed = false
    private var isBonus3Claimed = false
    
    private lazy var backWalletView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var walletView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 172/255, blue: 1, alpha: 1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var walletLabel: UILabel = {
        let label = UILabel()
        label.text = "Wallet\nbalance"
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private lazy var walletTotal: UILabel = {
        let label = UILabel()
        label.text = "91.00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var walletRate: UILabel = {
        let label = UILabel()
        label.text = "1,000 steps → 1 TER"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var chevronRightWhite: UIImageView = {
       let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var passedView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var passedLabel: UILabel = {
        let label = UILabel()
        label.text = "Passed\ntoday"
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var passedTotal: UILabel = {
        let label = UILabel()
        label.text = "7,816"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var passedRate: UILabel = {
        let label = UILabel()
        label.text = "You will receive 5 T..."
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var chevronRightBlack: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .darkGray
        return imageView
    }()
    
    private lazy var infoSymbol1: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return imageView
    }()
    
    
    private lazy var backBonusView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var bonusesView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var bonusesLabel: UILabel = {
        let label = UILabel()
        label.text = "Daily bonuses"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var bonusesRequirementLabel: UILabel = {
        let label = UILabel()
        label.text = "Bonuses for viewing ads"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private lazy var infoSymbol2: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "info.circle"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return imageView
    }()
    
    private lazy var container1: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var giftSymbol1: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "gift"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var bonus1Label: UILabel = {
        let label = UILabel()
        label.text = "1 TER"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var bonus1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 0, green: 172/255, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.addTarget(self, action: #selector(bonus1ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var container2: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var lock1Symbol: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "lock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var giftSymbol2: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "gift"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = .black
        imageView.isHidden = true
        return imageView
    }()
    
    private lazy var bonus2Label: UILabel = {
        let label = UILabel()
        label.text = "1 TER"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var bonus2DisableLabel: UILabel = {
        let label = UILabel()
        label.text = "Get 1st bonus"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        return label
    }()
    
    private lazy var bonus2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 0, green: 172/255, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.isHidden = true
        button.addTarget(self, action: #selector(bonus2ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var container3: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var lock2Symbol: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "lock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var giftSymbol3: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "gift"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.isHidden = true
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var bonus3Label: UILabel = {
        let label = UILabel()
        label.text = "3 TER"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var bonus3DisableLabel: UILabel = {
        let label = UILabel()
        label.text = "Get 2nd bonus"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        return label
    }()
    
    private lazy var bonus3Button: UIButton = {
        let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 0, green: 172/255, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.isHidden = true
        button.addTarget(self, action: #selector(bonus3ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let backIcons = [UIColor(red: 229/255, green: 246/255, blue: 1, alpha: 1),
                     UIColor(red: 234/255, green: 248/255, blue: 239/255, alpha: 1)]
    let icons = ["arrow.up.message", "questionmark.circle"]
    let labels = ["Bonus 5 TER for a friend", "How does the application work?"]
    
    private lazy var backCollectionView: UIView = {
        let view = UIView()
        return view
    }()
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    
    @objc private func bonus1ButtonTapped() {
        if isBonus1Claimed {
            bonus1Button.isHidden = true
            container1.backgroundColor = .systemGray5
            let label = UILabel()
            label.text = "Вы получили бонус"
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .gray
            container1.addSubview(label)
            label.snp.makeConstraints { make in
                make.top.equalTo(bonus1Label.snp.bottom).offset(10)
                make.leading.equalTo(giftSymbol1).offset(3)
                make.trailing.equalToSuperview()
            }
        } else {
            walletTotal.text = "92.00"
            bonus2Button.isHidden = false
            lock1Symbol.isHidden = true
            giftSymbol2.isHidden = false
            bonus2DisableLabel.isHidden = true
            isBonus1Claimed = true
        }
    }

    @objc private func bonus2ButtonTapped() {
        if isBonus2Claimed {
            bonus2Button.isHidden = true
            container2.backgroundColor = .systemGray5
            let label = UILabel()
            label.text = "Вы получили бонус"
            label.numberOfLines = 2
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .gray
            container2.addSubview(label)
            label.snp.makeConstraints { make in
                make.top.equalTo(bonus2Label.snp.bottom).offset(10)
                make.leading.equalTo(lock1Symbol).offset(3)
                make.trailing.equalToSuperview()
            }
        } else {
            walletTotal.text = "93.00"
            bonus3Button.isHidden = false
            bonus3DisableLabel.isHidden = true
            lock2Symbol.isHidden = true
            giftSymbol3.isHidden = false
            isBonus2Claimed = true
        }
    }

    @objc private func bonus3ButtonTapped() {
        bonus3Button.isHidden = true
        walletTotal.text = "96.00"
        container3.backgroundColor = .systemGray5
        let label = UILabel()
        label.text = "Вы получили бонус"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        container3.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(bonus3Label.snp.bottom).offset(10)
            make.leading.equalTo(lock2Symbol).offset(3)
            make.trailing.equalToSuperview()
        }
        isBonus3Claimed = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.configure(iconsBackColor: backIcons[indexPath.row], image: icons[indexPath.row], text: labels[indexPath.row])
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.backgroundColor = .white
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let nextvc = InvitingViewController()
            navigationController?.pushViewController(nextvc, animated: true)
        } else if indexPath.item == 1{
            let nextvc = AboutViewController()
            navigationController?.pushViewController(nextvc, animated: true)
        }
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.window!.windowScene!.screen.bounds.width * 0.9 , height: view.window!.windowScene!.screen.bounds.height * 0.085)
    }
}


// MARK: - setting iui methods
private extension ViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backWalletView)
        
        backWalletView.addSubview(walletView)
        walletView.addSubview(walletLabel)
        walletView.addSubview(walletTotal)
        walletView.addSubview(walletRate)
        walletView.addSubview(chevronRightWhite)
        
        backWalletView.addSubview(passedView)
        passedView.addSubview(passedLabel)
        passedView.addSubview(passedTotal)
        passedView.addSubview(passedRate)
        passedView.addSubview(infoSymbol1)
        passedView.addSubview(chevronRightBlack)
        
        view.addSubview(backBonusView)
        
        backBonusView.addSubview(bonusesView)
        bonusesView.addSubview(bonusesLabel)
        bonusesView.addSubview(bonusesRequirementLabel)
        bonusesView.addSubview(infoSymbol2)
        
        bonusesView.addSubview(container1)
        container1.addSubview(giftSymbol1)
        container1.addSubview(bonus1Label)
        container1.addSubview(bonus1Button)
        
        bonusesView.addSubview(container2)
        container2.addSubview(lock1Symbol)
        container2.addSubview(giftSymbol2)
        container2.addSubview(bonus2Label)
        container2.addSubview(bonus2DisableLabel)
        container2.addSubview(bonus2Button)
        
        
        bonusesView.addSubview(container3)
        container3.addSubview(lock2Symbol)
        container3.addSubview(giftSymbol3)
        container3.addSubview(bonus3Label)
        container3.addSubview(bonus3DisableLabel)
        container3.addSubview(bonus3Button)
        
        view.addSubview(backCollectionView)
        backCollectionView.addSubview(myCollectionView)
        
    }
    
    func setupConstraints() {
        backWalletView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(5.5)
        }
        
        walletView.snp.makeConstraints { make in
            make.trailing.equalTo(backWalletView.snp.centerX).offset(-5)
            make.leading.equalToSuperview().offset(20)
            make.top.bottom.equalToSuperview()
        }
        walletLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(30)
        }
        walletTotal.snp.makeConstraints { make in
            make.top.equalTo(walletLabel.snp.bottom).offset(10)
            make.leading.equalTo(walletLabel)
        }
        walletRate.snp.makeConstraints { make in
            make.top.equalTo(walletTotal.snp.bottom).offset(10)
            make.leading.equalTo(walletLabel)
        }
        chevronRightWhite.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        passedView.snp.makeConstraints { make in
            make.leading.equalTo(backWalletView.snp.centerX).offset(5)
            make.trailing.equalToSuperview().offset(-20)
            make.top.bottom.equalToSuperview()
        }
        passedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(30)
        }
        passedTotal.snp.makeConstraints { make in
            make.top.equalTo(passedLabel.snp.bottom).offset(10)
            make.leading.equalTo(passedLabel)
        }
        passedRate.snp.makeConstraints { make in
            make.top.equalTo(passedTotal.snp.bottom).offset(10)
            make.leading.equalTo(passedLabel)
        }
        infoSymbol1.snp.makeConstraints { make in
            make.bottom.equalTo(passedRate)
            make.leading.equalTo(passedRate.snp.trailing).offset(5)
        }
        chevronRightBlack.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        backBonusView.snp.makeConstraints { make in
            make.top.equalTo(backWalletView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3)
        }
        
        bonusesView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview().inset(20)
        }
        bonusesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        bonusesRequirementLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusesLabel.snp.bottom).offset(5)
            make.leading.equalTo(bonusesLabel)
        }
        infoSymbol2.snp.makeConstraints { make in
            make.leading.equalTo(bonusesRequirementLabel.snp.trailing).offset(5)
            make.bottom.equalTo(bonusesRequirementLabel)
        }
        
        container1.snp.makeConstraints { make in
            make.top.equalTo(bonusesRequirementLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        giftSymbol1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        bonus1Label.snp.makeConstraints { make in
            make.top.equalTo(giftSymbol1.snp.bottom).offset(10)
            make.leading.equalTo(giftSymbol1).offset(3)
        }
        bonus1Button.snp.makeConstraints { make in
            make.top.equalTo(bonus1Label.snp.bottom).offset(10)
            make.leading.equalTo(giftSymbol1).offset(3)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        container2.snp.makeConstraints { make in
            make.leading.equalTo(container1.snp.trailing).offset(10)
            make.bottom.equalTo(container1)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        lock1Symbol.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        giftSymbol2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        bonus2Label.snp.makeConstraints { make in
            make.top.equalTo(lock1Symbol.snp.bottom).offset(10)
            make.leading.equalTo(lock1Symbol).offset(3)
        }
        bonus2DisableLabel.snp.makeConstraints { make in
            make.top.equalTo(bonus2Label.snp.bottom).offset(10)
            make.leading.equalTo(lock1Symbol).offset(3)
        }
        bonus2Button.snp.makeConstraints { make in
            make.top.equalTo(bonus2Label.snp.bottom).offset(10)
            make.leading.equalTo(lock1Symbol).offset(3)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        container3.snp.makeConstraints { make in
            make.leading.equalTo(container2.snp.trailing).offset(10)
            make.bottom.equalTo(container1)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview().multipliedBy(0.28)
        }
        lock2Symbol.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        giftSymbol3.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        bonus3Label.snp.makeConstraints { make in
            make.top.equalTo(lock2Symbol.snp.bottom).offset(10)
            make.leading.equalTo(lock2Symbol).offset(3)
        }
        bonus3DisableLabel.snp.makeConstraints { make in
            make.top.equalTo(bonus3Label.snp.bottom).offset(10)
            make.leading.equalTo(lock2Symbol).offset(3)
        }
        bonus3Button.snp.makeConstraints { make in
            make.top.equalTo(bonus3Label.snp.bottom).offset(10)
            make.leading.equalTo(lock2Symbol).offset(3)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        backCollectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(backBonusView.snp.bottom)
        }
        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
