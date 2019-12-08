package appLayer.product;

public class ProductDTO {
    private String productID;
    private String productPrice;
    private String sellerName;
    private String sellerNumber;
    private String productPlace;
    private String productName;
    private String productClass;

    public String getProductID() {
        return productID;
    }
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductPrice() {
        return productPrice;
    }
    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getSellerName() {
        return sellerName;
    }
    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getSellerNumber() {
        return sellerNumber;
    }
    public void setSellerNumber(String sellerNumber) {
        this.sellerNumber = sellerNumber;
    }

    public String getProductPlace() {
        return productPlace;
    }
    public void setProductPlace(String productPlace) {
        this.productPlace = productPlace;
    }

    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductClass() {
        return productClass;
    }
    public void setProductClass(String productClass) {
        this.productClass = productClass;
    }

    public ProductDTO() {
    }
    public ProductDTO(String productID, String productPrice, String sellerName, String sellerNumber, String productPlace, String productName, String productClass) {
        this.productID = productID;
        this.productPrice = productPrice;
        this.sellerName = sellerName;
        this.sellerNumber = sellerNumber;
        this.productPlace = productPlace;
        this.productName = productName;
        this.productClass = productClass;
    }
}
