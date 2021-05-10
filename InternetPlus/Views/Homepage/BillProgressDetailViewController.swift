//
//  BillProgressDetailViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/10.
//

import UIKit

class BillProgressDetailViewController: UIViewController {

    @IBOutlet weak var tableView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell", bundle: Bundle(for: TimelineTableViewCell.self))
        tableView1.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
        tableView1.rowHeight = 230
    }
    
    var data = [
        ["date":"12-18", "operation":"放款中", "submitTime":"等待放款完成"],
        ["date":"12-17", "operation":"抵押已完结", "submitTime":"2020.12.17 14:32"],
        ["date":"12-15", "operation":"公证已完结", "submitTime":"2020.12.15 14:32"],
        ["date":"12-12", "operation":"银行审批已通过", "submitTime":"2020.12.12 14:32"],
        ["date":"12-10", "operation":"面签已完结", "submitTime":"2020.12.10 14:32"]
    ]
    
    
    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BillProgressDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        cell.dateLabel.text = data[indexPath.row]["date"]
        cell.operationTitle.text = data[indexPath.row]["operation"]
        cell.submitTimeLabel.text = data[indexPath.row]["submitTime"]
        if indexPath.row == 0{
            cell.stateImage.image = UIImage(named: "进行中")
            cell.timelineLineView.layer.backgroundColor = #colorLiteral(red: 0.5639399886, green: 0.5895500183, blue: 0.9756222367, alpha: 1)
            cell.operateButton.layer.backgroundColor = #colorLiteral(red: 0.8382847905, green: 0.8433461785, blue: 0.843112886, alpha: 1)
            cell.operateButton.setTitle("等待上传", for: .normal)
        }else if indexPath.row < (data.count - 1){
            cell.stateImage.image = UIImage(systemName: "checkmark.circle")
            cell.timelineLineView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.operateButton.layer.backgroundColor = #colorLiteral(red: 0.1269272566, green: 0.2318550944, blue: 0.6926940084, alpha: 1)
            cell.operateButton.setTitle("查看附件", for: .normal)
        }else{
            cell.stateImage.image = UIImage(systemName: "checkmark.circle")
            cell.timelineLineView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.operateButton.layer.backgroundColor = #colorLiteral(red: 0.1269272566, green: 0.2318550944, blue: 0.6926940084, alpha: 1)
            cell.operateButton.setTitle("查看附件", for: .normal)
        }
        
        return cell
    }
    
    
}

