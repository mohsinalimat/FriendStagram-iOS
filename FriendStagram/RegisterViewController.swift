
import Foundation
import UIKit
import SkyFloatingLabelTextField

class RegisterViewController : UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var usernameTextbox: SkyFloatingLabelTextField!
    
    @IBOutlet var passwordTextbox: SkyFloatingLabelTextField!
    
    @IBOutlet var confirmPasswordTextbox: SkyFloatingLabelTextField!
    
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var errorMessage: UILabel!
    
    let accentColor = UIColor(red:0.31, green:0.46, blue:0.46, alpha:1.00)
    
    let darkerAccent = UIColor(red:0.01, green:0.14, blue:0.20, alpha:1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Register screen loaded")
        
        // adding bg
        let bg = UIImageView(image: UIImage(named: "bg2"))
        bg.frame = self.view.frame
        self.view.insertSubview(bg, at: 0)
        
        // adding dim above bg since it's too bright
        let dim = UIView(frame: self.view.frame)
        dim.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.view.insertSubview(dim, aboveSubview: bg)
        
        // setting up title label
        titleLabel.textColor = UIColor.white
        titleLabel.text = "FriendStagram"
        
        // setting this view controller as textField delegate
        usernameTextbox.delegate = self
        passwordTextbox.delegate = self
        
        // setting username textField attributes
        usernameTextbox.placeholder = "Username"
        usernameTextbox.title = "Username"
        usernameTextbox.textColor = UIColor.white
        usernameTextbox.placeholderColor = UIColor.white
        usernameTextbox.backgroundColor = UIColor.clear
        usernameTextbox.selectedLineColor = UIColor.white
        usernameTextbox.selectedTitleColor = UIColor.white
        usernameTextbox.tintColor = UIColor.white
        usernameTextbox.lineColor = UIColor.white
        usernameTextbox.titleColor = UIColor.white
//        usernameTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
//        usernameTextbox.iconText = "\u{f007}"
//        usernameTextbox.iconColor = UIColor.white
//        usernameTextbox.selectedIconColor = UIColor.white
        
        // setting password textField attributes
        passwordTextbox.placeholder = "Password"
        passwordTextbox.title = "Password"
        passwordTextbox.textColor = UIColor.white
        passwordTextbox.placeholderColor = UIColor.white
        passwordTextbox.backgroundColor = UIColor.clear
        passwordTextbox.selectedLineColor = UIColor.white
        passwordTextbox.selectedTitleColor = UIColor.white
        passwordTextbox.tintColor = UIColor.white
        passwordTextbox.lineColor = UIColor.white
        passwordTextbox.titleColor = UIColor.white
//        passwordTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
//        passwordTextbox.iconText = "\u{f023}"
//        passwordTextbox.iconColor = UIColor.white
//        passwordTextbox.selectedIconColor = UIColor.white
        
        // setting confirm password textField attributes
        confirmPasswordTextbox.placeholder = "Confirm Password"
        confirmPasswordTextbox.title = "Confirm Password"
        confirmPasswordTextbox.textColor = UIColor.white
        confirmPasswordTextbox.placeholderColor = UIColor.white
        confirmPasswordTextbox.backgroundColor = UIColor.clear
        confirmPasswordTextbox.selectedLineColor = UIColor.white
        confirmPasswordTextbox.selectedTitleColor = UIColor.white
        confirmPasswordTextbox.tintColor = UIColor.white
        confirmPasswordTextbox.lineColor = UIColor.white
        confirmPasswordTextbox.titleColor = UIColor.white
//        confirmPasswordTextbox.iconFont = UIFont(name: "FontAwesome", size: 13)
//        confirmPasswordTextbox.iconText = "\u{f023}"
//        confirmPasswordTextbox.iconColor = UIColor.white
//        confirmPasswordTextbox.selectedIconColor = UIColor.white
        
        // setting error label attributes
        errorMessage.textColor = UIColor.white
        
        // setting register button attributes
        registerButton.setTitleColor(UIColor.white, for: UIControlState())
        registerButton.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        registerButton.backgroundColor = UIColor.clear
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.cornerRadius = 20.0
        registerButton.layer.borderColor = UIColor.white.cgColor
        
        // setting login button attributes
        backButton.setTitleColor(UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00), for: UIControlState())
        backButton.setTitleColor(UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00), for: UIControlState.highlighted)
        backButton.backgroundColor = UIColor.clear
        
        // looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // dismiss keyboard
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // function gets called whenever the 'next' key is pressed on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField == usernameTextbox){
            passwordTextbox.becomeFirstResponder()
        }else if(textField == passwordTextbox){
            confirmPasswordTextbox.becomeFirstResponder()
        }else if(textField == confirmPasswordTextbox){
            attemptingToRegister(self)
        }
        return true
    }
    
    //whenever the a textfield is being edited
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let skyFloatingLabelTextField = textField as? SkyFloatingLabelTextField {
            skyFloatingLabelTextField.errorMessage = ""
        }
        return true
    }
    
    @IBAction func attemptingToRegister(_ sender: AnyObject) {
        
        dismissKeyboard()
        
        if(self.usernameTextbox.text == ""){
            usernameTextbox.errorMessage = "Missing Username"
            return
        }else if(self.passwordTextbox.text == ""){
            passwordTextbox.errorMessage = "Missing pPssword"
            return
        }else if(self.confirmPasswordTextbox.text != self.confirmPasswordTextbox.text){
            confirmPasswordTextbox.errorMessage = "Password Not Matching"
            return
        }
        
        self.errorMessage.text = "Creating account..."
        
        let username = self.usernameTextbox.text!
        let password = self.passwordTextbox.text!
        
        
        // request register with API
        
    }
    
    // called everytime view is back in view
    func displayingView(){
        usernameTextbox.text = ""
        passwordTextbox.text = ""
        confirmPasswordTextbox.text = ""
        usernameTextbox.errorMessage = ""
        passwordTextbox.errorMessage = ""
        confirmPasswordTextbox.errorMessage = ""
    }
    
    @IBAction func backButtonClicked(_ sender: AnyObject) {
        let parentViewController = self.parent as? StartupViewController
        parentViewController?.switchToLogin()
    }
    
    func displayError(_ msg: String){
        self.errorMessage.text = msg
        UIView.animate(withDuration: 1.0, animations: {
            self.errorMessage.alpha = 1.0
            
            UIView.animate(withDuration: 1.0, delay: 2.0, options: .curveEaseIn, animations: {
                self.errorMessage.alpha = 0.0
                }, completion: nil)
        })
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}