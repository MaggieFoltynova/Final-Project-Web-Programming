package appLayer.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import appLayer.util.DatabaseUtil;
import appLayer.user.*;
import appLayer.product.*;

public class ShoppingDAO {	//Access Object

	public int AddToShoppingList(String userID, int productNum) {
		String SQL = "INSERT INTO shopping VALUE (?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			assert conn != null;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, productNum);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -1;	// registration failed
	}
	
	public ArrayList<ShoppingDTO> getList(String userID, int pageNumber){
		ArrayList<ShoppingDTO> wishList = null;
		String SQL = "SELECT * FROM shopping WHERE userID = ? LIMIT " + pageNumber * 5 + " , " + (pageNumber + 1) * 6 + ";";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = appLayer.util.DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			wishList = new ArrayList<ShoppingDTO>();
			while(rs.next()) {
				ShoppingDTO wishInfo = new ShoppingDTO(
					rs.getString(1),
					rs.getInt(2)
				);
				wishList.add(wishInfo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return wishList;
	}
	
	public int totalPrice(String userID) {
		String SQL = "SELECT productNum FROM shopping WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sum = 0;
		try {
			conn = DatabaseUtil.getConnection();
			assert conn != null;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) 
				sum += new ProductDAO().getPrice(rs.getInt(1));
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
		}
		return sum;	// registration failed
	}
}
