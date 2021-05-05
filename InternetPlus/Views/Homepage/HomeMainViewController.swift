//
//  HomeMainViewController.swift
//  InternetPlus
//
//  Created by Elsa Shaw on 2021/4/15.
//

import UIKit
import ZKCycleScrollView_Swift
import CHIPageControl
class HomeMainViewController: UIViewController{
    @IBOutlet weak var SearchTextField: UITextField!
    @IBOutlet weak var SearchTextView: UIView!
    @IBOutlet weak var MainPartView: UIView!
    @IBOutlet weak var FunctionPartView: UIView!
    @IBOutlet weak var MoreView: UIView!
    

    //注意在storyboard上面要连datasource和delegate
    @IBOutlet weak var imageCycleScrollView: ZKCycleScrollView!
    @IBOutlet weak var recommendTableView: UITableView!
    @IBOutlet weak var hotProductTableView: UITableView!
    
    
    
    
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let imageCellId = "ImageCell"
    
    lazy var imageNamesArray: [String] = {
        let imageNamesArray = ["轮播图", "轮播图", "轮播图"]
        return imageNamesArray
    }()
    
    lazy var pageControl: CHIPageControlJaloro = {
        let pageControl = CHIPageControlJaloro()
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCornersForViews()
        initBanner()
        
        recommendTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: Constant.recommendCellIdentifier)
        hotProductTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: Constant.hotProductCellIdentifier)
    }
    
    func initCornersForViews() {
        SearchTextView.layer.cornerRadius = 14
        imageCycleScrollView.layer.cornerRadius = 10
        MainPartView.layer.cornerRadius = 20
        
        FunctionPartView.layer.cornerRadius = 10
        FunctionPartView.layer.shadowColor = #colorLiteral(red: 0.5655631423, green: 0.5984850526, blue: 0.9502983689, alpha: 1)
        FunctionPartView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        FunctionPartView.layer.shadowRadius = 3
        FunctionPartView.layer.shadowOpacity = 1
        
        MoreView.isHidden = true
        MoreView.layer.cornerRadius = 10
        MoreView.layer.shadowColor = #colorLiteral(red: 0.5655631423, green: 0.5984850526, blue: 0.9502983689, alpha: 1)
        MoreView.layer.shadowOffset = CGSize.init(width: 2, height: 2)
        MoreView.layer.shadowRadius = 3
        MoreView.layer.shadowOpacity = 1
    }
    
    func initBanner() {
        // 2.xib方式创建图片轮播
        imageCycleScrollView.itemSize = CGSize(width: imageCycleScrollView.bounds.width, height: imageCycleScrollView.bounds.height)
        imageCycleScrollView.register(UINib(nibName: imageCellId, bundle: nil), forCellWithReuseIdentifier: imageCellId)
        
        // 设置默认显示页
        imageCycleScrollView.loadCompletion = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.imageCycleScrollView.scrollToItem(at: 0, animated: false)
        }
        
        // 自定义 PageControl
        pageControl.radius = 3.0
        pageControl.padding = 8.0
        pageControl.inactiveTransparency = 0.8 // 未命中点的不透明度
        pageControl.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pageControl.currentPageTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        view.addSubview(pageControl)
    }
    @IBAction func onMoreButtonPressed(_ sender: Any) {
        MoreView.isHidden = !MoreView.isHidden
    }
}

extension HomeMainViewController: ZKCycleScrollViewDelegate {
    
    func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, didSelectItemAt index: Int) {
        print("selected index: \(index)")
        
    }
    
    func cycleScrollViewDidScroll(_ cycleScrollView: ZKCycleScrollView, progress: Double) {
        
    }
    
    func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, didScrollFromIndex fromIndex: Int, toIndex: Int) {
        guard cycleScrollView === imageCycleScrollView else { return }
        //print("from: \(fromIndex) to: \(toIndex)")
    }
}

extension HomeMainViewController: ZKCycleScrollViewDataSource {
    
    func numberOfItems(in cycleScrollView: ZKCycleScrollView) -> Int {
        return imageNamesArray.count
    }
    
    func cycleScrollView(_ cycleScrollView: ZKCycleScrollView, cellForItemAt index: Int) -> ZKCycleScrollViewCell {
        let cell = cycleScrollView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: index) as! ImageCell
        cell.imageView.image = UIImage(named: imageNamesArray[index])
        return cell
        
    }
}

extension HomeMainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recommendTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.recommendCellIdentifier, for: indexPath) as! ProductCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.hotProductCellIdentifier, for: indexPath) as! ProductCell
            
            return cell
        }
    }
}

extension HomeMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
