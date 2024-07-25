package gui;

import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.ResourceBundle;

import common.ClientInfo;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import server.EchoServer;
import server.ServerUI;

public class ServerPortFrameController implements Initializable {
	
	 public static ArrayList<String> DBInfo =new ArrayList<>();
	 
	private static ObservableList<ClientInfo> clients = FXCollections.observableArrayList();
	private static ArrayList<ClientInfo> clientArrayList = new ArrayList<ClientInfo>();
	 
	 private URL location;
	 private ResourceBundle resources;
	 public static EchoServer echoServer;
	 private Label Host = new Label();
	 private Label IP = new Label();
	 private Label Status = new Label();
	 private Label Hosttxt = new Label();
	 private Label IPtxt = new Label();
	 private Label Statustxt = new Label();
	

    @FXML
    private TableView<ClientInfo> ClientsTableView;

    @FXML
    private TableColumn<ClientInfo, String> guestNameColumn;

    @FXML
    private TableColumn<ClientInfo, String> ipColumn;

    @FXML
    private TableColumn<ClientInfo, String> statusTabelColumn;

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
    private TextField PasswordTextField;

    @FXML
    private Button startServerButton;

    @FXML
    private Button exitButton;

   

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
	
    
    
    
    
    public void start(Stage primaryStage) throws Exception {
		IP.setText("IP: ");
		Host.setText("Host: ");
		Status.setText("Status: ");
		Hosttxt.setText(" ");
		IPtxt.setText(" ");
		Statustxt.setText(" ");

		FXMLLoader loader = new FXMLLoader();

		Parent root = loader.load(getClass().getResource("/server/serverPort.fxml").openStream());
		Scene scene = new Scene(root);
		primaryStage.setTitle("Server");
		primaryStage.setScene(scene);
		primaryStage.show();
	}
    
    
    
    
    @Override
	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		this.location = location;
		this.resources = resources;
		try {
			serverIpLabel.setText(InetAddress.getLocalHost().getHostAddress().toString());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		dBInternalLabel.setText("Assignment3_DB");
		dBExternalLabel.setText("BiteMe_DB");
		PasswordTextField.setText("Aa123456");
		DBInfo.add(dBInternalLabel.getText());
		DBInfo.add(dBExternalLabel.getText());
		DBInfo.add(PasswordTextField.getText());

		exitButton.setDisable(true);
		
		guestNameColumn.setCellValueFactory(new PropertyValueFactory<ClientInfo, String>("hostName"));
		ipColumn.setCellValueFactory(new PropertyValueFactory<ClientInfo, String>("ip"));
		statusTabelColumn.setCellValueFactory(new PropertyValueFactory<ClientInfo, String>("Status"));
		ClientsTableView.setItems(clients);

	}
    
    
    
    
    
	
	
    
    public void ExitButtonOnClickAction(ActionEvent event) throws Exception {
    	System.exit(0);
	}
    
    public void StartServerButtonOnClickAction(ActionEvent event) throws Exception {
    	ServerUI.runServer(ServerUI.DEFAULT_PORT);
		echoServer = new EchoServer(5555);
		exitButton.setDisable(false);
	}
    
    
    //need to check if we need !!!  
    @FXML
    private void handleTableClick(MouseEvent event) {
    }

    
    
    
    
	// the function add new connected client
    public void UpdateClient(InetAddress Host, String IP, String Status) {

		javafx.application.Platform.runLater(new Runnable() {
			@Override
			public void run() {
				ClientInfo client = new ClientInfo(Host.getHostName(), IP, Status);
				clients.add(client);
				// clientArrayList.add(new clientDetails(Host.toString(),IP,Status));
			}
		});
	}

	public void disconnect() {
		ClientsTableView.getItems().clear();
	}
    
    
    
}


