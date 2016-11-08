	package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class conndb 
{
	private  Connection cn=null;	
	public  Connection getcon()
	{	    
		try
		{
		     String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		     String connectDB=  "jdbc:sqlserver://localhost:1433; DatabaseName=study";
		     Class.forName(JDriver);
		     String user="con";
		     String password="123456";
		     cn=DriverManager.getConnection(connectDB,user,password); 
			
		} catch (Exception e)
		       {			
			    e.printStackTrace();
		       } 
	    return cn;
	}

}
