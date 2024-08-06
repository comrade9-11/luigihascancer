ArrayList<PImage> animateArg = new ArrayList<PImage>();

PImage idle;
PImage idle2;
PImage up;
PImage up2;
PImage left;
PImage left2;
PImage down;
PImage down2;
PImage right;
PImage right2;

PImage currentImage;

ArrayList<PImage> idleArray = new ArrayList<PImage>();
ArrayList<PImage> upArray = new ArrayList<PImage>();
ArrayList<PImage> leftArray = new ArrayList<PImage>();
ArrayList<PImage> downArray = new ArrayList<PImage>();
ArrayList<PImage> rightArray = new ArrayList<PImage>();

boolean started = false;

TimerTask task = new Task();
Timer timer = new Timer();

public class Player {
  String collideFrom;
  PVector pos;
  int size;
  float ogSpeed = 5;
  float speed = ogSpeed;
  int index = 0;
  PVector oldPos;
  PVector velocity = new PVector(0, 0);
  ArrayList<PImage> collisionDirection = new ArrayList<PImage>();
  public Player(float px, float py, int ps) {
    pos = new PVector(px, py);
    size = ps;
    oldPos = new PVector(px, py);
  }
  
  public void animate(ArrayList<PImage> arg) {
    if (index < arg.size() - 1) {
      index++;
    } else {
      index = 0;
    }
    currentImage = arg.get(index);
    //colour = colours[index];
  }
  
  public void draw() {
    if (started == false) {
      timer.schedule(task, 1, 150);
      started = true;
    }
    
    pushStyle();
    //fill(colour);
    //rect(x, y, size, size);
    
    image(currentImage, pos.x, pos.y);
    popStyle();
    
    if (currentMovementInput[0]) {
      velocity.y = -speed;
      animateArg = upArray;
    }
    
    if (currentMovementInput[2]) {
      velocity.y = speed;
      animateArg = downArray;
    }
    
    if (currentMovementInput[1]) {
      velocity.x = -speed;
      animateArg = leftArray;
    }
    
    if (currentMovementInput[3]) {
      velocity.x = speed;
      animateArg = rightArray;
    }
    
    if (oldPos.x == new PVector(pos.x, pos.y).x && oldPos.y == new PVector(pos.x, pos.y).y) {
      animateArg = idleArray;
    }
    
    oldPos = new PVector(pos.x, pos.y);
    
    double velocityMag = Math.sqrt(Math.pow(velocity.x, 2) + Math.pow(velocity.y, 2));
    
    PVector normalisedVelocity = new PVector(velocity.x / (float) velocityMag, velocity.y / (float) velocityMag);
            
    if ((Double.isNaN(velocity.x / (float) velocityMag)) || (Double.isNaN(velocity.y / (float) velocityMag))) {
      ;
    } else {
      pos.x += normalisedVelocity.x * speed;
      pos.y += normalisedVelocity.y * speed;
    }
        
    for (int i = 0; i < collisionArray.size(); i++) {
      if (Math.sqrt(Math.pow(((collisionArray.get(i).x + size / 2) - (pos.x + size / 2)), 2) + Math.pow(((collisionArray.get(i).y + size / 2) - (pos.y + size / 2)), 2)) <= size) {
        if (animateArg != idleArray) {
          collisionDirection = animateArg;
        }
        
        if (collisionDirection == leftArray) {
          pos.x += speed;
        }
        if (collisionDirection == rightArray) {
          pos.x -= speed;
        }
        if (collisionDirection == upArray) {
          pos.y += speed;
        }
        if (collisionDirection == downArray) {
          pos.y -= speed;
        }
      }
    }
        
    //parent.translate(x, y);    
        
    //System.out.println(y);
  }
}

class Task extends TimerTask {
  @Override
  public void run() {
    player.animate(animateArg);
  }
}
