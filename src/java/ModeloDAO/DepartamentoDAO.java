/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;
import Config.Conexion;
import Modelo.Departamento;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Jorge
 */
public class DepartamentoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public List listar() {
        ArrayList<Departamento> lista = new ArrayList<>();
        String sql = "SELECT * FROM departamento ORDER BY Nombre ASC";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setId(rs.getInt("Id"));
                d.setNombre(rs.getString("Nombre"));
                lista.add(d);
            }
        } catch (Exception e) { System.err.println(e); }
        return lista;
    }
}
