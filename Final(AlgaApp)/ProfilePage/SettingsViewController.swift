//
//  SettingsViewController.swift
//  Final(AlgaApp)
//
//  Created by Yernur Adilbek on 12/1/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let headers = ["Profile", "General"]
    
    let icons = ["person.circle", "arrow.up.message", "gift", "doc.text", "shield", "questionmark.bubble.fill", "globe"]
    
    let titles = ["Personal data", "Invite friend", "Activate promo", "Terms of use", "Privacy policy", "Support", "Interface language"]
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private lazy var labelsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var deleteLabel: UILabel = {
        let label = UILabel()
        label.text = "Delete profile"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Application version 1.2.6.87"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .systemGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupUI()
        
        title = "Settings"
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.08
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 4
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        var index: Int

        switch indexPath.section {
        case 0:
            index = indexPath.row
        case 1:
            index = indexPath.row + 3
        default:
            fatalError("Unexpected section")
        }
        
        cell.configure(icons: icons[index], title: titles[index])
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white

        let label = UILabel()
        label.text = headers[section]
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        headerView.addSubview(label)

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }

        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - setting iui methods
private extension SettingsViewController{
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(tableView)
        
        view.addSubview(labelsView)
        labelsView.addSubview(deleteLabel)
        labelsView.addSubview(versionLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.77)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        labelsView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        deleteLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }
}

