//
//  MessageViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 11/25/23.
//
import SnapKit
import UIKit

class MessageViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    let icons = ["bag", "person.badge.plus", "person.2", "megaphone"]
    let iconsBack = [UIColor(red: 229/255, green: 246/255, blue: 1, alpha: 1),
                    UIColor(red: 232/255, green: 250/255, blue: 239/255, alpha: 1),
                    UIColor(red: 1, green: 241/255, blue: 231/255, alpha: 1),
                    UIColor(red: 254/255, green: 228/255, blue: 229/255, alpha: 1)]
    let cellTitle = ["Shop", "Friendship requests", "Friends Activity", "Application"]
    let cellSubtitle = ["Purchase Information", "Accept or deny requests", "Достижения и покупки", "News and notices"]
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: "MessageTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none 
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - TableView Configurations
extension MessageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.1
    }
}

extension MessageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        cell.configure(iconsBack: iconsBack[indexPath.row], icons: icons[indexPath.row], title: cellTitle[indexPath.row], subtitle: cellSubtitle[indexPath.row])
        cell.separatorView.isHidden = indexPath.row == icons.count - 1
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - setting iui methods
private extension MessageViewController {
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
