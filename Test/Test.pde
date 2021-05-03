import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim; // Minim Library
AudioPlayer player; // Playing audio
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
boolean playing = false;
AudioBuffer buffer; // Gives access to the samples
//AudioInput input;

void setup()
{
  size(1024, 512, P3D);
  lights();

  minim = new Minim(this);
  player = minim.loadFile("VOCALS.mp3", width);
  player2 = minim.loadFile("GUITAR.mp3", width);
  player3 = minim.loadFile("DRUMS.mp3", width);
  player4 = minim.loadFile("BASS.mp3", width);


  //input=minim.getLineIn(Minim.MONO,width,44100,16);
  buffer = player.mix;
  //buffer = input.mix;
  colorMode(HSB);
}
float y;
float singerhandY;
float singerhandX;
float singerhandspeed = -3;


void draw()
{
  if (playing == true)
  {
    player.play();
    player2.play();
    player3.play();
    player4.play();
  }
  background(0);
  rect(300, 300, 50, 50);

  stroke(255);
  lights();
  float sum = 0;

  for (int i = 0; i < buffer.size(); i ++) // buffer.size will be 1024
  {
    float c = map(i, 0, buffer.size(), 0, height/2);
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (100);
    line(i, lerp(height / 2 - sample, height / 2 + sample, 0.1), 0, i, lerp(height / 2 + sample, height / 2 - sample, 1), 100);
    pushMatrix();
    translate(396, height/2, 185);
    rotateY(1.50);
    rotateX(0.0);
    fill(65, 402, 267);
    noStroke();
    box(304, 274, 0);
    //box(lerp(height / 2 - sample,(height /2) + sample,0.1));
    popMatrix();

    pushMatrix();
    translate(396, 300, 185);
    rotateY(1.50);
    rotateX(1.5);
    fill(255, 255, 255);
    stroke(255, 255, 255);
    box(304, 274, 0);
    popMatrix();

    // buffer.get(i) - The actual sample. These values go between -1 and +1
    // Get the average of all these samples!
    // abs() - To get the absolute value
    sum+= abs(buffer.get(i));
    character1();
  }
}
void mousePressed()
{
  if (mouseX > 300 && mouseX < 350 && mouseY >300 && mouseY > 250)
    playing = true;
}

void character1() {
  pushMatrix();
  translate(100, 100, 345);
  stroke(169, 182, 239);
  noFill();
  strokeWeight(3);
  line(360, 200, 355, 186);//right leg
  line(350, 199, 355, 187);//left leg
  line(355, 187, 355, 171);//body
  line(359, 182, 355, 174);//right arm
  line(343, singerhandY, 351, 181);
  line(351, 182, 355, 174);//left arm
  line(356, 186, 359, 182);//left arm lower
  ellipse(355, 167, 8, 8);
  popMatrix();
  

  singerhandY = singerhandY + singerhandspeed;

  if (singerhandY > 189) 
  {
    singerhandspeed = -3;
  }
  if (singerhandY < 167)
  {
    singerhandspeed = 3;
  }
}
