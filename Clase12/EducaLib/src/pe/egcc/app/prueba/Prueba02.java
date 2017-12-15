package pe.egcc.app.prueba;

import pe.egcc.app.service.EducaService;

public class Prueba02 {

  public static void main(String[] args) {
    try {
      
      EducaService educaService = new EducaService();
      educaService.procMatricula(4, 10, 2, 600);
      System.out.println("Proceso ok.");
      
    } catch (Exception e) {
      System.err.println(e.getMessage());
    }
  }
  
}
