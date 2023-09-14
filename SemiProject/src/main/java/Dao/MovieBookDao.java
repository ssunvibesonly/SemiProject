package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Dto.MovieBookDto;
<<<<<<< HEAD
import mysql.db.DBConnect_2;

public class MovieBookDao {
	DBConnect_2 db=new DBConnect_2();
=======
import mysql.db.DBConnect;

public class MovieBookDao {
	DBConnect db = new DBConnect();
>>>>>>> c66e88a01cf6327ad6265949bf21045f7cba7ac7
	
	//insert
	
	public void insertMovieBook(MovieBookDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into movie_book(bo_no,bo_seat,mv_poster,mv_city,mv_date,";
		
	}
}
