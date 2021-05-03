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

player.play();
player2.play();
player3.play();
player4.play();

//input=minim.getLineIn(Minim.MONO,width,44100,16);
buffer = player.mix;
//buffer = input.mix;
colorMode(HSB);
}
float y;


void draw()
{
  background(0);
stroke(255);
lights();
float sum = 0;

for (int i = 0; i < buffer.size(); i ++) // buffer.size will be 1024
{
float c = map(i, 0, buffer.size(), 0, height/2);
stroke(c, 255, 255);
float sample = buffer.get(i) * (100);
line(i, lerp(height / 2 - sample,height / 2 + sample,0.1), 0,i, lerp(height / 2 + sample,height / 2 - sample,1),100);
pushMatrix();
translate(130, height/2, 0);
rotateY(1.25);
rotateX(-0.4);
noStroke();
box(lerp(height / 2 - sample,(height /2) + sample,0.1));
popMatrix();

// buffer.get(i) - The actual sample. These values go between -1 and +1
// Get the average of all these samples!
// abs() - To get the absolute value
sum+= abs(buffer.get(i));
}

}
