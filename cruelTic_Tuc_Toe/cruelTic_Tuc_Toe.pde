int sizeBox = 20;
int cols, rows;
Boolean[] [] board;
Boolean winner;
Boolean end;
Integer[] win;
int[]score = new int[20];
void setup() {
  size(400,400);
  
  cols = width/sizeBox;
  rows = height/sizeBox;
  board = new Boolean[3][30];
  win = new Integer[4];
  winner = null;
  end = (round(random(0,1)) == 0) ? true : false;
  textAlign(CENTER, CENTER);
  score[2]++;
}

void draw() {
  drawgrid();
  drawboard();

  
   }
    
 void drawgrid(){
      for (int i = 0; i < cols; i++) {
   
    for (int j = 0; j < rows; j++) {
      
      
      int x = i*sizeBox;
      int y = j*sizeBox;
      fill(255);
      stroke(0);
     
      rect(x,y,sizeBox,sizeBox); 
    }
   
  }
  
}
void drawo(int x, int y){
  stroke(255,0,0);
  fill(0,0,0,0);
  ellipse(20+x*40,20+y*40, 20, 20);
}
void drawx(int x, int y){
  stroke(0,0,255);
  line(x*20 +10,y*20,x*20+20,y*20+20);
  line(x*20+10,y*+20,x*20+20,y*20+20);
}
void drawboard(){
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] != null){
        if (board[i][j] == true)
          drawo(i,j);
        else if (board[i][j] == false)
          drawx(i,j);
      }
}
 
void mousePressed(){
  int x = mouseX/100;
  int y = mouseY/100;
     
  if (winner != null || full() )
      setup();
   
  else if (board[x][y] == null){
    if (mouseButton == LEFT)
       if (end == false){
         board[x][y] = true;
         end = true;
       }
       else{
         board[x][y] = false;
          end= false;
       }
 //   findwin();
  }
}
boolean full(){
  boolean full = true;
  for (int i=0; i<3; i++)
    for (int j=0; j<3; j++)
      if (board[i][j] == null)
        full = false;
  return full;
}
void drawcursor(){
  if (board[mouseX/200][mouseY/200] == null && winner==null)
    if (end == false)
      drawo(mouseX/200, mouseY/200);
    else
      drawx(mouseX/200, mouseY/200);
}
