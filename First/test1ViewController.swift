//
//  test1ViewController.swift
//  First
//
//  Created by arun kumar on 05/08/18.
//  Copyright © 2018 arun kumar. All rights reserved.
//

import UIKit

class test1ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var picker = UIPickerView()
   
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let tf = cell.viewWithTag(1) as! UITextField
        var pick = customPickerView()
        pick.setupPickerView(textF: tf, dataArr: ["\(indexPath.row)","\(indexPath.row)","\(indexPath.row)"], compo: 1)
        
        
        
        return cell
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
