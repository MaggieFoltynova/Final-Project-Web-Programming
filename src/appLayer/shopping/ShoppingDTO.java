package appLayer.shopping;

public class ShoppingDTO {	// Transfer Object
	private String userID;
	private int productNum;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	
	public ShoppingDTO() {
	}
	public ShoppingDTO(String userID, int productNum) {
		this.userID = userID;
		this.productNum = productNum;
	}
}
