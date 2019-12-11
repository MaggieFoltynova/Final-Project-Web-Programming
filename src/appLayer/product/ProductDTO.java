package appLayer.product;

public class ProductDTO {
    private int productNum;
    private String productName;
    private int productPrice;
    private String sellerID;
    private String sellerName;
    private String sellerPhone;
    private String productPlace;
	private String productClass;
	private String productStatus;
	private int wishCount;
	
	public int getProductNum() {
		return productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerPhone() {
		return sellerPhone;
	}
	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}
	public String getProductPlace() {
		return productPlace;
	}
	public void setProductPlace(String productPlace) {
		this.productPlace = productPlace;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public int getWishCount() {
		return wishCount;
	}
	
	public ProductDTO() {
	}
	public ProductDTO(int productNum, String productName, int productPrice, String sellerID, String sellerName, String sellerPhone,
			String productPlace, String productClass) {
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.sellerID = sellerID;
		this.sellerName = sellerName;
		this.sellerPhone = sellerPhone;
		this.productPlace = productPlace;
		this.productClass = productClass;
	}
}
