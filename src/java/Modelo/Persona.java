package Modelo;

public class Persona {
    int id;
    String dpi;
    String nom;
    int idDepartamento;
    String nomDepartamento;
    String pass;
    String correo; // <-- NUEVO CAMPO AGREGADO

    public Persona() {
    }

    public Persona(String dpi, String nom, String pass, String correo) {
        this.dpi = dpi;
        this.nom = nom;
        this.pass = pass;
        this.correo = correo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public int getIdDepartamento() {
        return idDepartamento;
    }
    
    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }
    
    public String getNomDepartamento() {
        return nomDepartamento;
    }
    
    public void setNomDepartamento(String nomDepartamento) {
        this.nomDepartamento = nomDepartamento;
    }
    
    public String getPass() {
        return pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }

    // --- GETTER Y SETTER DEL CORREO ---
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}