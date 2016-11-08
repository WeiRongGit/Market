/**
 * 定义一个人类
 * 里面有姓名，密码，还有购物车
 * 
 */

package person;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.conndb;
import car.Car;

public class Person {
	private String name;
	private String passWord;
	private Car myCar;
	private boolean is_logic = false;
	
	public Person(){
		this.myCar = new Car();
	}
	
	public String getName() {
		return name;
	}

	public boolean isIs_logic() {
		return is_logic;
	}

	public void setIs_logic(boolean is_logic) {
		this.is_logic = is_logic;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Car getMyCar() {
		return myCar;
	}

	public void setMyCar(Car myCar) {
		this.myCar = myCar;
	}

	public static boolean checkUser(String tableName, String name,
			String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = new conndb().getcon();
			String sql = "select * from " + tableName + " where name= '" + name
					+ "' and password= '" + password + "'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

					System.out.println("操作对象关闭错误");
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("结果集关闭错误");
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("连接关闭错误");
				}
		}

		return false;
	}

	public static String toChinese(String str) {
		if (str == null) {
			str = "";
		}

		try {
			str = new String(str.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			str = "";
			e.printStackTrace();
		}

		return str;
	}

}
