//
//  ToDoViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/6.
//

import UIKit

class ToDoViewController: UIViewController {

    @IBOutlet weak var infoCheckLine: UIView!
    
    @IBOutlet weak var billInfoLine: UIView!
    
    @IBOutlet weak var billProgressContentView: UIView!
    @IBOutlet weak var infoCheckContentView: UIView!
    @IBOutlet weak var billProgressTableView: UITableView!
    @IBOutlet weak var infoCheckTableView: UITableView!
    @IBAction func goBackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var infoCheckStateList = ["待完善", "申请中", "面签中", "已完成"]
    var billProgressStateList = ["审核中", "面签中"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billProgressContentView.isHidden = true
        infoCheckContentView.isHidden = false
        billInfoLine.isHidden =  true
        infoCheckLine.isHidden = false
        infoCheckTableView.register(UINib(nibName: "infoCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCheckReuseIdentifier")
        billProgressTableView.register(UINib(nibName: "infoCheckTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCheckReuseIdentifier")
        infoCheckTableView.rowHeight = 161
        billProgressTableView.rowHeight = 161
    }
    
    @IBAction func onInfoCheckButtonPressed(_ sender: Any) {
        billProgressContentView.isHidden = true
        infoCheckContentView.isHidden = false
        billInfoLine.isHidden =  true
        infoCheckLine.isHidden = false
    }
    
    @IBAction func onBillProgressButtonPressed(_ sender: Any) {
        billProgressContentView.isHidden = false
        infoCheckContentView.isHidden = true
        billInfoLine.isHidden =  false
        infoCheckLine.isHidden = true
    }
    
}

extension ToDoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == infoCheckTableView{  //资料审核
            performSegue(withIdentifier: "infoCheckDetail", sender: self)
        }else{ //订单进度
            performSegue(withIdentifier: "billProgressDetail", sender: self)
        }
    }
}

extension ToDoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == infoCheckTableView {
            return infoCheckStateList.count
        }else{
            return billProgressStateList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == infoCheckTableView { //资料审核
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCheckReuseIdentifier", for: indexPath) as! infoCheckTableViewCell
            cell.state.text = infoCheckStateList[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCheckReuseIdentifier", for: indexPath) as! infoCheckTableViewCell
            cell.state.text = billProgressStateList[indexPath.row] 
            return cell
        }
    }
    
    
}
