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
boolean menuActive = true;
float sum = 0;

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

  if (menuActive == true)
  {
    menu();
  } else {

    if (playing == true)
    {
      player.play();
      player2.play();
      player3.play();
      player4.play();
    }
    background(248, 200, 199);
    drawclouds();
    stroke(255);
    lights();



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
      popMatrix();

      pushMatrix();
      translate(396, 300, 185);
      rotateY(1.50);
      rotateX(1.5);
      fill(255, 255, 255);
      stroke(255, 255, 255);
      popMatrix();

      // buffer.get(i) - The actual sample. These values go between -1 and +1
      // Get the average of all these samples!
      // abs() - To get the absolute value
      sum+= abs(buffer.get(i));
    }
  
  character4();
  character3();
  character2();
  character1();
  }
}

void mousePressed()
{
  if (menuActive==true) {
    if (mouseX > 0 && mouseX < width && mouseY >0 && mouseY < height)
    {
      playing = true;
      menuActive = false;
    }
  }
}
float smoothavg = 0;
void character1() {

  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    float c = map(i, 0, buffer.size(), 0, 255); 
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (height / 2);  // buffer[i]
    sum += abs(buffer.get(i));
  }
  pushMatrix();
  translate(77, 100, 345);

  stroke(37, 8, 252);
  strokeWeight(16);
  fill(59, 44, 210);
  line(351, 155, 352, 165);
  line(359, 161, 350, 155);//hair
  ellipse(357, 160, 10, 4);
  triangle(30, 75, 58, 20, 86, 75);

  fill(249, 218, 179);
  noStroke();
  ellipse(357, 164, 12, 14); //head

  fill(9, 10, 17);
  stroke(9, 10, 17);
  strokeWeight(7);
  rect(353, 173, 7, 13); //body


  line(369, 186, 359, 173);//right arm
  line(344, 173, 348, 184);
  line(354, 173, 348, 184);//left arm upper

  stroke(35, 29, 96);
  line(357, 192, 360, 186);//right leg
  line(350, 192, 353, 186);//left leg
  line(357, 191, 364, 202);//right leg bottom
  line(350, 192, 346, 201);//left leg bottom


  stroke(245, 195, 136);
  rect(355, 172, 3, -1);//neck


  float average = sum / buffer.size();
  if (Vplaying == true)
    stroke(9, 10, 17);
  ellipse ( 355, 168, average *30, average * 30);  
  stroke(255);
  ellipse ( 352, 164, average *5, average * 15);  
  ellipse ( 357, 164, average *5, average * 15);  

  popMatrix();
}

void character2()
{
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    float c = map(i, 0, buffer.size(), 0, 255); 
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (height / 2);  // buffer[i]
    sum += abs(buffer.get(i));
  }

  pushMatrix();
  translate(-135, -14, 0);


  fill(40, 26, 61);
  noStroke();
  ellipse(514, 285, 171, 185); //body

  fill(160, 96, 19);
  noStroke();
  ellipse(514, 163, 97, 86); //head

  //drums
  stroke(0);
  line(657, 224, 657, 412);
  line(380, 224, 380, 411);
  line(380, 407, 358, 444);
  line(380, 224, 380, 449);
  line(380, 412, 402, 443);

  line(656, 407, 636, 444);
  line(657, 396, 655, 441);
  line(653, 403, 691, 445);

  fill(255);


  float average = sum / buffer.size();
  ellipse (538, 159, average * 10, average * 15);
  ellipse (495, 158, average * 10, average * 15);
  line (500, 190, 530, 196);


  noStroke();
  fill(137, 4, 48);
  ellipse(513, 374, 140, 117);


  fill(150, 155, 4);
  ellipse(656, 241, 114, 27); 
  ellipse(382, 242, 114, 27);

  fill(107, 5, 29);

  rect(396, 268, 94, 48);
  rect(609, 268, 94, 48);
  rect(572, 318, 94, 48);
  rect(357, 323, 94, 48);

  popMatrix();
}

void character3()
{
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    float c = map(i, 0, buffer.size(), 0, 255); 
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (height / 2);  // buffer[i]
    sum += abs(buffer.get(i));
  }

  pushMatrix();
  translate(180, 64, 360);

  stroke(249, 218, 179);
  fill(249, 218, 179);
  noStroke();
  ellipse(357, 164, 12, 14); //head
  rect(355, 172, 3, -1);//neck

  fill(249, 17, 241);
  stroke(254, 12, 245);
  strokeWeight(7);
  rect(355, 173, 3, 9); //body
  line(364, 188, 358, 173);//right arm
  line(351, 176, 349, 181);
  line(355, 173, 351, 176);//left arm upper

  stroke(235, 112, 21);
  line(350, 192, 354, 186);//left leg
  line(362, 193, 364, 202);//right leg bottom
  line(350, 192, 348, 201);//left leg bottom



  stroke(18, 136, 218);
  fill(18, 136, 218);
  ellipse(359, 186, 10, 9);
  ellipse(361, 189, 12, 9); //guitar
  strokeWeight(16);
  line(356, 183, 347, 171);

  strokeWeight(7);

  fill(249, 17, 241);
  stroke(254, 12, 245);
  line(364, 188, 358, 173);//right arm
  line(351, 176, 349, 181);
  line(355, 173, 351, 176);//left arm upper

  float average = sum / buffer.size();
  ellipse ( 352, 164, average *5, average * 15);  
  ellipse ( 357, 164, average *5, average * 15);  

  popMatrix();
}

