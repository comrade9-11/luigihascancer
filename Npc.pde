class Npc {
  float x, y, size;
  String sprite, name;
  PImage npc;
  float fontSize;
  float triggerDistance;
  boolean actioning;
  PImage dialogueBox;
  Scene newScene;
  String[] dialogues;
  int currentIndex;
  String dialogueText;
  int timeSpent;
  boolean timeReset;
  
  public Npc(float nx, float ny, float ns, String nsprite, String nname, Scene nscene, String[] ndialogues) {
    spacePressed = false;
    fontSize = 10;
    x = nx;
    y = ny;
    size = ns;
    sprite = nsprite;
    triggerDistance = 100;
    name = nname;
    actioning = false;
    newScene = nscene;
    dialogues = ndialogues;
    currentIndex = 0;
    timeReset = false;
  }
    
  public void draw() {
    timeSpent++;
    npc = loadImage(sprite);
    dialogueBox = loadImage("dialoguebox.png");
    image(npc, x, y);
    
    pushStyle();
    textSize(fontSize);
    text(name, x + size / 2 - textWidth(name) / 2, y + size + (fontSize + 5));
    popStyle();
    
    if (getDistance(x, player.pos.x, y, player.pos.y) < triggerDistance) {
      if (spacePressed) {
        actioning = true;
      }
    } else {
      actioning = false;
    }
    
    if (actioning) {
      if (!timeReset) {
        timeSpent = 0;
        timeReset = true;
      }
      dialogueText = dialogues[currentIndex];
      PFont body;
      body = createFont("Arkeo BT W01 Condensed.ttf", 20);
      player.speed = 0;
            
      image(dialogueBox, player.pos.x + size / 2 - (width - 100) / 2, player.pos.y + size + 150, width - 100, 150);
      
      image(npc, player.pos.x + size / 2 - (width - 100) / 2 + ((150 - 64) / 2) / 2, player.pos.y + size + 150 + ((150 - 64) / 2));
      
      pushStyle();
      fill(#292908);
      text(name, (player.pos.x + size / 2 - (width - 100) / 2 + ((150 - 64) / 2) / 2) * 1.1 + 64, player.pos.y + size + 150 + 25,
      width - (player.pos.x + size / 2 - (width - 100) / 2 + ((150 - 64) / 2) / 2), 100);
      popStyle();
      
      pushStyle();
      fill(#292908);
      textFont(body);
      text(dialogueText,
      (player.pos.x + size / 2 - (width - 100) / 2 + ((150 - 64) / 2) / 2) * 1.1 + 64, player.pos.y + size + 150 + 15 + 40,
      width - (player.pos.x + size / 2 - (width - 100) / 2 + ((150 - 64) / 2) / 2) - 10, 100);
      popStyle();
      
      if (spacePressed && timeSpent >= 60) {
        if (currentIndex + 1 < dialogues.length) {
          currentIndex++;
          timeSpent = 0;
        } else {
          switchScene(newScene);
        }
      }
      
    }
  }
}

public double getDistance(float x1, float x2, float y1, float y2) {
  return Math.sqrt(Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2));
}
