package welcome;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import hrs.A_newEmp;
import schedule.WorkTableDAO;
import vos.DB;
import vos.Employee;

//로그인하고 권한 부여...

public class Login {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	String empno;
	String pass;
	Scanner sc = new Scanner(System.in);

	public Login() {
		try {
			while (true) {
				System.out.println("사원번호:");
				empno = sc.nextLine();
				System.out.println("비밀번호:");
				pass = sc.nextLine();
				String sql = "SELECT empno, pass FROM employee WHERE empno = ? AND pass = ?";
				con = DB.con();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(empno));
				pstmt.setString(2, pass);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					System.out.println("로그인 성공");
					break;
				} else {
					System.out.println("로그인 정보를 확인하세요");
				}
			}
			// 로그인한 사람 클래스 인스턴스로 만들기
			String sqlvo = "select * from employee where empno = " + empno;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlvo);
			while (rs.next()) {
				Welcome1.user = new Employee(rs.getInt("empno"), rs.getString("name"), rs.getString("birth"),
						rs.getString("address"), rs.getString("educational"), rs.getInt("deptno"), rs.getString("rank"),
						rs.getString("pass"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(Welcome1.user.getName() + "님 환영합니다");
		Welcome1.user.setAccess();
	}

}
