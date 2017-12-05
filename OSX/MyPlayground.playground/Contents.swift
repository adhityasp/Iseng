//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Adh"
let x = str

var int : Int
var bool : Bool
var float : Float

var hasPet : Bool
//array
var arrayOfInts : Array<Int> // just define the type
arrayOfInts = [5]//add some elements
arrayOfInts.append(3)//append it

var arrayOfString = Array<String>()//initialization array with =
arrayOfString.append("kodok")
arrayOfString.append("Macan")
arrayOfString.append("Singa")

//dictionary
var dictionaryofNovels : Dictionary<String, String>

//optionals
var opt1 : Int?
    opt1 = 5
var opt2 : Int?
    opt2 = 4
var opt3 : Int

if let optional1 = opt1, let optional2 = opt2{
    let opt3 = optional1 + optional2
}
else{
    let err = "Someting is nil"
}

//loop
for i in 0  ..< 5 {
    print(i)
}

print("")

for loop in arrayOfString{
    print(loop)
}

print("")

for (count,loop) in arrayOfString.enumerated(){
    print("\(count) \(loop)")
}


//enum
enum genre : Int{
    case Action
    case Romance
    case SliceofLife
}

let FavoriteGenre = genre.Romance
let name : String

//switch-case through enum (GG Swift)
switch FavoriteGenre {
case .Action:
    name = "Action"
    let rawValues = genre.Action.rawValue
case .Romance:
    name = "Romance"
    let rawValues = genre.Romance.rawValue
case .SliceofLife:
    name = "SliceofLife"
    let rawValues = genre.SliceofLife.rawValue
default:
    name = "Pick your Favorite Genre"
}

let htmlString = "<em>Kodok</em>"
extension String{
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}
htmlString.convertHtml()

