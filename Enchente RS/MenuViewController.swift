//
//  MenuViewController.swift
//  Enchente RS
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import Foundation
import UIKit
import Combine

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.shelters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = shelters[indexPath.row].name
        
        return cell
    }
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .insetGrouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)

        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
    
    private var subscriptions = Set<AnyCancellable>()
    
    var service = ShelterService()
    
    var shelters: [Shelter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Cadastrar local"
        
        self.view.addSubview(self.tableView)
        
        self.service.fetchShelters()
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] shelters in
                print(shelters)
                self?.shelters = shelters
                self?.tableView.reloadData()
            })
            .store(in: &subscriptions)
    }
}

