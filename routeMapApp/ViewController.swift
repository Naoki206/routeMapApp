//
//  ViewController.swift
//  routeMapApp
//
//  Created by 鎌塚直己 on 2020/04/29.
//  Copyright © 2020 鎌塚直己. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var areaArray = ["北海道・東北地方", "北陸地方", "関東地方", "甲信・東海地方", "関西地方", "中国地方", "四国地方", "九州地方"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = areaArray[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/6
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //遷移先のviewControllerを変数に格納
        let secondVC = storyboard?.instantiateViewController(identifier: "second") as! SecondViewController

        //受け渡す
        navigationController?.pushViewController(secondVC, animated: true)

        //この時、遷移先に定義されている変数にデータの格納もできる。
        secondVC.prefectureString = areaArray[indexPath.row]
    }
    
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //リターンキーを押した時にキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //キーボードが閉じるよ
        textField.resignFirstResponder()
        return true
    }
}