void character4()
{
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    float c = map(i, 0, buffer.size(), 0, 255); 
    stroke(c, 255, 255);
    float sample = buffer.get(i) * (height / 2);  // buffer[i]
    sum += abs(buffer.get(i));
  }

  pushMatrix();
  translate(217, 52, 360);

  noStroke();
  fill(0);
  rect(350, 157, 11, 8);//

  stroke(206, 154, 92);
  fill(207, 155, 94);
  noStroke();
  ellipse(356, 166, 12, 10); //head
  rect(355, 172, 3, -1);//neck

  fill(39, 249, 18);
  stroke(20, 245, 52);
  strokeWeight(7);
  rect(351, 172, 10, 10); //body
  line(368, 188, 361, 174);//right arm
  line(346, 179, 347, 172);
  line(346, 180, 352, 172);//left arm upper

  stroke(235, 112, 21);
  line(350, 192, 351, 187);//left leg
  line(362, 196, 364, 202);//right leg bottom
  line(350, 192, 348, 201);//left leg bottom

  stroke(93, 46, 96);
  fill(93, 46, 96);
  ellipse(356, 186, 10, 9);
  ellipse(360, 192, 11, 8); //guitar
  strokeWeight(12);
  line(354, 183, 347, 171);


  float average = sum / buffer.size();
  ellipse ( 352, 164, average *5, average * 15);  
  ellipse ( 357, 164, average *5, average * 15);  

  popMatrix();
}


void drawPoint(float x, float y, float noiseFactor) {    
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor *50;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}
////////////////////////////////// sound lines /////////////////////////////////
void vocalLines(int vocal)
{
  float c = map(vocal, 0, buffer.size(), 0, height/2);
  stroke(197, 136, 20);
  float sample = buffer.get(vocal) * (150);
  if (Vplaying == true)
    line(vocal, lerp(height-80 - sample, height-81 + sample, 0.1), 0, vocal, lerp(height-83 + sample, height-83 - sample, 1), 100);
}
void bassLines(int bass)
{
  float c = map(bass, 0, buffer2.size(), 0, height/2);
  stroke(152, 17, 51);
  float sample2 = buffer2.get(bass) * (100);
  if (Bplaying == true)
    line(bass, lerp(height - 292 - sample2, height - 334 + sample2, 0.1), 0, bass, lerp(height - 326 + sample2, height - 246 - sample2, 1), 100);
}
void guitarsLines(int guitar)
{
  float c = map(guitar, 0, buffer3.size(), 0, height/2);
  stroke(23, 137, 105);
  float sample3 = buffer3.get(guitar) * (100);
  if (Gplaying == true)
    line(guitar, lerp(height-258 - sample3, height-20 + sample3, 0.1), 0, guitar, lerp(height-20 + sample3, height-186 - sample3, 1), 100);
}
void drumsLines(int drums)
{
  float c = map(drums, 0, buffer4.size(), 0, height/2);
  stroke(123, 68, 126);
  float sample4 = buffer4.get(drums) * (100);
  if (Dplaying == true)
    line(drums, lerp(height-170 - sample4, height-170 + sample4, 0.1), 0, drums, lerp(height-170 + sample4, height-170 - sample4, 1), 100);
}
void pauseInstrument()
{
  if (key == 'v')
  {
    if (Vplaying == true)
    {
      Vplaying = false;
      player.mute();
      key = 'P';
    } else
    {
      Vplaying = true;
      player.unmute();
      key = 'P';
    }
  } else
    if (key == 'b')
    {
      if (Bplaying == true)
      {
        Bplaying = false;
        player2.mute();
        key = 'P';
      } else
      {
        Bplaying = true;
        player2.unmute();
        key = 'P';
      }
    } else
      if (key == 'g')
      {
        if (Gplaying == true)
        {
          Gplaying = false;
          player3.mute();
          key = 'P';
        } else
        {
          Gplaying = true;
          player3.unmute();
          key = 'P';
        }
      } else
        if (key == 'd')
        {
          if (Dplaying == true)
          {
            Dplaying = false;
            player4.mute();
            key = 'P';
          } else
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

void menu()
{
  noStroke();
  background(0, 22, 33);
  fill(255, 255, 255);
  rect(200, 100, 600, 300);
  fill(0, 22, 33);
  rect(200, 250, 600, 10);
  rect(490, 100, 10, 300);
  textSize(30);
  text("bass ==> B", 264, 186);
  text("guitar ==> G", 250, 333);
  text("voice ==> V", 564, 186);
  text("drums ==> D", 556, 333);
  fill(255, 255, 255);
  text("click on the screen to start", 300, 464);
}



void drawclouds()
{
  PImage img;
  float xstart, xnoise, ystart, ynoise;  
  float y1 = random(0, 400);
  float x1 = 1024;
  float xspeed = 0.05;
  xstart = random(10); 
  ystart = random(10);
  img = loadImage("island.png");
  xstart += 0.05;  // increments x/y noise start values
  ystart += 0.01;

  xnoise = xstart; 
  ynoise = ystart; 

  for (int y = 0; y <= height; y+=5) { 
    ynoise += 0.1;                                     
    xnoise = xstart; 
    for (int x = 0; x <= width; x+=5) { 
      xnoise += 0.1;     
      drawPoint(x, y, noise(xnoise, ynoise));
    }
    x1 = x1 - xspeed;
    image(img, x1, y1);

    if (x1 < -50) {
      y1 = random(0, 400);
      x1 = 1024;
    }
  }
}
