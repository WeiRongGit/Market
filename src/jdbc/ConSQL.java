/**
 * 创建四个表。分别为
 * 用户表，衣服列表，鞋子列表 裤子列表
 */



package jdbc;

import java.sql.*;

public class ConSQL {
	public static void main(String[] args) {
		Connection con = null;
		Statement stmt = null;
		try {
			con = new conndb().getcon();
			// 创建SQL命令对象
			stmt = con.createStatement();
			// 创建表
			System.out.println("1.1 开始创建表");
			// 创建表SQL语句
			String query = "create table users(name varchar(20) ,password varchar(20)  )";
			// 执行SQL命令对象
			stmt.executeUpdate(query);
			System.out.println("1.2 表创建成功");

			// 插入数据SQL语句
			System.out.println("1.3 开始插入数据");
			String sql_1 = "INSERT INTO users VALUES('马化腾','123456')";
			String sql_2 = "INSERT INTO users VALUES('马云','hourse_cloud')";
			String sql_3 = "INSERT INTO users VALUES('kobe','mylove')";
			// 执行SQL命令对象
			stmt.executeUpdate(sql_1);
			stmt.executeUpdate(sql_2);
			stmt.executeUpdate(sql_3);
			System.out.println("1.4 插入数据成功");

			// 读取数据
			System.out.println("1.5 开始读取数据");
			ResultSet rs = stmt.executeQuery("SELECT * FROM users");
			// 循环输出每一条记录
			while (rs.next()) {
				// 输出每个字段
				System.out.println(rs.getString("name") + "\t" + "\t"
						+ rs.getString("password"));
			}
			System.out.println("1.6 读取完毕");

			query = "create table clothes( name varchar(20) ,id int , price float,saves  int, src varchar(50) )";
			// 执行SQL命令对象
			stmt.executeUpdate(query);
			System.out.println("2.2 表创建成功");

			// 插入数据SQL语句
			System.out.println("2.3 开始插入数据");
			sql_1 = "INSERT INTO clothes VALUES('蓝色的衣服','10001','143','99','image/c01.png')";
			sql_2 = "INSERT INTO clothes VALUES('黑色的衣服','10002','176','103','image/c02.png')";
			sql_3 = "INSERT INTO clothes VALUES('红黑色的衣服','10003','254','36','image/c03.png')";
			String sql_4 = "INSERT INTO clothes VALUES('蓝黑色的衣服','10004','99','76','image/c04.png')";
			String sql_5 = "INSERT INTO clothes VALUES('有帽子的衣服','10005','534','126','image/c05.png')";
			String sql_6 = "INSERT INTO clothes VALUES('爸爸的衣服','10006','334','146','image/c06.png')";
			// 执行SQL命令对象
			stmt.executeUpdate(sql_1);
			stmt.executeUpdate(sql_2);
			stmt.executeUpdate(sql_3);
			stmt.executeUpdate(sql_4);
			stmt.executeUpdate(sql_5);
			stmt.executeUpdate(sql_6);
			System.out.println("2.4 插入数据成功");

			// 读取数据
			System.out.println("2.5 开始读取数据");
			ResultSet rs2 = stmt.executeQuery("SELECT * FROM clothes");
			// 循环输出每一条记录
			while (rs2.next()) {
				// 输出每个字段
				System.out.println(rs2.getString("name") + "\t"
						+ rs2.getString("id") + "\t" + rs2.getString("price")
						+ "\t" + rs2.getString("saves") + "\t"
						+ rs2.getString("src"));
			}
			System.out.println("2.6 读取完毕");

			query = "create table shoes(name varchar(20) ,id int , price float,saves int , src varchar(50))";
			// 执行SQL命令对象
			stmt.executeUpdate(query);
			System.out.println("3.2 表创建成功");

			// 插入数据SQL语句
			System.out.println("3.3 开始插入数据");
			sql_1 = "INSERT INTO shoes VALUES('蓝色的鞋子','20001','342','129','image/shoe01.png')";
			sql_2 = "INSERT INTO shoes VALUES('黑色的鞋子','20002','234','343','image/shoe02.png')";
			sql_3 = "INSERT INTO shoes VALUES('红黑色的鞋子','20003','542','336','image/shoe03.jpg')";
			sql_4 = "INSERT INTO shoes VALUES('蓝色的鞋子','20004','456','746','image/shoe04.jpg')";
			sql_5 = "INSERT INTO shoes VALUES('白的鞋子','20005','223','126','image/shoe05.jpg')";
			sql_6 = "INSERT INTO shoes VALUES('妈妈的鞋子','20006','123','146','image/shoe06.png')";
			// 执行SQL命令对象
			stmt.executeUpdate(sql_1);
			stmt.executeUpdate(sql_2);
			stmt.executeUpdate(sql_3);
			stmt.executeUpdate(sql_4);
			stmt.executeUpdate(sql_5);
			stmt.executeUpdate(sql_6         );
			System.out.println("3.4 插入数据成功");

			// 读取数据
			System.out.println("3.5 开始读取数据");
			ResultSet rs3 = stmt.executeQuery("SELECT * FROM clothes");
			// 循环输出每一条记录
			while (rs3.next()) {
				// 输出每个字段
				System.out.println(rs3.getString("name")  + "\t"
						+ rs3.getString("id") + "\t" + rs3.getString("price")
						+ "\t" + rs3.getString("saves") + "\t"
						+ rs3.getString("src"));
			}
			System.out.println("3.6 读取完毕");
				
			
			query = "create table trousers(name varchar(20) ,id int , price float, saves int , src varchar(50))";
			// 执行SQL命令对象
			stmt.executeUpdate(query);
			System.out.println("4.2 表创建成功");

			// 插入数据SQL语句
			System.out.println("4.3 开始插入数据");
			sql_1 = "INSERT INTO trousers VALUES('白白的裤子','30001','453','129','image/k01.png')";
			sql_2 = "INSERT INTO trousers VALUES('库里的裤子','30002','532','343','image/k02.png')";
			sql_3 = "INSERT INTO trousers VALUES('蓝色的裤子','30003','123','336','image/k03.png')";
			sql_4 = "INSERT INTO trousers VALUES('黑色的裤子','30004','263','746','image/k04.png')";
			sql_5 = "INSERT INTO trousers VALUES('红黑色的裤子','30005','175','126','image/k05.png')";
			sql_6 = "INSERT INTO trousers VALUES('红黑色的裤子','30005','145','326','image/k06.png')";
			// 执行SQL命令对象
			stmt.executeUpdate(sql_1);
			stmt.executeUpdate(sql_2);
			stmt.executeUpdate(sql_3);
			stmt.executeUpdate(sql_4);
			stmt.executeUpdate(sql_5);
			stmt.executeUpdate(sql_6);
			System.out.println("4.4 插入数据成功");

			// 读取数据
			System.out.println("4.5 开始读取数据");
			ResultSet rs4 = stmt.executeQuery("SELECT * FROM trousers");
			// 循环输出每一条记录
			while (rs4.next()) {
				// 输出每个字段
				System.out.println(rs4.getString("name") + "\t"
						+ rs4.getString("id") + "\t" + rs4.getString("price")
						+ "\t" + rs4.getString("saves") + "\t"
						+ rs4.getString("src"));
			}
			System.out.println("3.6 读取完毕");
			// 关闭连接
			System.out.println("5.  关闭数据库");
		} catch (SQLException e) {
			e.printStackTrace();
			// System.out.println("数据库连接错误");
			System.exit(0);
		} finally {
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		}
	}
}
