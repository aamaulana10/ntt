//
//  ViewController.swift
//  NTT
//
//  Created by aa maulana10 on 11/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var offset = 20
    
    let presenter = HomePresenter()
    var postData = [PostModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupView()
        
        getDataByOffset(offset: offset)
    }
    
    func setupView() {
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib.init(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        
        activityIndicator.hidesWhenStopped = true
    }
    
    func getDataByOffset(offset: Int) {
        
        activityIndicator.startAnimating()
        
        presenter.getPost(offset: offset) { post in

            self.postData = post
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                self.activityIndicator.stopAnimating()
                self.homeTableView.reloadData()
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = postData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        cell.setupData(data: data)
        
//        if indexPath.row == self.postData.count - 1 {
//            self.loadMore()
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = postData[indexPath.row]
        
        presenter.gotoDetail(postData: data)
    }
    
    func loadMore() {
        
        print("is last row")
        
        offset += 10
        
        print(offset)
        
        getDataByOffset(offset: offset)
    }
    
    
}

