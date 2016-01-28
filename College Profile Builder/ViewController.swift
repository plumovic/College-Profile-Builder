
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!

    var colleges: [College] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        colleges.append(College(Name: "Stanford", Location: "Silicon Valley", Students: 16136, Picture: UIImage(named: "default")!))
        colleges.append(College(Name: "Harvard", Location: "Cambridge", Students: 21000, Picture: UIImage(named: "default")!))
        colleges.append(College(Name: "Berkeley", Location: "Silicon Valley", Students: 16136, Picture: UIImage(named: "default")!))
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAlert = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAlert)
        let addAction = UIAlertAction(title: "Add", style: .Default)
            {   (addAction) -> Void in
                let collegeNameTextField = myAlert.textFields![0] as UITextField
                let locationTextField = myAlert.textFields![1] as UITextField
                self.colleges.append(College(Name: collegeNameTextField.text!, Location: locationTextField.text!))
                self.myTableView.reloadData()
        }
        
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler
            {   (collegeTextField) -> Void in
                collegeTextField.placeholder = "Add College Name"
        }
        self.presentViewController(myAlert, animated: true, completion: nil)
        myAlert.addTextFieldWithConfigurationHandler
            {   (locationTextField) -> Void in
                locationTextField.placeholder = "Add Location"
        }
    }
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }

    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    

}

