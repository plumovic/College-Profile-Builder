
import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var students = 0
    var picture = UIImage(named: "default")
    
    init(Name: String, Location: String, Students: Int, Picture: UIImage)
    {
        name = Name
        location = Location
        students = Students
        picture = Picture
    }
    
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
    
}
