//
//  StartVC.swift
//  PingPong
//
//  Created by Prateek on 28/10/17.
//  Copyright © 2017 14K. All rights reserved.
//

import UIKit

enum GameType{
    
    case easy
    case medium
    case hard
    case player2
    
}


class StartVC: UIViewController {

    func switch2Game(_ gameType : GameType){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameVC") as! GameViewController
        
        currentGameType = gameType
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func gameTypeSelectAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 1: switch2Game(.easy)
            break;
        case 2: switch2Game(.medium)
            break;
        case 3: switch2Game(GameType.hard)
            break;
        case 4: switch2Game(GameType.player2)
            break;
        default:
            print("Wrong choice")
        }
        
    }
    
    

}
