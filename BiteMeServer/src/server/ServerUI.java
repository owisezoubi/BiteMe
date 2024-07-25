package server;

import java.time.LocalDateTime;
import gui.ServerPortFrameController;
import javafx.application.Application;
import javafx.stage.Stage;

public class ServerUI extends Application {

    final public static int DEFAULT_PORT = 5555;

    public static ServerPortFrameController aFrame;
    public static LocalDateTime OpeningDate;

    public static void main(String args[]) throws Exception {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        aFrame = new ServerPortFrameController(); // create ServerFrame
        System.out.println("started!!!!!");
        try {
            aFrame.start(primaryStage);
            runServer(DEFAULT_PORT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void runServer(int defaultPort) {
        int port = defaultPort;

        EchoServer sv = new EchoServer(port);

        try {
            sv.listen(); // Start listening for connections
        } catch (Exception ex) {
            System.out.println("Error occurred ---> could not listen to clients!!");
        }
    }
}
