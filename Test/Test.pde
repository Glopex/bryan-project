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
AudioBuffer buffer;
AudioBuffer buffer2;
AudioBuffer buffer3;
AudioBuffer buffer4;
boolean Vplaying = true;
boolean Bplaying = true;
boolean Gplaying = true;
boolean Dplaying = true;
// Gives access to the samples
//AudioInput input;

void setup()
{
  size(1024, 512, P3D);
  lights();

  minim = new Minim(this);
  player = minim.loadFile("VOCALS.mp3", width);
  player2 = minim.loadFile("BASS.mp3", width);
  player3 = minim.loadFile("GUITAR.mp3", width);
  player4 = minim.loadFile("DRUMS.mp3", width);


  //input=minim.getLineIn(Minim.MONO,width,44100,16);
  buffer = player.mix;
  buffer2 = player2.mix;
  buffer3 = player3.mix;
  buffer4 = player4.mix;
  //buffer = input.mix;
  colorMode(RGB);
}
float y;


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
    vocalLines(i);
    bassLines(i);
    guitarsLines(i);
    drumsLines(i);
    pushMatrix();
    translate(396, height/2, 185);
    rotateY(1.50);
    rotateX(0.0);
    fill(65, 402, 267);
    noStroke();
    box(304, 274, 0);
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
  if (mouseX > 0 && mouseX < width && mouseY >0 && mouseY < height)
    playing = true;
}

void character1() {
  pushMatrix();
  translate(100, 100, 345);
  stroke(169, 182, 239);
  noFill();
  strokeWeight(3);
  ellipse(355, 167, 8, 8);
  line(360, 200, 355, 186);//right leg
  line(350, 199, 355, 187);//left leg
  line(362, 183, 356, 174);//right arm
  line(345, 173, 351, 181);
  line(351, 182, 354, 174);//left arm
  line(355, 184, 362, 183);//left arm lower
  fill(169, 182, 239);
  rect(354, 189, 3, -16);//body
  popMatrix();

}
////////////////////////////////// sound lines /////////////////////////////////
void vocalLines(int vocal)
{
  float c = map(vocal, 0, buffer.size(), 0, height/2);
  stroke(197, 136, 20);
 float sample = buffer.get(vocal) * (150);
 if(Vplaying == true)
  line(vocal, lerp(height/2 - sample, height/2 + sample, 0.1), 0, vocal, lerp(height/2 + sample, height/2 - sample, 1), 100);
}
void bassLines(int bass)
{
  float c = map(bass, 0, buffer2.size(), 0, height/2);
  stroke(152, 17, 51);
  float sample2 = buffer2.get(bass) * (100);
   if(Bplaying == true)
  line(bass, lerp(height - 40 - sample2, height - 40 + sample2, 0.1), 0, bass, lerp(height - 40 + sample2, height - 40 - sample2, 1), 100);
}
void guitarsLines(int guitar)
{
  float c = map(guitar, 0, buffer3.size(), 0, height/2);
  stroke(23, 137, 105);
  float sample3 = buffer3.get(guitar) * (100);
   if(Gplaying == true)
  line(guitar, lerp(height/4 - sample3, height/4 + sample3, 0.1), 0, guitar, lerp(height/4 + sample3, height/4 - sample3, 1), 100);
}
void drumsLines(int drums)
{
  float c = map(drums, 0, buffer4.size(), 0, height/2);
  stroke(123, 68, 126);
  float sample4 = buffer4.get(drums) * (100);
   if(Dplaying == true)
  line(drums, lerp(height/6 - sample4, height/6 + sample4, 0.1), 0, drums, lerp(height/6 + sample4, height/6 - sample4, 1), 100);
}
void pauseInstrument()
{
 if(key == 'v')
 {
  if(Vplaying == true)
   {
     Vplaying = false;
     player.mute();
     key = 'P';
   }
   else
   {
    Vplaying = true;
    player.unmute();
    key = 'P';
   }
 }else
  if(key == 'b')
 {
  if(Bplaying == true)
   {
     Bplaying = false;
     player2.mute();
     key = 'P';
   }
   else
   {
    Bplaying = true;
    player2.unmute();
    key = 'P';
   }
 }else
  if(key == 'g')
 {
  if(Gplaying == true)
   {
     Gplaying = false;
     player3.mute();
     key = 'P';
   }
   else
   {
    Gplaying = true;
    player3.unmute();
    key = 'P';
   }
 }else
  if(key == 'd')
 {
  if(Dplaying == true)
   {
     Dplaying = false;
     player4.mute();
     key = 'P';
   }
   else
   {
    Dplaying = true;
    player4.unmute();
    key = 'P';
   }
 }
}
void keyPressed()
{
pauseInstrument();
}
