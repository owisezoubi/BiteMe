package gui;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class UserLoginControll {

    @FXML
    private TextField PasswordTextField;

    @FXML
    private TextField userNameTextField;

    @FXML
    private Button clearfieldsTextField;

    @FXML
    private Button loginButton;

    @FXML
    private Label UsernameLabel;

    @FXML
    private Label PasswordLabel;
    
	private String getUserName() {
		return userNameTextField.getText();
	}
	
	private String getPassword() {
		return PasswordTextField.getText();
	}
	
	
public void LoginButtonOnClickAction(ActionEvent event) throws Exception {
			
		}

public void clearFieldsButtonOnClickAction(ActionEvent event) throws Exception {
	
	}

///// 
public void checkInputValidation () {
	
	}

}
