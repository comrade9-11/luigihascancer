Hospital Hospital = new Hospital();
import processing.sound.*;

Music background = new Music("music.mp3");

class MainMenu {
  Scene MainMenu = new Scene() {
    float imgHeight = 85;
    float maxImgHeight = imgHeight + 2;
    float minImgHeight = imgHeight - 2;
    boolean isSmall = true;
    @Override
      public void draw() {
      background.update();

      PImage bg;
      bg = loadImage("background.png");
      background(bg);
      if (isSmall) {
        imgHeight+=.25;
      } else {
        imgHeight-=.25;
      }
      if (imgHeight == maxImgHeight) {
        isSmall = false;
      } else if (imgHeight == minImgHeight) {
        isSmall = true;
      }

      PImage img = loadImage("LuigiHasCancerLogoLong.png");
      float aspectRatio = 9.63837746;
      float imgWidth = imgHeight * aspectRatio;
      image(img, width / 2 - imgWidth / 2, 75, imgWidth, imgHeight);

      PImage banner = loadImage("banner.png");
      int[] startButton = {width / 2 - 700 / 2, 175, 640, 45};
      image(banner, startButton[0], startButton[1], startButton[2], startButton[3]);
      pushStyle();
      fill(255);
      String title = "Press Space to Start!";
      text(title, width / 2 - textWidth(title) / 2, startButton[1] + (textAscent()) / 2 + startButton[3] / 2);
      PFont font;
      font = createFont("super-mario-bros-nes.otf", 15);
      textFont(font);
      popStyle();
    }
  };
}
