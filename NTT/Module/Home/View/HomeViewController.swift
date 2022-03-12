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
    @IBOutlet weak var homeTitle: UILabel!
    var offset = 10
    
    let presenter = HomePresenter()
    var postData = [PostModel]()
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        getDataByOffset(offset: offset, isLoadMore: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupView() {
        
        presenter.getUser { user in
            
            self.homeTitle.text = "Post by \(user.username)"
        }
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib.init(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        
        activityIndicator.hidesWhenStopped = true
        
        
    }
    
    func getDataByOffset(offset: Int, isLoadMore: Bool) {
        
        print("called")
        
        activityIndicator.startAnimating()
        
        presenter.getPost(vc: self, offset: offset) { post in
            
            self.activityIndicator.stopAnimating()
            
            if post == self.postData {
                
                AlertHelper.infoMsg(msg: "no fresh data found")
                
                return
                
            } else {
                
                self.postData = post
            }
            
            DispatchQueue.main.async {
                
                self.isLoading = false
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = postData[indexPath.row]
        
        presenter.gotoDetail(postData: data)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height){
            loadMore()
            
        }
    }
    
    
    func loadMore() {
        
        if !self.isLoading {
            self.isLoading = true
            
            offset += 10
            print(offset)
            
            getDataByOffset(offset: offset, isLoadMore: true)
            
        }
        
    }
    
    
}

