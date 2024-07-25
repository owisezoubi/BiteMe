package common;

import java.io.Serializable;

public class ClientInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String hostName;
	private String ip;
	private String Status;
	
	
	// Setters and Getters
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	
	
	
	
	// constructor
	public ClientInfo(String hostName, String ip, String status) {
		this.hostName = hostName;
		this.ip = ip;
		this.Status = status;
	}

}
