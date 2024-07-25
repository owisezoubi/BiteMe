package server;

import java.time.LocalDateTime;


import gui.ServerPortFrameController;
import javafx.application.Application;
import javafx.stage.Stage;

public class ServerUI extends Application{
	
	
	final public static int DEFAULT_PORT = 5555;

	public static ServerPortFrameController aFrame;
	public static LocalDateTime OpeningDate;

	
	
	public static void main(String args[]) throws Exception {
		System.out.println("debugging NOTE");
		launch(args);
	}
	
	

	@Override
	public void start(Stage primaryStage)  {
		aFrame = new ServerPortFrameController(); // create ServerFrame		

		System.out.println("started!!!!!");
		
		try {
			aFrame.start(primaryStage);
			runServer(DEFAULT_PORT);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	
	
	public static void runServer(int defaultPort) {
		int port = 0; // Port to listen on

		try {
			port = defaultPort; // Set port to 5555
		} catch (Throwable t) {
			System.out.println("Error occured ---> could not connect!!");
		}

		EchoServer sv = new EchoServer(port);

		try {
			sv.listen(); // Start listening for connections
		} catch (Exception ex) {
			System.out.println("Error occured ---> could not listen to clients!!");
		}
	}

}
