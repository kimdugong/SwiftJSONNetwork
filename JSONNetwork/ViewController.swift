//
//  ViewController.swift
//  JSONNetwork
//
//  Created by Dugong on 10/01/2019.
//  Copyright © 2019 Dugong. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    lazy var storeLists: [StoreItem] = []
    enum ErrorMessage: Error {
        case fileNotFound
        case fileNotReadable
    }
    
    func loadData() throws {
        do {
            guard let path = Bundle.main.url(forResource: "storeListData", withExtension: "json") else {
                throw ErrorMessage.fileNotFound
            }
            let data = try Data(contentsOf: path, options: .mappedIfSafe)
            let store = try! JSONDecoder().decode(Response.self, from: data)
            storeLists = store.storeItems
            tableView.reloadData()
        } catch {
            throw error
        }
        
    }
    
    @IBAction func fireBtnPressed(_ sender: Any) {
        //        AF.request("https://noffpay1.inicis.com/offpay/appListOrder").responseJSON { (response) in
        //            print("Request: \(String(describing: response.request))")
        //            print("Response: \(String(describing: response.response))")
        //            print("Error: \(String(describing: response.error))")
        //            print("---------------------------------------------")
        //            print(response.result.value!)
        //            print("---------------------------------------------")
        //            if let json = response.result.value {
        //                print("JSON: \(json)")
        //            }
        //
        //        }
        do {
            try loadData()
        } catch  ErrorMessage.fileNotFound {
            print("no found resource please check file path")
        } catch {
            print("error")
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storeList = storeLists[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "storeListCell", for: indexPath) as? TableCell {
            cell.updateUI(storeData: storeList, indexPath: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
}
