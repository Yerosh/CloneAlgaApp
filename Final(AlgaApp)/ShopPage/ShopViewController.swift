//
//  ShopViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/25/23.
//

import UIKit

class ShopViewController: UIViewController{

    private lazy var walletView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 4/255, green: 157/255, blue: 245/255, alpha: 1)
        view.layer.cornerRadius = 13
        return view
    }()
    
    private lazy var walletIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "walletIcon"))
        imageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageView.tintColor = .white
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "91.00"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    let topItems = ["Все", "Популярные", "Скидки", "Промокоды", "Товары", "Услуги"]
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var selectedCategory = "Все"
    
    private lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "topCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let allItemsImage = ["abchess","airpods","earpods","greentrip","hoco","lamoda","lumiere","mistermo","powerbank","profiletm","ps5","razor","scale","sezim","sonyBlack","sonyWhite","squarespass","ticket","tillywilly","wolt","xiomi","yandexSt","yogoland10","yogoland15","yogoland20"]
    let likes = ["458","22K","2.16K","65","1.33K","137","194","110","3.07K","152","19K","1.73K","2.07K","566","4.5K","5.28K","287","2.67K","251","1.8K","3.52K","10.8K","257","214","135"]
    let itemsName = ["Курсы по шахматам (промокод на 1 мес)", "Apple AirPods Pro","Xiomi Redmi Buds 3 Lite","Скидка 2% на горящие туры в Green Trip!","Подставка Hoco PH34 черная","Скидка 15% для Lamoda","Скидка 30% на билеты в Lumiere Hall Алматы","Скидка 15% на питание mister MO","Пауэрбэнк Xiomi Redmi черный","Скидка 10% на покупку тонометра Profile","Sony Playstation 5 с дисководом","Электробритва Xiomi","Напольные весы Xiaomi","Скидка 30% на сессию с психологом","Электрическая щетка Sonic K200 Black","Электрическая щетка Sonic K200  White", "Скидка 20% на Squares Pass","Два билета в кино", "20% скидка на минисад Tilly Willy Астана", "Промокод от Wolt на 1500 тг для новых пользователей", "Увлажнитель воздуха Xiaomi", "Яндекс Станция Лайт", "Скидка 10% на Квадра-йогу Онлайн/Офлайн","Скидка 15% на Квадра-йогу Онлайн/Офлайн","Скидка 20% на Квадра-йогу Онлайн/Офлайн"]
    let itemStatus = ["Out of stock","Out of stock","Out of stock","Out of stock","Out of stock","Out of stock","Out of stock","Out of stock","Out of stock","Awaiting receipt","Out of stock","Out of stock","Out of stock","50.00 TER","Out of stock","Out of stock","Out of stock","Out of stock","300.00 TER", "Out of stock","Out of stock","Out of stock","50.00 TER","100.00 TER","150.00 TER"]
    let itemPcs = ["0 of 200 pcs left.","0 of 1 pcs left.","0 of 14 pcs left.","0 of 30 pcs left.","0 of 2 pcs left.","0 of 300 pcs left.","0 of 40 pcs left.","0 of 30 pcs left.","0 of 14 pcs left.","","0 of 1 pcs left.","0 of 6 pcs left.","0 of 6 pcs left.","297 of 900 pcs left.","0 of 34 pcs left.","0 of 34 pcs left.","0 of 100 pcs left.","0 of 15 pcs left.","6 of 10 pcs left.","0 of 1498 pcs left.","0 of 5 pcs left.","0 of 11 pcs left.","10 of 100 pcs left.","36 of 50 pcs left.","35 of 50 pcs left."]
    
    let popularImg = ["airpods", "earpods", "powerbank", "ps5", "scale", "sonyBlack", "sonyWhite", "ticket", "xiomi", "yandexSt"]
    let popularLikes = ["22K", "2.16K", "3.07K", "19K", "2.07K", "4.5K", "5.28K", "2.67K", "3.52K", "10.8K"]
    let popularName = ["Apple AirPods Pro", "Xiomi Redmi Buds 3 Lite", "Пауэрбэнк Xiomi Redmi черный", "Sony Playstation 5 с дисководом", "Напольные весы Xiaomi", "Электрическая щетка Sonic K200 Black", "Электрическая щетка Sonic K200  White", "Два билета в кино", "Увлажнитель воздуха Xiaomi", "Яндекс Станция Лайт"]
    let popularStatus = ["Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock"]
    let popularPcs = ["0 of 1 pcs left.", "0 of 14 pcs left.", "0 of 14 pcs left.", "0 of 1 pcs left.", "0 of 6 pcs left.", "0 of 34 pcs left.", "0 of 34 pcs left.", "0 of 15 pcs left.", "0 of 5 pcs left.", "0 of 11 pcs left."]
    
    let discountImg = ["greentrip", "lamoda", "lumiere", "mistermo", "profiletm", "sezim", "squarespass", "tillywilly", "wolt", "yogoland10", "yogoland15", "yogoland20"]
    let disountLikes = ["65", "137", "194", "110", "152", "566", "287", "251", "1.8K", "257", "214", "135"]
    let discountName = ["Скидка 2% на горящие туры в Green Trip!", "Скидка 15% для Lamoda", "Скидка 30% на билеты в Lumiere Hall Алматы", "Скидка 15% на питание mister MO", "Скидка 10% на покупку тонометра Profile", "Скидка 30% на сессию с психологом", "Скидка 20% на Squares Pass", "20% скидка на минисад Tilly Willy Астана", "Промокод от Wolt на 1500 тг для новых пользователей", "Скидка 10% на Квадра-йогу Онлайн/Офлайн", "Скидка 15% на Квадра-йогу Онлайн/Офлайн", "Скидка 20% на Квадра-йогу Онлайн/Офлайн"]
    let discountStatus = ["Out of stock", "Out of stock", "Out of stock", "Out of stock", "Awaiting receipt", "50.00 TER", "Out of stock", "300.00 TER", "Out of stock", "50.00 TER", "100.00 TER", "150.00 TER"]
    let discountPcs = ["0 of 30 pcs left.", "0 of 300 pcs left.", "0 of 40 pcs left.", "0 of 30 pcs left.", "", "297 of 900 pcs left.", "0 of 100 pcs left.", "6 of 10 pcs left.", "0 of 1498 pcs left.", "10 of 100 pcs left.", "36 of 50 pcs left.", "35 of 50 pcs left."]
    
    let promoImg = ["wolt"]
    let promoLikes = ["1.8K"]
    let promoName = ["Промокод от Wolt на 1500 тг для новых пользователей"]
    let promoStatus = ["Out of stock"]
    let promoPcs = ["0 of 1498 pcs left."]
    
    let productImg = ["airpods", "earpods", "hoco", "powerbank", "ps5", "razor", "scale", "sonyBlack", "sonyWhite", "xiomi", "yandexSt"]
    let productLikes = ["22K", "2.16K", "1.33K", "3.07K", "19K", "1.73K", "2.07K", "4.5K", "5.28K", "3.52K", "10.8K"]
    let productName = ["Apple AirPods Pro", "Xiomi Redmi Buds 3 Lite", "Подставка Hoco PH34 черная", "Пауэрбэнк Xiomi Redmi черный", "Sony Playstation 5 с дисководом", "Электробритва Xiomi", "Напольные весы Xiaomi", "Электрическая щетка Sonic K200 Black", "Электрическая щетка Sonic K200  White", "Увлажнитель воздуха Xiaomi", "Яндекс Станция Лайт"]
    let productStatus = ["Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock", "Out of stock"]
    let productPcs = ["0 of 1 pcs left.", "0 of 14 pcs left.", "0 of 2 pcs left.", "0 of 14 pcs left.", "0 of 1 pcs left.", "0 of 6 pcs left.", "0 of 6 pcs left.", "0 of 34 pcs left.", "0 of 34 pcs left.", "0 of 5 pcs left.", "0 of 11 pcs left."]
    
    let serviceImg = ["abchess"]
    let serviceLikes = ["458"]
    let serviceName = ["Курсы по шахматам (промокод на 1 мес)"]
    let serviceStatus = ["Out of stock"]
    let servicePcs = ["0 of 200 pcs left."]
    
    

    
    private lazy var itemsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: "itemsCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
    }
}

extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollectionView {
            return topItems.count
        } else if collectionView == itemsCollectionView {
            switch selectedCategory {
            case "Все":
                return allItemsImage.count
            case "Популярные":
                return popularImg.count
            case "Скидки":
                return discountImg.count
            case "Промокоды":
                return promoImg.count
            case "Товары":
                return productImg.count
            case "Услуги":
                return serviceImg.count
            default:
                return 0
            }
        }

        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath)
            configureCell(cell, at: indexPath)
            cell.layer.cornerRadius = 15
            return cell
        } else if collectionView == itemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemsCell", for: indexPath) as! ItemsCollectionViewCell
            
            switch selectedCategory {
            case "Все":
                cell.configure(image: allItemsImage[indexPath.item], likes: likes[indexPath.item], name: itemsName[indexPath.item], status: itemStatus[indexPath.item], pcs: itemPcs[indexPath.item])
            case "Популярные":
                cell.configure(image: popularImg[indexPath.item], likes: popularLikes[indexPath.item], name: popularName[indexPath.item], status: popularStatus[indexPath.item], pcs: popularPcs[indexPath.item])
            case "Скидки":
                cell.configure(image: discountImg[indexPath.item], likes: disountLikes[indexPath.item], name: discountName[indexPath.item], status: discountStatus[indexPath.item], pcs: discountPcs[indexPath.item])
            case "Промокоды":
                cell.configure(image: promoImg[indexPath.item], likes: promoLikes[indexPath.item], name: promoName[indexPath.item], status: promoStatus[indexPath.item], pcs: promoPcs[indexPath.item])
            case "Товары":
                cell.configure(image: productImg[indexPath.item], likes: productLikes[indexPath.item], name: productName[indexPath.item], status: productStatus[indexPath.item], pcs: productPcs[indexPath.item])
            case "Услуги":
                cell.configure(image: serviceImg[indexPath.item], likes: serviceLikes[indexPath.item], name: serviceName[indexPath.item], status: serviceStatus[indexPath.item], pcs: servicePcs[indexPath.item])
            default:
                break
            }
            
            cell.layer.cornerRadius = 15
            cell.clipsToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    private func configureCell(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let label = UILabel()
        label.text = topItems[indexPath.item]
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])

        if indexPath == selectedIndexPath {
            cell.layer.borderColor = CGColor(red: 0, green: 172/255, blue: 1, alpha: 1)
            label.textColor = .black
        } else {
            cell.layer.borderColor = UIColor.gray.cgColor
            label.textColor = .gray
        }
        
        cell.layer.borderWidth = 1.5
    }
}

extension ShopViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topCollectionView {
            let itemText = topItems[indexPath.item]
            let size = (itemText as NSString).size(withAttributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0)
            ])

            let cellWidth = size.width + 40.0
            let cellHeight = collectionView.frame.height
            return CGSize(width: cellWidth, height: cellHeight)
        } else if collectionView == itemsCollectionView {
            return CGSize(width: view.window!.windowScene!.screen.bounds.width * 0.43 , height: view.window!.windowScene!.screen.bounds.height * 0.3)
        }

        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
        
        selectedIndexPath = indexPath
        selectedCategory = topItems[indexPath.item]
        itemsCollectionView.reloadData()
    }
}

// MARK: - setting iui methods
private extension ShopViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(walletView)
        
        walletView.addSubview(walletIcon)
        walletView.addSubview(balanceLabel)
        
        view.addSubview(topCollectionView)
        
        view.addSubview(itemsCollectionView)
    }
    
    func setupConstraints() {
        walletView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-10)
            make.height.equalToSuperview().multipliedBy(0.03)
            make.width.equalToSuperview().multipliedBy(0.17)
        }
        walletIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.centerY.equalToSuperview()
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(walletIcon.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
        }
        
        topCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        itemsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}
