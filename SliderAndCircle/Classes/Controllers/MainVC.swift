//
//  MainVC.swift
//  SliderAndCircle
//
//  Created by Tien on 2017/11/15.
//  Copyright © 2017年 Tien. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet var mainView: MainView!
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    var fanAAngle:CGFloat!
    var fanBAngle:CGFloat!
    var fanCAngle:CGFloat!
    var threeFanTotal:CGFloat = 0
    var fanALayer:CAShapeLayer!
    var fanBLayer:CAShapeLayer!
    var fanCLayer:CAShapeLayer!
    var centerPoint:CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWidth = self.mainView.bounds.width
        viewHeight = self.mainView.bounds.height
        centerPoint = CGPoint(x: viewWidth/2, y: viewHeight/2)
        upDateValue()
        draw()
        // Do any additional setup after loading the view.
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        fanALayer.removeFromSuperlayer()
        fanBLayer.removeFromSuperlayer()
        fanCLayer.removeFromSuperlayer()
        upDateValue()
        draw()
    }
    
    func draw(){
        let path = UIBezierPath()
        fanALayer = CAShapeLayer()
        fanBLayer = CAShapeLayer()
        fanCLayer = CAShapeLayer()
        var tempStartAngle:CGFloat!
        
        
        
        path.move(to: centerPoint)
        path.addArc(withCenter: centerPoint, radius: 100, startAngle: 0, endAngle: CGFloat(360*fanAAngle/threeFanTotal)*CGFloat(Double.pi/180), clockwise: true)
        path.close()
        tempStartAngle = CGFloat(360*fanAAngle/threeFanTotal)*CGFloat(Double.pi/180) //下一個起點是上一個終點
        fanALayer.path = path.cgPath
        fanALayer.fillColor = UIColor.blue.cgColor
        
        
        path.removeAllPoints()               //重要！！！！！！！！
        path.move(to: centerPoint)
        path.addArc(withCenter: centerPoint, radius: 100, startAngle: tempStartAngle, endAngle: tempStartAngle+CGFloat(360*fanBAngle/threeFanTotal)*CGFloat(Double.pi/180), clockwise: true)
        path.close()
        tempStartAngle = tempStartAngle+CGFloat(360*fanBAngle/threeFanTotal)*CGFloat(Double.pi/180)
        fanBLayer.path = path.cgPath
        fanBLayer.fillColor = UIColor.red.cgColor
        
        
        
        path.removeAllPoints()               //重要！！！！！！！！
        path.move(to: centerPoint)
        path.addArc(withCenter: centerPoint, radius: 100, startAngle: tempStartAngle, endAngle: tempStartAngle+CGFloat(360*fanCAngle/threeFanTotal)*CGFloat(Double.pi/180), clockwise: true)
        path.close()
        fanCLayer.path = path.cgPath
        fanCLayer.fillColor = UIColor.yellow.cgColor
        
        
        
        self.mainView.layer.addSublayer(fanALayer)
        self.mainView.layer.addSublayer(fanBLayer)
        self.mainView.layer.addSublayer(fanCLayer)
    }
    func upDateValue(){
        fanAAngle = CGFloat(self.mainView.Slider1.value)
        fanBAngle = CGFloat(self.mainView.Slider2.value)
        fanCAngle = CGFloat(self.mainView.Slider3.value)
        
        threeFanTotal = fanAAngle + fanBAngle + fanCAngle
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
