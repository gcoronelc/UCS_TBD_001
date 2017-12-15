package pe.egcc.app.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import pe.egcc.app.db.AccesoDB;

public class EducaService {
  
  
  public void procMatricula(int curso, int alumno, 
          int cuotas, double precio){
    
    Connection cn = null;
    try {
      
      cn = AccesoDB.getConnection();
      cn.setAutoCommit(true);
      
      String sql = "{call uspMatricula(?,?,?,?)}";
      CallableStatement cs = cn.prepareCall(sql);
      cs.setInt(1, curso);
      cs.setInt(2, alumno);
      cs.setInt(3, cuotas);
      cs.setDouble(4, precio);
      cs.executeUpdate();
      cs.close();
      
    } catch (Exception e) {
      throw new RuntimeException(e.getMessage());
      
    } finally{
      try {
        cn.close();
      } catch (Exception e) {
      }
    }
    
    
  }
  
}
