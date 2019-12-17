package appLayer.user;

public class UserDTO {	// Transfer Object
	private String userID;
	private String userPassword;
	private String userName;
	private String userClass;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	
	public UserDTO() {
	}
	public UserDTO(String userID, String userPassword, String userName, String userClass) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userClass = userClass;
	}

}
