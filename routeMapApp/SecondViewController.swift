//
//  SecondViewController.swift
//  routeMapApp
//
//  Created by 鎌塚直己 on 2020/04/29.
//  Copyright © 2020 鎌塚直己. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var prefectureString: String!
    
    var hokkaiAreaArray   = ["北海道", "福島", "青森", "秋田", "山形", "宮城", "岩手"]
    var hokurikuAreaArray = ["新潟", "石川", "富山", "福井"]
    var kantoAreaArray    = ["埼玉", "神奈川", "千葉", "東京", "栃木", "茨城", "群馬"]
    var tokaiAreaArray    = ["愛知", "岐阜", "山梨", "静岡", "長野"]
    var kansaiAreaArray   = ["京都", "三重", "滋賀", "大阪", "奈良", "兵庫", "和歌山"]
    var chugokuAreaArray  = ["岡山", "広島", "山口", "鳥取", "島根"]
    var shikokuAreaArray  = ["愛媛", "香川", "高知", "徳島"]
    var kyusyuAreaArray   = ["福岡", "長崎", "大分", "鹿児島", "佐賀", "熊本", "宮崎", "沖縄"]
    
    var areaArray = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if prefectureString == "北海道・東北地方"{
            areaArray = hokkaiAreaArray
        } else if prefectureString == "北陸地方" {
            areaArray = hokurikuAreaArray
        } else if prefectureString == "関東地方" {
            areaArray = kantoAreaArray
        } else if prefectureString == "甲信・東海地方" {
            areaArray = tokaiAreaArray
        } else if prefectureString == "関西地方" {
            areaArray = kansaiAreaArray
        } else if prefectureString == "中国地方" {
            areaArray = chugokuAreaArray
        } else if prefectureString == "四国地方" {
            areaArray = shikokuAreaArray
        } else if prefectureString == "九州地方" {
            areaArray = kyusyuAreaArray
        }
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
        let thirdVC = storyboard?.instantiateViewController(identifier: "third") as! ThirdViewController

        //受け渡す
        navigationController?.pushViewController(thirdVC, animated: true)

        //この時、遷移先に定義されている変数にデータの格納もできる。
//        secondVC.todoString = areaArray[indexPath.row]
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
