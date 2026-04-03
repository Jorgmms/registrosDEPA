package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "SELECT p.*, d.Nombre AS nomDepto FROM persona p LEFT JOIN departamento d ON p.IdDepartamento = d.Id";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Persona per = new Persona();
                per.setId(rs.getInt("Id"));
                per.setDpi(rs.getString("DPI"));
                per.setNom(rs.getString("Nombres"));
                per.setIdDepartamento(rs.getInt("IdDepartamento"));
                per.setNomDepartamento(rs.getString("nomDepto")); 
                list.add(per);
            }
        } catch (Exception e) {
            System.err.println("Error listar: " + e);
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql = "select * from persona where Id=?";
        Persona per = new Persona();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                per.setId(rs.getInt("Id"));
                per.setDpi(rs.getString("DPI"));
                per.setNom(rs.getString("Nombres"));
                per.setIdDepartamento(rs.getInt("IdDepartamento"));
            }
        } catch (Exception e) {
            System.err.println("Error list " + e);
        }
        return per;
    }

    @Override
    public boolean add(Persona per) {
        String sql = "insert into persona(DPI, Nombres, IdDepartamento, Password) values(?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getDpi());
            ps.setString(2, per.getNom());
            
            if (per.getIdDepartamento() == 0) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, per.getIdDepartamento());
            }
            
            ps.setString(4, per.getPass());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println("Error al insertar " + e);
        }
        return false;
    }

    @Override
    public boolean edit(Persona per) {
        String sql = "update persona set DPI=?, Nombres=?, IdDepartamento=? where Id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getDpi());
            ps.setString(2, per.getNom());

            if (per.getIdDepartamento() == 0) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, per.getIdDepartamento());
            }
            ps.setInt(4, per.getId());
      

            int resultado = ps.executeUpdate();
            if (resultado > 0) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error al editar persona: " + e);
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from persona where Id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int filasAfetadas = ps.executeUpdate();
            if (filasAfetadas > 0) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("Error al eliminar persona: " + e);
        }
        return false;
    }

    public Persona validar(String nom, String pass) {
    Persona per = null; // Empezamos como null
    // Usamos "Nombres" y "Password" que son los nombres que usas en el resto del DAO
    String sql = "SELECT * FROM persona WHERE Nombres=? AND Password=?"; 
    try {
        con = cn.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, nom);
        ps.setString(2, pass);
        rs = ps.executeQuery();
        
        if (rs.next()) { // Usamos if porque solo esperamos un resultado
            per = new Persona(); // Solo creamos el objeto si se encontró en la DB
            per.setId(rs.getInt("Id"));
            per.setNom(rs.getString("Nombres"));
            per.setDpi(rs.getString("DPI"));
            // No es necesario setear el pass aquí, pero puedes hacerlo
        }
    } catch (Exception e) {
        System.err.println("Error en validar DAO: " + e);
    }
    return per; // Si no lo encuentra, devolverá null
}
    
}