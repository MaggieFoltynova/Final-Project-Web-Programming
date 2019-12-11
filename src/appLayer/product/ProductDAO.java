package appLayer.product;

import appLayer.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
    public int registration(ProductDTO product) {
        String SQL = "INSERT INTO PRODUCT VALUE (NULL, ?, ?, ?, ?, ?, ?, ?, ?, NULL, 0)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            assert conn != null;
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, product.getProductName());
            pstmt.setInt(2, product.getProductPrice());
            pstmt.setString(3, product.getSellerID());
            pstmt.setString(4, product.getSellerName());
            pstmt.setString(5, product.getSellerPhone());
            pstmt.setString(6, product.getProductPlace());
            pstmt.setString(7, product.getProductClass());
            return pstmt.executeUpdate();	// return 1 if success
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
        }
        return -1;	// registration failed
    }
    
    public ArrayList<ProductDTO> getList(){
		ArrayList<ProductDTO> allProducts = null;
		String SQL = "SELECT * FROM product";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = appLayer.util.DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			allProducts = new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO productInfo = new ProductDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8)
				);
				allProducts.add(productInfo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return allProducts;
	}
    
    public int AddWishCount(int productNum) {
        String SQL = "UPDATE PRODUCT SET wishCount = wishCount + 1 WHERE productNum = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            assert conn != null;
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, productNum);
            return pstmt.executeUpdate();	// return 1 if success
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
            try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
        }
        return -1;	// registration failed
    }
}
