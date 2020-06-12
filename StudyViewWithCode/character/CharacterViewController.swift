//
//  ViewController.swift
//  StudyViewWithCode
//
//  Created by Fabio Lindemberg on 11/06/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    var mainView: UIView!
    var stackView: UIStackView!
    var presenter: CharacterPresenter?
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        createStackView()
        createTableView()
        
        presenter = CharacterPresenter(delegate: self)
    }
    
    func createTableView() {
        tableView = UITableView()
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
        tableView.showsVerticalScrollIndicator = false
        
        stackView.addArrangedSubview(tableView)
    }
    
    private func createMainView() {
        mainView = UIView()
        
        self.view.addSubview(mainView)
        mainView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.view.layoutMarginsGuide  
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        if #available(iOS 11, *) {
            let safeArea = self.view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                mainView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                mainView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                mainView.topAnchor.constraint(equalTo: margins.topAnchor),
                mainView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
            ])
        }
    }
    
    private func createStackView() {
        stackView = UIStackView()
        
        self.view.addSubview(stackView)
        stackView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        if #available(iOS 11, *) {
            let safeArea = self.view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: margins.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
            ])
        }
    }
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.characters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CharacterCell
        
        cell.load(character: presenter!.characters[indexPath.row])
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CharacterViewController: CharacterPresenterDelegate {
    func loadData() {
        tableView.reloadData()
    }
    
    func loadDataFail(message: String) {
        print(message)
    }
}

