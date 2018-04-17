//
//  JTabbarController.swift
//  Joking_demo
//
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 www.rucdm.com. All rights reserved.
//

import UIKit

class JTabbarController: UITabBarController {
    
    var myTabbar : UIView?
    var sliderView : UIView?
    let btnBGColor:UIColor = UIColor(red:125/255.0,green:236/255.0,blue:198/255.0,alpha:1)
    let tabbarBGC = UIColor(red:251/255.0,green:173/255.0,blue:69/255.0,alpha:1)
    let titleColor:UIColor =  UIColor(red:52/255.0, green:156/255.0,blue:150/255.0,alpha: 1)

    let titleArr = ["最新","热门","真相","我"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addVC()
        
    }
    
    func setupViews(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
        self.tabBar.isHidden = true
        let swidth = UIScreen.main.bounds.size.width
        let sheight = self.view.frame.size.height
        
        self.myTabbar = UIView(frame: CGRect(x: 0, y: sheight-49, width: swidth, height: 49))
        self.myTabbar!.backgroundColor = tabbarBGC
        self.sliderView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 49))
        self.sliderView!.backgroundColor = UIColor.white
        self.myTabbar!.addSubview(self.sliderView!)
        
        self.view.addSubview(self.myTabbar!)
        
        let count = self.titleArr.count
        
        for i in 0..<count{
            let btnWith = (CGFloat)(swidth/4)
            let btnX = (btnWith*(CGFloat)(i))
            let button = UIButton(type: UIButtonType.custom)
            button.frame = CGRect(x: btnX, y: 0, width: btnWith, height: 49)
            button.tag = 100 + i
            button.setTitle(self.titleArr[i], for:.normal)
            button.setTitleColor(UIColor.white, for: UIControlState())
            button.setTitleColor(tabbarBGC, for: UIControlState.selected)
            
            button.addTarget(self, action:#selector(JTabbarController.tapped(button:)), for:.touchUpInside)
            self.myTabbar!.addSubview(button)
            
            if i == 0 {
                button.isSelected = true
            }
        }
    }
    
    
    @objc func tapped(button:UIButton) {
    
        let index = button.tag
        
        for i in 0 ..< 4 {
            let butn = self.view.viewWithTag(i+100) as! UIButton
            if butn.tag == index {
                butn.isSelected = true
            }else{
                butn.isSelected = false
            }
        }
        
        let swith = UIScreen.main.bounds.size.width
        let btnWith = (CGFloat)(swith/4)
        UIView .animate(withDuration: 0.3) {
            self.sliderView!.frame = CGRect(x: CGFloat(index-100)*btnWith, y: 0, width: btnWith, height: 49)
        }
        
        self.title = titleArr[index - 100] as String
        self.selectedIndex = index-100 // 改变vc
    
    }
    

    func addVC() {
        let vc1 = FirstViewController()
        let vc2 = SECViewController()
        let vc3 = THIRViewController()
        let vc4 = MYViewController()
        self.viewControllers = [vc1,vc2,vc3,vc4]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
