import processing.sound.*;
import java.util.Timer;
import java.util.Arrays;
import java.util.TimerTask;

Music backgroundHosp = new Music("L.mp3");
public Player player = new Player(1080 / 2, 720 / 2, 64);
public Npc luigi = new Npc(1000 / 2 + 200, 720 / 2 + 200, 64, "luigi.png", "luigi", MainMenu.MainMenu,
new String[] {"Hello Mario, unfortunately, cancer is getting the better of me, you need to help me curing this!",
"Do you promise helping me *cough cough* I'm already starting to losing my hair, you need to do something!"});

class Hospital {
  Scene Hospital = new Scene() {
    @Override
      public void draw() {
      translate((player.pos.x) * -1 + width / 2 - 32, (player.pos.y) * -1 + height / 2 - 32);

      backgroundHosp.update();
      
      background(888);
      
      XmlHandler.renderMap("test.xml");

      luigi.draw();
      
      player.draw();
    }
  };
}
