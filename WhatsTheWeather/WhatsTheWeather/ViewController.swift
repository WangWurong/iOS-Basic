//
//  ViewController.swift
//  WhatsTheWeather
//
//  Created by 大兔子殿下 on 1/6/19.
//  Copyright © 2019 大兔子殿下. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var weatherText: UITextField!
    
    @IBAction func getWeather(_ sender: Any) {
        // get the web data
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + weatherText.text!.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            var message = ""
            if let error = error {
                print(error)
            } else {
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    // parse the datastring
                    var stringSeparator = "<p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                        // if there is
                        if contentArray.count > 1 {
                            // separate again
                            stringSeparator = "</span>"
                            let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            if newContentArray.count > 1 {
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "º")
                                print(message)
                            }
                        }
                    }
                    
                }
            }
            if message == "" {
                message = "The weather could not be found, please try again."
            }
            DispatchQueue.main.sync {
                self.resultLabel.text = message
            }
        }
        task.resume()
        } else {
            resultLabel.text = "The weather could not be found, please try again."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

