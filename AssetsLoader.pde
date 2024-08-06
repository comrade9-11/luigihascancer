public void loadSprites() {
  idle = loadImage("idle.png");
  idle2 = loadImage("idle2.png");
  up = loadImage("up.png");
  up2 = loadImage("up2.png");
  left = loadImage("left.png");
  left2 = loadImage("left2.png");
  down = loadImage("down.png");
  down2 = loadImage("down2.png");
  right = loadImage("right.png");
  right2 = loadImage("right2.png");
  
  brick = loadImage("brick.png");
  grass = loadImage("grass.png");
  
  currentImage = idle;
  idleArray.addAll(Arrays.asList(idle));
  upArray.addAll(Arrays.asList(up, up2));
  leftArray.addAll(Arrays.asList(left, left2));
  downArray.addAll(Arrays.asList(down, down2));
  rightArray.addAll(Arrays.asList(right, right2));
    
  animateArg = idleArray;
}
