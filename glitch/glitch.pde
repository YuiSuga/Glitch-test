PImage img;
void setup(){
    img = loadImage("test.png","png");
    size(1060,1192);
    imageMode(CENTER);
    image(noise(img,true),width/2,height/2);
}

void draw(){
    background(200);
    image(noise(img,false),width/2,height/2);
}