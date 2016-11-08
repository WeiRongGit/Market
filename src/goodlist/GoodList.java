/**
 * 商品列表类
 */

package goodlist;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jdbc.conndb;

public class GoodList {
	private ArrayList<Goods> goodList = new ArrayList<Goods>();
	private String table;
	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public void setGoodList(ArrayList<Goods> goodList) {
		this.goodList = goodList;
	}

	public ArrayList<Goods> getGoodList() {
		return goodList;
	}

	public void updateGoodList() {

		this.goodList = new ArrayList<Goods>();
		Connection connt = new conndb().getcon();
		Statement stmt = null;
		try {
			 stmt = connt.createStatement();
			ResultSet re = stmt.executeQuery("select * from " + table);
			while (re.next()) {
				Goods fg = new Goods();
				fg.setId(Integer.parseInt(re.getString("id")));
				fg.setName(re.getString("name"));
				fg.setPrice(Float.parseFloat((re.getString("price"))));
				fg.setSave( Integer.parseInt(re.getString("saves")));
				fg.setSrc(re.getString("src"));
				this.goodList.add(fg);
			}

			stmt.close();
			re.close();
			connt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			if( connt != null)
				try {
					connt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}

	}

}
