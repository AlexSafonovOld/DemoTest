//
//  TViewController.swift
//  GitRepository
//
//  Created by Алексей Сафонов on 26.09.2020.
//

import UIKit

class TViewController: UIViewController {
    
    
    private let networkManager = Networking()
    private var viewModel = GitDataViewModel()
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var username = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.backItem?.title = ""
        self.indicator.startAnimating()
        self.indicator.hidesWhenStopped = true
        self.table.delegate = self
        self.table.dataSource = self
        
        self.networkManager.getInfoAboutRepo(self.username) { (result) in
            switch result {
            case .success(let info):
                self.viewModel.repoInfo = info
                DispatchQueue.main.async {
                    self.table.reloadData()
                    self.indicator.stopAnimating()
                    self.table.tableFooterView = UIView()
                }
                
            case .failure(_):
                DispatchQueue.main.async {
                    self.indicator.stopAnimating()
                    self.alet()
                }
            }
        }
        
    }
}




extension TViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOFRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! RepoTableViewCell
        
        let info = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellInfo(info)
        return cell
        
    }
    
    
}



extension TViewController {
    func alet() {
        let alertController = UIAlertController(title: "ERROR", message: "Error: account not found!", preferredStyle: .alert)
        let cacel = UIAlertAction(title: "OK", style: .destructive) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertController.addAction(cacel)
        present(alertController, animated: true, completion: nil)
    }
}

