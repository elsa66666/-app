//
//  CollectionViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/16.
//

import UIKit
import ZHDropDownMenu
class CollectionViewController: UIViewController, ZHDropDownMenuDelegate {
    func dropDownMenu(_ menu: ZHDropDownMenu, didEdit text: String) {
        print("\(menu) input text \(text)")
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu, didSelect index: Int) {
        print("\(menu) choosed at index \(index)")
    }
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var collectionTableView: UITableView!
    @IBOutlet weak var straightCarTableView: UITableView!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var straightCarView: UIView!
    @IBOutlet weak var collectionLine: UIView!
    @IBOutlet weak var straightCarLine: UIView!
    
    @IBOutlet weak var paybackMenu: ZHDropDownMenu!
    @IBOutlet weak var bankMenu: ZHDropDownMenu!
    @IBOutlet weak var amountMenu: ZHDropDownMenu!
    @IBOutlet weak var circleMenu: ZHDropDownMenu!
    @IBOutlet weak var interestRateMenu: ZHDropDownMenu!
    let arr = [3,4]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchView.layer.cornerRadius = 15
        straightCarLine.layer.cornerRadius = 1
        collectionLine.layer.cornerRadius = 1
        // 显示直通车
        collectionLine.isHidden = true
        collectionView.isHidden = true
        straightCarView.isHidden = false
        straightCarLine.isHidden = false
        // table view 初始化
        straightCarTableView.register(UINib(nibName: "straightCarTableViewCell", bundle: nil), forCellReuseIdentifier: "straightCarCell")
        collectionTableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionCell")
        //下拉菜单初始化
        initDropDownOptions()
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
    
    func initDropDownOptions () {
        paybackMenu.options = []//设置下拉列表项数据
        paybackMenu.defaultValue = "" //设置默认值
        paybackMenu.editable = false //禁止编辑
        paybackMenu.showBorder = true //显示边框
        paybackMenu.delegate = self //设置代理
        
    }


}
extension CollectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == straightCarTableView {
            if indexPath.row == 0 {
                return 50
            }
            if indexPath.row < arr[indexPath.section] - 1 {
                return 130
            }else{
                return 160
            }
        }else{
            return 153
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == straightCarTableView {
            return 2
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == straightCarView {
            return arr[section]
        }else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == straightCarTableView {
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
        }else{
            let cell = collectionTableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            return cell
        }
    }
}

extension CollectionViewController: UITableViewDelegate{
    
}
