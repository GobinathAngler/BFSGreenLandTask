//
//  ViewController.swift
//  greenland
//
//  Created by Gobinath on 02/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenLandCountLbl: UILabel!
    var myGrid = [[String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         myGrid = [ ["1","1","0","1","1"],
                        ["1","1","0","0","0"],
                        ["0","1","0","0","0"],
                        ["0","1","0","0","1"],
                       ["1","1","0","1","1"]
        ]
       
    }

    @IBAction func findGreenLandsAction(_ sender: Any) {
        greenLandCountLbl.text = "The Count of Green Lands = " + String(greenlandsCount(twoDgrid: myGrid))
    }
    
    func greenlandsCount(twoDgrid: [[String]]) -> Int {
        var localGrid = twoDgrid
        if localGrid.isEmpty {
            return 0
        }
        var count = 0
        let rows = localGrid.count
        let column = localGrid[0].count
        for i in 0..<rows {
            for j in 0..<column {
                if localGrid[i][j] == "1" {
                    
                    BreathFistSearchAlog(twoDgrid: &localGrid, i, j)
                    
                    count += 1
                }
            }
        }
        return count
    }


    func BreathFistSearchAlog( twoDgrid: inout [[String]], _ a: Int, _ b: Int)
    {
        var queue = [[Int]]()
        queue.append([a,b])
        twoDgrid[a][b] = "0"
        
        while !queue.isEmpty {
            let i = queue.first![0]
            let j = queue.first![1]
            queue.removeFirst()
            
            // Left
            if i-1 >= 0 && twoDgrid[i-1][j] == "1" {
                twoDgrid[i-1][j] = "0"
                queue.append([i-1, j])
            }
            
            //Right
            if i+1 < twoDgrid.count && twoDgrid[i+1][j] == "1" {
                twoDgrid[i+1][j] = "0"
                queue.append([i+1, j])
            }
            
            //Up
            if j-1 >= 0 && twoDgrid[i][j-1] == "1" {
                twoDgrid[i][j-1] = "0"
                queue.append([i, j-1])
            }
            
            //Down
            if j+1 < twoDgrid[0].count && twoDgrid[i][j+1] == "1" {
                twoDgrid[i][j+1] = "0"
                queue.append([i, j+1])
            }
        }
    }


}

