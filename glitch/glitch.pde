PImage img;

final int times=100;
PImage[] glitchedimages=new PImage[times];

void settings(){
    img = loadImage("targetimage.png","png");
    size(img.width/2*3,img.height);
}
void setup(){
    String y=String.valueOf(year());
    String m=month()/10>0?String.valueOf(month()):"0"+String.valueOf(month());
    String d=day()/10>0?String.valueOf(day()):"0"+String.valueOf(day());
    String h=hour()/10>0?String.valueOf(hour()):"0"+String.valueOf(hour());
    String mi=minute()/10>0?String.valueOf(minute()):"0"+String.valueOf(minute());
    String s=second()/10>0?String.valueOf(second()):"0"+String.valueOf(second());

    String saveplace="./"+y+m+d+h+mi+s+"/";
    int digit=String.valueOf(times).length();
    boolean debuginfo=true;
    for(int i=0;i<times;i++){
        glitchedimages[i]=noise(img,debuginfo);
        int zeronum=digit-String.valueOf(i+1).length();
        String zero="";
        for(int j=0;j<zeronum;j++)zero+="0";
        glitchedimages[i].save(saveplace+zero+String.valueOf(i+1)+".png");
        debuginfo=false;
        println((i+1)+"/"+times+" completed");
    }

    imageMode(CENTER);
    image(glitchedimages[0],width/2,height/2);
    frameRate(15);
}

int cnt=0;
void draw(){
    background(200);
    image(glitchedimages[cnt],width/2,height/2);
    if(++cnt==times)cnt=0;
}