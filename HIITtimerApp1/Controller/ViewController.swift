//
//  ViewController.swift
//  HIITtimerApp1
//
//  Created by Keita Arai on 2020/05/24.
//  Copyright © 2020 Keita Arai. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var menuText: UITextField!
    @IBOutlet weak var menuText2: UITextField!
    @IBOutlet weak var menuText3: UITextField!
    
    var pickerView = UIPickerView()
    var pickerView2 = UIPickerView()
    var pickerView3 = UIPickerView()
    
    var list: [String] = ["バーピー", "マウンテンクライマー", "ジャンピングジャック", "ジャンピングスクワット"]
    
    var menu:Bool!
    var menu2:Bool!
    var menu3:Bool!
    var menu4:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        pickerView3.delegate = self
        pickerView3.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        
        let toolbar2 = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        
        let toolbar3 = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        let spacelItem2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done2))
        toolbar2.setItems([spacelItem2, doneItem2], animated: true)
        
        
        let spacelItem3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem3 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done3))
        toolbar3.setItems([spacelItem3, doneItem3], animated: true)
        
        menuText.inputView = pickerView
        menuText.inputAccessoryView = toolbar
        
        menuText2.inputView = pickerView2
        menuText2.inputAccessoryView = toolbar2
        
        menuText3.inputView = pickerView3
        menuText3.inputAccessoryView = toolbar3
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    
    @objc func done() {
        
        menuText.endEditing(true)
        menuText.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
        
    }
    
    
    @objc func done2(){
        
        menuText2.endEditing(true)
        menuText2.text = "\(list[pickerView2.selectedRow(inComponent: 0)])"
        
    }
    
    
    
    @objc func done3(){
        
        menuText3.endEditing(true)
        menuText3.text = "\(list[pickerView3.selectedRow(inComponent: 0)])"
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        list.sort()
        
        if menu == false{
            
            if list.contains("バーピー") == true{
                
                let index = list.firstIndex(of: "バーピー")
                if let index = index{
                    
                    list.remove(at: index)
                    
                }
                
            }
            
        }else if menu == true{
            
            if list.contains("バーピー") == false{
                
                list.insert("バーピー", at: 0)
                
            }
            
        }
        
        if menu2 == false{
            
            if list.contains("マウンテンクライマー") == true{
                
                let index = list.firstIndex(of: "マウンテンクライマー")
                if let index = index{
                    
                    list.remove(at: index)
                    
                }
                
                
            }
            
        }else if menu2 == true{
            
            if list.contains("マウンテンクライマー") == false{
                
                list.insert("マウンテンクライマー", at: 0)
                
            }
        }
        
        if menu3 == false{
            
            if list.contains("ジャンピングジャック") == true{
                
                let index = list.firstIndex(of: "ジャンピングジャック")
                if let index = index{
                    
                    list.remove(at: index)
                    
                }
                
            }
            
        }else if menu3 == true{
            
            if list.contains("ジャンピングジャック") == false{
                
                list.insert("ジャンピングジャック", at: 0)
                
            }
        }
        
        if menu4 == false{
            
            if list.contains("ジャンピングスクワット") == true{
                
                let index = list.firstIndex(of: "ジャンピングスクワット")
                if let index = index{
                    
                    list.remove(at: index)
                    
                }
                
            }
        }else if menu4 == true{
            
            if list.contains("ジャンピングスクワット") == false{
                
                list.insert("ジャンピングスクワット", at: 0)
                
            }
        }
        
    }
    
    
}




