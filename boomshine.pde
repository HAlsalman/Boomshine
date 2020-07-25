
int numBubbles = 40; // initial bubble count
final int BROKEN = -99; // code for "broken", may have other states later
final int MAXDIAMETER = 120; // maximum size of expanding bubble
int clicksleft = 2; // number of clicks, presently not used

ArrayList pieces; // all the playing pieces

void setup() 
{
  pieces = new ArrayList(numBubbles);
  size(640, 640);
  noStroke();
  smooth();
  for (int i = 0; i < numBubbles; i++) 
  {
    pieces.add(new Bubble(random(width), random(height), 30, i, pieces));
  }

}

void mousePressed()
{  
      // on click, create a new burst bubble at the mouse location and add it to the field
      clicksleft--;
      Bubble b = new Bubble(mouseX,mouseY,2,numBubbles,pieces);
      b.burst();
      pieces.add(b);
      numBubbles++;   
}



void draw() 
{
  background(0);
  
  for (int i = 0; i < numBubbles; i++) 
  {
    Bubble b = (Bubble)pieces.get(i); // get the current piece
    if (b.diameter < 1) // if too small, remove
    {
      	pieces.remove(i);
      	numBubbles--;
	      i--;
    }
    else
    {
      	// check collisions, update state, and draw this piece
        if (b.broken == BROKEN)  // only bother to check collisions with broken bubbles
  	       b.collide();
	     
        b.update();
	      b.display();  
     }
  }
}
