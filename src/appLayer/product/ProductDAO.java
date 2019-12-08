package appLayer.product;

import appLayer.user.UserDTO;
import appLayer.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProductDAO {
    public int registration(ProductDTO product) {
        String SQL = "INSERT INTO PRODUCT VALUE (?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            assert conn != null;
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, product.getProductID());
            pstmt.setString(2, product.getProductPrice());
            pstmt.setString(3, product.getSellerName());
            pstmt.setString(4, product.getSellerNumber());
            pstmt.setString(5, product.getProductPlace());
            pstmt.setString(6, product.getProductName());
            pstmt.setString(7, product.getProductClass());
            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
            try {
            } catch(Exception e) {e.printStackTrace();}
        }
        return -1;	// registration failed
    }
}
