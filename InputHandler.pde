boolean[] currentMovementInput = {false, false, false, false};
boolean spacePressed = false;

void keyPressed() {
  if (currentScene == MainMenu.MainMenu) {
    if (key == ' ') {
      currentScene = Hospital.Hospital;
      background.stop();
    }
  }
  
  if (key == ' ') {
    spacePressed = true;
  }
  
  if (key == 'w' || key == 'W') {
    currentMovementInput[0] = true;
  }
  if (key == 'a' || key == 'A') {
    currentMovementInput[1] = true;
  }
  if (key == 's' || key == 'S') {
    currentMovementInput[2] = true;
  }
  if (key == 'd' || key == 'D') {
    currentMovementInput[3] = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    currentMovementInput[0] = false;
    player.velocity.y = 0;
  }
  if (key == 'a' || key == 'A') {
    currentMovementInput[1] = false;
    player.velocity.x = 0;
  }
  if (key == 's' || key == 'S') {
    currentMovementInput[2] = false;
    player.velocity.y = 0;
  }
  if (key == 'd' || key == 'D') {
    currentMovementInput[3] = false;
    player.velocity.x = 0;
  }
  if (key == ' ') {
    spacePressed = false;
  }
}
