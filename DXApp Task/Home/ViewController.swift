//
//  ViewController.swift
//  DXApp Task
//
//  Created by Macbook Pro on 06/05/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableDataSource: [HomeTableViewCellModel] = [
        HomeTableViewCellModel(rowTitle: "ORDERS", rowIcon: Constants.AppIcons.orders),
        HomeTableViewCellModel(rowTitle: "HOW IT WORKS", rowIcon: Constants.AppIcons.workflow),
        HomeTableViewCellModel(rowTitle: "ABOUT US", rowIcon: Constants.AppIcons.aboutUs),
        HomeTableViewCellModel(rowTitle: "CONTACT US", rowIcon: Constants.AppIcons.contactUs)]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    
    private func setupUI() {
        tabBarView.layer.cornerRadius = 4
        tabBarView.layer.shadowColor = UIColor.gray.cgColor
        tabBarView.layer.shadowOffset = CGSize(width: 0.0, height : -2.0)
        tabBarView.layer.shadowOpacity = 0.2
        tabBarView.layer.shadowRadius = 2
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell {
            cell.configureRow(model: tableDataSource[indexPath.row], isEvenRow: indexPath.row%2 == 0)
            return cell
        } else {
            fatalError("Unable to fetch cell for home screen")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
