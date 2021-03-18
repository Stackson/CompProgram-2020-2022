// Space Game
// By Jackson Campbell | Dec. 2020 - Jan. 2021
//NOTE: ALL graphics have been hand drawn by Jackson Cmapbell.
PImage img6;
PlayerShip venator;
ArrayList<EnemyShip> pelicans;
ArrayList<Laser> lasers;
ArrayList<EnemyLaser> rockets;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
Timer timer, enemyTimer, rocketTimer;
int score, pass;
boolean play;
import processing.sound.*;
SoundFile turbo;

void setup() {
  //size(500, 500);
  size(displayWidth, displayHeight);
  venator = new PlayerShip();
  pelicans = new ArrayList();
  lasers = new ArrayList();
  rockets = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  timer = new Timer(int(random(500, 3000)));
  score = 0;
  timer.start();
  play = false;
  pass = 0;
  turbo = new SoundFile(this, "ATAT-SideGuns.wav");
  enemyTimer = new Timer(int(random(1500, 3000)));
  rocketTimer = new Timer(1000);
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);
    //star
    stars.add(new Star(int(random(width)), 0));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      timer.start();
    }
    //rock vs venator 
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      //detect venator collision
      if (venator.rockIntersection(rock)) {
        venator.health-=50;
        score+=50;
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    //laser vs rock 
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      //laser vs rock collision
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.laserIntersection(laser)) {
          rock.health-=laser.damage;
          lasers.remove(laser);
          if (rock.health<1) {
            turbo.play();
            score+=50;
            rocks.remove(rock);
          }
        }
      }
      //Rocket laser collision cancel
      for (int k = 0; k < rockets.size(); k++) {
        EnemyLaser rocket = rockets.get(k);
        if (rocket.laserIntersection(laser)) {
          lasers.remove(laser);
          rockets.remove(rocket);
        }
      }
      //laser vs pelican        
      for (int j = 0; j < pelicans.size(); j++) {
        EnemyShip pelican = pelicans.get(j);
        if (pelican.laserIntersection(laser)) {
          pelican.health-=laser.damage;
          lasers.remove(laser);
          if (pelican.health<1) {
            turbo.play();
            score+=100;
            pelicans.remove(pelican);
          }
        }
      }
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    //Enemy ship firing lasers
    if (enemyTimer.isFinished()) {
      pelicans.add(new EnemyShip(int(random(width)), -20, int(random(500, 1500))));
      enemyTimer.start();
    }
    //Enemy ship render
    for (int i = 0; i<pelicans.size(); i++) {
      EnemyShip pelican = pelicans.get(i);
      pelican.move();
      pelican.display();
      //pelican vs venator
      if (venator.pelicanIntersection(pelican)) {
        venator.health-=pelican.health;
        score+=100;
        pelicans.remove(pelican);
      }
      if (rocketTimer.isFinished()) {
        rockets.add(new EnemyLaser(pelican.x, pelican.y));
        rocketTimer.start();
      }
    }
    //enemy laser render
    for (int k = rockets.size()-1; k>=0; k--) {
      EnemyLaser rocket = (EnemyLaser) rockets.get(k);
      rocket.display();
      rocket.fire();
      //Rocket vs Venator
      if (venator.rocketIntersection(rocket)) {
        venator.health-=rocket.damage;
        rockets.remove(rocket);
      }
      if (rocket.reachedBottom()) {
        rockets.remove(rocket);
      }
    }

    infoPanel();
    venator.display(mouseX, mouseY);

    if (venator.health<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}
void mousePressed() {
  turbo.play();
  if (venator.ammo>0) {
    lasers.add(new Laser(venator.x, venator.y));
    //lasers.add(new Laser(venator.x-40, venator.y+15));
    //lasers.add(new Laser(venator.x+40, venator.y+15));
    venator.ammo--;
  }
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  textSize(30);
  //500,500
  //text("Welcome!", width/2,height/2);
  //text("Click to Continue...", width/2,height/2+20);
  //display,display
  text("SPACE GAME!", width/2, height/2);
  text("Click to Begin...", width/2, height/2+40);

  if (mousePressed) {
    play = true;
  }
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  //(500,500)
  //rect(0, height-50, width, 50);
  //fill(255, 128);
  //text("Health: " + venator.health, 20, height-20);
  //text("Ammo: " + venator.ammo, 100, height-20);
  //text("Score: " + score, 250, height-20);

  //(display,display)
  rect(0, height-100, width, 100);
  fill(255, 128);
  textSize(25);
  text("Health: " + venator.health, 80, height-60);
  text("Ammo: " + venator.ammo, 240, height-60);
  text("Score: " + score, 390, height-60);
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score: " + score, width/2, height/2+30);
  noLoop();
  img6 = loadImage("Explosion.png");
  imageMode(CENTER);
  image(img6, width/2, height/2+150);
}
