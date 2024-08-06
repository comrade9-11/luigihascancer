import org.w3c.dom.*;

XML xml;

PImage brick;
PImage grass;
ArrayList<PVector> collisionArray = new ArrayList<PVector>();

public class XmlLoader {
  public void renderMap(String xmlPath) {
    int rowsCount = 0;
    int getRowsCountIndex = 0;
    boolean over = false;
    xml = loadXML(xmlPath);
    
    //System.out.println(xml.getChildren("row-" + Integer.toString(1))[0].getContent());
    while (over == false) {
      if (xml.getChildren("row-" + Integer.toString(getRowsCountIndex)).length > 0) {
        rowsCount++;
      } else {
        over = true;
      }
      getRowsCountIndex++;
    }
    
    for (int i = 0; i < rowsCount; i++) {
      for (int j = 0; j < xml.getChildren("row-" + Integer.toString(i)).length; j++) {
        switch (xml.getChildren("row-" + Integer.toString(i))[j].getContent()) {
          case ("1"):
            image(grass, j * 64, i * 64);
            break;
          case ("2"):
            collisionArray.add(new PVector(j * 64, i * 64));
            image(brick, j * 64, i * 64);
            break;
          default:
            break;
        }
        //System.out.println();
      }
    }
    
  }
}
