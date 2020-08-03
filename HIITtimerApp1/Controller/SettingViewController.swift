


import UIKit
import Eureka



class SettingViewController: FormViewController{
    
    var menuA:Bool = false
    var menuB:Bool = false
    var menuC:Bool = false
    var menuD:Bool = false
    var addMenu:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        form
            
            +++ Section("タイマー設定")
            <<< StepperRow(){row in
                row.title = "トレーニングタイム"
                row.value = 20
                
            }.onChange() { row in
                print(row.value as Any)}
            
            <<< StepperRow(){row in
                row.title = "休憩タイム"
                row.value = 10
                
            }.onChange() { row in
                print(row.value as Any)}
            
            
            +++ Section("メニューリスト")
            
            <<< SwitchRow(){ row in
                row.title = "バーピー"
                row.value = true
                self.menuA = row.value!
                
            }.onChange{[unowned self] row in
                self.menuA = row.value!
                print(self.menuA)
                if self.menuA == false{
                    
                    self.switchA()
                    
                }else{
                    self.switchA2()
                }
            }
            
            
            <<< SwitchRow(){ row in
                row.title = "マウンテンクライマー"
                row.value = true
                self.menuB = row.value!
            }.onChange{[unowned self] row in
                self.menuB = row.value!
                print(self.menuB)
                if self.menuB == false{
                    
                    self.switchB()
                    
                }else{
                    self.switchB2()
                }
            }
            
            
            <<< SwitchRow(){ row in
                row.title = "ジャンピングジャンプ"
                row.value = true
                self.menuC = row.value!
            }.onChange{[unowned self] row in
                self.menuC = row.value!
                print(self.menuC)
                if self.menuC == false{
                    
                    self.switchC()
                    
                }else{
                    self.switchC2()
                }
            }
            
            
            <<< SwitchRow(){ row in
                row.title = "ジャンピングスクワット"
                row.value = true
                self.menuD = row.value!
            }.onChange{[unowned self] row in
                self.menuD = row.value!
                print(self.menuD)
                if self.menuD == false{
                    //
                    self.switchD()
                    //
                }else{
                    self.switchD2()
                }
        }
        
        
    }
    
    func switchA(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu = false
            
        }
    }
    
    func switchA2(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu = true
            
        }
        
    }
    
    func switchB(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu2 = false
            
        }
    }
    
    func switchB2(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu2 = true
        }
    }
    
    func switchC(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu3 = false
            
        }
    }
    
    func switchC2(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu3 = true
        }
    }
    
    func switchD(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu4 = false
            
        }
    }
    
    func switchD2(){
        
        if let controller = tabBarController?.viewControllers?[0] as? ViewController{
            
            controller.loadViewIfNeeded()
            controller.menu4 = true
        }
    }
    
   
}
