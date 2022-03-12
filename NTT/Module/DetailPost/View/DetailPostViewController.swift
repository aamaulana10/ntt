//
//  DetailPostViewController.swift
//  NTT
//
//  Created by aa maulana10 on 12/03/22.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    @IBOutlet weak var postContainer: UIView!
    @IBOutlet weak var lblPostTitle: UILabel!
    @IBOutlet weak var lblPostBody: UILabel!
    
    @IBOutlet weak var commentTable: UITableView!
    
    var dataPost: PostModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = false
    }
    func setupView() {
        
        self.title = "Detail Post"
        
        commentTable.delegate = self
        commentTable.dataSource = self
        
        commentTable.register(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        
        postContainer.customRoundedView(radius: 8, width: 0.5, color: .lightGray)
        
    }
    
    func setupData() {
        
        if let data = dataPost {
            
            lblPostTitle.text = data.title
            lblPostBody.text = data.body
            
            DispatchQueue.main.async {
                
                self.commentTable.reloadData()
            }
        }
        
    }

}

extension DetailPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataPost?.comment?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        
        if let data = dataPost?.comment {
            
            cell.setup(data: data[indexPath.row])
        }
        
        return cell
    }
    
    
    
}
