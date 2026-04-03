
package Modelo;

public class Persona {
    int id;
    String dpi;
    String nom;
    int idDepartamento;
    String nomDepartamento;
    String pass;

    public Persona() {
    }

    public Persona(String dpi, String nom, String pass) {
        this.dpi = dpi;
        this.nom = nom;
        this.pass = pass;
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
    
}
