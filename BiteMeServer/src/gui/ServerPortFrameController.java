package gui;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

public class ServerPortFrameController {

    @FXML
    private TableView<?> ClientsTableView;

    @FXML
    private TableColumn<?, ?> guestNameColumn;

    @FXML
    private TableColumn<?, ?> ipColumn;

    @FXML
    private TableColumn<?, ?> statusTabelColumn;

    @FXML
    private TextField serverIpTextField;

    @FXML
    private TextField dBInternalTextField;

    @FXML
    private TextField dBExternalTextField;

    @FXML
    private Label serverIpLabel;

    @FXML
    private Label dBInternalLabel;

    @FXML
    private Label dBExternalLabel;

    @FXML
    private Button startServerButton;

    @FXML
    private Button exitButton;

    @FXML
    private TextField PasswordTextField;

    @FXML
    private Label serverLabel;
    
    
    
	private String getServerIp() {
		return serverIpTextField.getText();
	}
	
	private String getDBInternal() {
		return dBInternalTextField.getText();
	}
	
	private String getDBExternal() {
		return dBInternalTextField.getText();
	}
	
	private String getDBPassword() {
		return PasswordTextField.getText();
	}
	
	
    
    public void ExitButtonOnClickAction(ActionEvent event) throws Exception {
				
	}
    
    public void StartServerButtonOnClickAction(ActionEvent event) throws Exception {
		
	}
    
    
    //need to check if we need !!!  
    @FXML
    private void handleTableClick(MouseEvent event) {
    }
    
    
    
    
    }


