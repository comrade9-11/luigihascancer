MainMenu MainMenu = new MainMenu();
import processing.sound.*;
XmlLoader XmlHandler = new XmlLoader();
float musicVolume = 0;

void setup() {
  frameRate(60);
  size(1080, 720);
  windowResizable(false);
  windowTitle("Luigi has Cancer!");

  loadSprites();
}

void draw() {
  currentScene.draw();
}

luigihascancer mainSceneObject = this;

class Music {
  String path;
  SoundFile music;
  SoundFile thisMusic;
  boolean playing;

  public Music(String songPath) {
    path = songPath;
  }

  public void update() {
    music = new SoundFile(mainSceneObject, path);

    if (!playing) {
      music.loop();
      playing = true;
      thisMusic = music;
    }
    music.amp(musicVolume);
  }

  public void stop() {
    thisMusic.stop();
  }
}

interface Scene {
  default void draw() {
  }
}

void switchScene(Scene newScene) {
  currentScene = newScene;
}

Scene currentScene = MainMenu.MainMenu;
