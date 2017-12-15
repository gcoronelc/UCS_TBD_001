package pe.egcc.app.prueba;

import java.sql.Connection;
import pe.egcc.app.db.AccesoDB;

public class Prueba01 {

  public static void main(String[] args) {
    try {
      Connection cn = AccesoDB.getConnection();
      System.out.println("Bien, soy grande!!!!");
      cn.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
}
