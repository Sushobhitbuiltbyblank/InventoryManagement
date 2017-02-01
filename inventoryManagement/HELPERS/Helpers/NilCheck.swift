//
//  NilCheck.swift
//  Taxi2Share
//
//  Created by MAC Mini 3 on 5/11/16.
//  Copyright © 2016 MAC Mini 3. All rights reserved.
//

import Foundation

enum NilErrorType : Error
{
    case Nil
    case Empty
}

class NilCheck {
    
    static let sharedInstance : NilCheck = {
        let instance = NilCheck()
        return instance
    }()
    
    func checkNumericStringForNil(str : String?) -> String {
        
        guard let str = str else {
            
            return "0" // return default string
        }
        return str
    }
    func checkStringForNil(str : String?) -> String {
        
        guard let str = str else {
            
            return String() // return default string
        }
        return str
    }
    func checkNumberForNil(nbr : NSNumber?) -> NSNumber {
        
        guard let nbr = nbr else {
            
            return 0 // return default number
        }
        return nbr
    }
    
    func checkDoubleForNil(nbr : Double?) -> Double {
        
        guard let nbr = nbr else {
            return 0.0
        }
        return nbr
    }
    func checkFloatForNil(nbr : Float?) -> Float {
        
        guard let nbr = nbr else {
            return 0.0
        }
        return nbr
    }
    func checkIntForNil(nbr : Int?) -> Int {
        
        guard let nbr = nbr else {
            return 0
        }
        return nbr
    }
    func check(str : String?)  {
        
    do {
            let result =  try checkAgain(str: str)
            print("\(result)")
        }
        
        catch NilErrorType.Empty {
            print("provide String")
        }
        catch NilErrorType.Nil {
            print("provide String")
        }
        catch {
            print("Something went wrong!")
        }
    }
    
    func checkAgain(str : String?) throws -> String {
        
        guard let str = str else {
            
            throw NilErrorType.Nil
        }
        guard !Validator.sharedInstance.isStringEmpty(testStr: str) else {
            
            throw NilErrorType.Empty
        }
        return str
    }
    
    func checkNSDataForNil(data : NSData?) -> NSData {
        
        guard let data = data else {
            
            return NSData() // return default string
        }
        return data
    }
    
}




// https://appventure.me/2014/06/13/swift-optionals-made-simple/

// Check nil against many function at  same time :- 

/*
 
 // A number of very stub methods
 func secretFunction1() -> Int? {return 0}
 func secretFunction2() -> [String] {return ["a", "b"]}
 func secretFunction3() -> Bool {return true}
 
 switch (secretFunction1(), secretFunction2(), secretFunction3()) {
 case (nil, let col, true):
 print("case1")
 case (let num?, let col, true) where num > 1:
 print("case2")
 default: ()
 print ("default")
 }
 
 */

/*
 
 let j2 = ["a": 1, "b": 2, "c": 3]
 
 switch (j2["a"], j2["b"], j2["c"]) {
 case (let a?, nil, nil):
 print("got \(a)")
 case (let a?, let b?, .None) where b is String:
 print("got \(a), \(b)")
 case (let a?, let b?, let c?):
 print("got \(a), \(b), \(c)")
 default:
 print("got none")
 }
 
 */
