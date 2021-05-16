//
//  CollectionViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/16.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var straightCarTableView: UITableView!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var straightCarView: UIView!
    @IBOutlet weak var collectionLine: UIView!
    @IBOutlet weak var straightCarLine: UIView!
    
    let arr = [3,4]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        straightCarLine.layer.cornerRadius = 1
        collectionLine.layer.cornerRadius = 1
        // 显示直通车
        collectionLine.isHidden = true
        collectionView.isHidden = true
        straightCarView.isHidden = false
        straightCarLine.isHidden = false
        // table view 初始化
        straightCarTableView.register(UINib(nibName: "straightCarTableViewCell", bundle: nil), forCellReuseIdentifier: "straightCarCell")
    }
    
    @IBAction func showStraightCarView(_ sender: Any) {
        collectionLine.isHidden = true
        collectionView.isHidden = true
        straightCarView.isHidden = false
        straightCarLine.isHidden = false
    }
    @IBAction func showCollectionView(_ sender: Any) {
        collectionLine.isHidden = false
        collectionView.isHidden = false
        straightCarView.isHidden = true
        straightCarLine.isHidden = true
    }
    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension CollectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
        if indexPath.row < arr[indexPath.section] - 1 {
            return 130
        }else{
            return 160
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = straightCarTableView.dequeueReusableCell(withIdentifier: "straightCarCell", for: indexPath) as! straightCarTableViewCell
        if indexPath.row == 0 {
            cell.positionView.isHidden = true
            cell.headerView.isHidden = false
            cell.itemView.isHidden = true
            cell.itemBottomLine.isHidden = false
        }
        if indexPath.row > 0 {
            if indexPath.row < arr[indexPath.section]-1 {
                cell.positionView.isHidden = true
                cell.headerView.isHidden = true
                cell.itemView.isHidden = false
                cell.itemBottomLine.isHidden = false
            }
        }
        if indexPath.row == arr[indexPath.section]-1 {
            cell.positionView.isHidden = false
            cell.headerView.isHidden = true
            cell.itemView.isHidden = false
            cell.itemBottomLine.isHidden = true
        }
        return cell
    }
    
    
}

extension CollectionViewController: UITableViewDelegate{
    
}
