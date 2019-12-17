package appLayer.wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import appLayer.util.DatabaseUtil;
import appLayer.user.UserDTO;

public class WishDAO {	//Access Object

	public int AddToWishList(String userID, int productNum) {
		String SQL = "INSERT INTO wish VALUE (?, ?)";
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
	
	public ArrayList<WishDTO> getList(String userID, int pageNumber){
		ArrayList<WishDTO> wishList = null;
		String SQL = "SELECT * FROM wish WHERE userID = ? LIMIT " + pageNumber * 5 + " , " + (pageNumber + 1) * 6 + ";";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = appLayer.util.DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			wishList = new ArrayList<WishDTO>();
			while(rs.next()) {
				WishDTO wishInfo = new WishDTO(
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
}
