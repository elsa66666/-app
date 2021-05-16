//
//  BillViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/5/16.
//

import UIKit
import ZHDropDownMenu
class BillViewController: UIViewController, ZHDropDownMenuDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var AllBillsView: UIView!
    @IBOutlet weak var datePicker: ZHDropDownMenu!
    
    @IBOutlet weak var statePicker: ZHDropDownMenu!
    @IBOutlet weak var fullView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        fullView.layer.cornerRadius = 20
        AllBillsView.layer.cornerRadius = 10
        AllBillsView.layer.shadowColor = #colorLiteral(red: 0.5655631423, green: 0.5984850526, blue: 0.9502983689, alpha: 1)
        AllBillsView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        AllBillsView.layer.shadowRadius = 3
        AllBillsView.layer.shadowOpacity = 1
        initDatePicker()
        initStatePicker()
        tableView.register(UINib(nibName: "BillTableViewCell", bundle: nil), forCellReuseIdentifier: "billCell")
        tableView.rowHeight = 130
    }
    

    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func initDatePicker () {
        datePicker.options = ["全部日期","近7天","近1个月","近3个月","近一年"]//设置下拉列表项数据
        datePicker.defaultValue = "全部日期" //设置默认值
        datePicker.editable = false //禁止编辑
        datePicker.showBorder = false //不显示边框
        datePicker.delegate = self //设置代理
    }
    
    func initStatePicker () {
        statePicker.options = ["全部状态","面签中","批复中","申请中","审批中", "抵押中", "放款中"]
        statePicker.defaultValue = "全部状态"
        statePicker.editable = false
        statePicker.showBorder = false
        statePicker.delegate = self
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu, didEdit text: String) {
        print("\(menu) input text \(text)")
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu, didSelect index: Int) {
        print("\(menu) choosed at index \(index)")
    }
    
}

extension BillViewController : UITableViewDelegate {
    
}
extension BillViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "billCell", for: indexPath) as! BillTableViewCell
        if indexPath.row < 9 {
            cell.seperateLine.isHidden = false
        }
        if indexPath.row == 9 {
            cell.seperateLine.isHidden = true
        }
        return cell
    }
    
    
}
