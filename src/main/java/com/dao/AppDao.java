package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Container;
import com.bean.Movimentacao;
import com.bean.Relatorio;
import com.bean.Sumario;

public class AppDao {

	public static Connection getConnection() {

		String url = "jdbc:mysql://localhost:3306/crudcontainer";
		String user = "root";
		String pass = "";
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("Conexão Bem Sucedida!");
		} catch (Exception e) {

			System.out.println(e);
		}

		return con;

	}

	public static List<Container> getContainerRecords() {

		List<Container> lista = new ArrayList<Container>();

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement("select * from tblcontainer");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Container cont = new Container();
				cont.setCont_id(rs.getInt(1));
				cont.setCont_cliente(rs.getString(2));
				cont.setCont_num(rs.getString(3));
				cont.setCont_tipo(rs.getInt(4));
				cont.setCont_status(rs.getString(5));
				cont.setCont_categoria(rs.getString(6));

				lista.add(cont);

			}

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return lista;

	}

	public static Container getContainerById(int id) {
		Container cont = new Container();

		try {

			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from tblcontainer where cont_id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				cont.setCont_id(rs.getInt(1));
				cont.setCont_cliente(rs.getString(2));
				cont.setCont_num(rs.getString(3));
				cont.setCont_tipo(rs.getInt(4));
				cont.setCont_status(rs.getString(5));
				cont.setCont_categoria(rs.getString(6));

			}

			con.close();
		} catch (Exception e) {

		}

		return cont;
	}

	public static int addContainer(Container c) {

		int status = 0;

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"insert into tblcontainer(cont_cliente, cont_num, cont_tipo, cont_status, cont_categoria) values (?,?,?,?,?);");

			ps.setString(1, c.getCont_cliente());
			ps.setString(2, c.getCont_num());
			ps.setInt(3, c.getCont_tipo());
			ps.setString(4, c.getCont_status());
			ps.setString(5, c.getCont_categoria());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return status;

	}

	public static int deleteContainer(int id) {

		int status = 0;

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement("delete from tblcontainer where cont_id =?;");

			ps.setInt(1, id);

			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return status;

	}

	public static int updateContainer(Container c) {

		int status = 0;

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"update tblcontainer set cont_cliente = ?, cont_num= ?, cont_tipo = ?, cont_status = ?, cont_categoria = ? where cont_id = ?;");

			ps.setString(1, c.getCont_cliente());
			ps.setString(2, c.getCont_num());
			ps.setInt(3, c.getCont_tipo());
			ps.setString(4, c.getCont_status());
			ps.setString(5, c.getCont_categoria());
			ps.setInt(6, c.getCont_id());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return status;

	}

//--------------------------------------------- movimenta~ções

	public static List<Movimentacao> getMovRecords() {

		List<Movimentacao> lista = new ArrayList<Movimentacao>();

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"select m.*, c.cont_num from tblmov m inner join tblcontainer c on m.cont_id = c.cont_id;");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Movimentacao mov = new Movimentacao();
				mov.setMov_id(rs.getInt(1));
				mov.setCont_id(rs.getInt(2));
				mov.setMov_tipo(rs.getString(3));
				mov.setMov_dtInicial(rs.getString(4));
				mov.setMov_dtFinal(rs.getString(5));
				mov.setCont_num(rs.getString(6));

				lista.add(mov);

			}

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return lista;

	}

	public static List<Movimentacao> getMovRecords(int id) {

		List<Movimentacao> lista = new ArrayList<Movimentacao>();

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"select m.*, c.cont_num from tblmov m inner join tblcontainer c on m.cont_id = c.cont_id where c.cont_id = ?;");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Movimentacao mov = new Movimentacao();
				mov.setMov_id(rs.getInt(1));
				mov.setCont_id(rs.getInt(2));
				mov.setMov_tipo(rs.getString(3));
				mov.setMov_dtInicial(rs.getString(4));
				mov.setMov_dtFinal(rs.getString(5));
				mov.setCont_num(rs.getString(6));

				lista.add(mov);

			}

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return lista;

	}

	public static int addMov(Movimentacao m) {

		int status = 0;

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"insert into tblmov(cont_id, mov_tipo, mov_dtInicial, mov_dtFinal) values (?,?,?,?);");

			ps.setInt(1, m.getCont_id());
			ps.setString(2, m.getMov_tipo());
			ps.setString(3, m.getMov_dtInicial().replaceFirst("T", " "));
			ps.setString(4, m.getMov_dtFinal().replaceFirst("T", " "));

			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return status;

	}

	public static int deleteMov(int id) {

		int status = 0;

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement("delete from tblmov where mov_id = ?;");

			ps.setInt(1, id);

			status = ps.executeUpdate();

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return status;

	}

	// -------------------------------------------------------Relatorio

	public static List<Relatorio> getRelatorio() {

		List<Relatorio> lista = new ArrayList<Relatorio>();

		try {
			Connection con = getConnection();

			PreparedStatement ps = con.prepareStatement(
					"select c.cont_id, c.cont_cliente, COUNT(case when m.mov_tipo = 1 then 1 end) as totalEmbarque, COUNT(case when m.mov_tipo = 2 then 1 end) as totalDescarga, COUNT(case when m.mov_tipo = 3 then 1 end) as totalGateIn, COUNT(case when m.mov_tipo = 4 then 1 end) as totalGateOut, COUNT(case when m.mov_tipo = 5 then 1 end) as totalReposicionamento, COUNT(case when m.mov_tipo = 6 then 1 end) as totalPesagem, COUNT(case when m.mov_tipo = 7 then 1 end) as totalScanner from tblcontainer c inner join tblmov m on c.cont_id = m.cont_id GROUP BY c.cont_cliente;");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Relatorio rel = new Relatorio();

				rel.setRel_cliente(rs.getString(2));
				rel.setRel_totalEmbarque(rs.getInt(3));
				rel.setRel_totalDescarga(rs.getInt(4));
				rel.setRel_totalGateIn(rs.getInt(5));
				rel.setRel_totalGateOut(rs.getInt(6));
				rel.setRel_totalReposicionamento(rs.getInt(7));
				rel.setRel_totalPesagem(rs.getInt(8));
				rel.setRel_totalScanner(rs.getInt(9));

				lista.add(rel);

			}

			con.close();

		} catch (Exception e) {

			System.out.println(e);
		}

		return lista;
	}

	public static List<Sumario> getSumario(String categoria) {

		List<Sumario> lista = new ArrayList<Sumario>();

		try {

			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("select c.cont_cliente from tblcontainer c where c.cont_categoria = ?");

			ps.setString(1, categoria);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Sumario sum = new Sumario();
				sum.setSum_cliente(rs.getString(1));

				lista.add(sum);

			}
			con.close();

		} catch (Exception e) {

			System.out.println(e);

		}

		return lista;

	}

	public static int getTotalCategoria(String categoria) {

		try {

			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select COUNT(case when c.cont_categoria = ? then 1 end) as total from tblcontainer c;");

			ps.setString(1, categoria);

			ResultSet rs = ps.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			con.close();
			return result;

		} catch (Exception e) {

			System.out.println(e);

			return 0;
		}

	}

}
