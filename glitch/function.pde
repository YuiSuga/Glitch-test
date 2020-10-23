import java.util.Arrays;

PImage noise(PImage img,boolean debug){
    PImage glitchedimg=createImage(img.width/2*3,img.height/2*3,ARGB);
    img.loadPixels();
    glitchedimg.loadPixels();
    for(int i=0;i<img.width;i++){
        for(int j=0;j<img.height;j++){
            glitchedimg.pixels[(j+img.height/4)*glitchedimg.width+img.width/4+i]=img.get(i,j);
        }
    }
    glitchedimg.updatePixels();

    int glitch_widthmax=glitchedimg.width*2;
    int glitch_heightmax=glitchedimg.height/10;
    int glitch_movemax=glitchedimg.width/10;

    int glitch_widthmin=glitchedimg.width/2;
    int glitch_heightmin=glitchedimg.height/20;
    int glitch_movemin=glitchedimg.width/20;

    if(glitch_widthmin==0)glitch_widthmin=1;
    if(glitch_heightmax==0)glitch_heightmax=1;
    if(glitch_heightmin==0)glitch_heightmin=1;
    if(glitch_movemax==0)glitch_movemax=1;
    if(glitch_movemin==0)glitch_movemax=1;

    int glitch_maxnum=glitchedimg.height/glitch_heightmin;
    int glitch_minnum=glitch_maxnum/2;


    if(debug){
        println("canvas size:",glitchedimg.width,"x",glitchedimg.height);
        println("glitch size:",glitch_widthmin,"~",glitch_widthmax,"x",glitch_heightmin,"~",glitch_heightmax);
        println("glitch num :",glitch_minnum,"~",glitch_maxnum);
    }

    glitchedimg.loadPixels();
    for(int i=0;i<int(random(glitch_minnum,glitch_maxnum));i++){
        int sx=int(random(glitchedimg.width/2)),sy=int(random(glitchedimg.height));
        int glitch_height=int(random(glitch_heightmin,glitch_heightmax));
        int glitch_width =int(random(glitch_widthmin ,glitch_widthmax ));
        boolean right=int(random(1,10))>5;
        for(int y=0;y<glitch_height;y++){
            if(sy+y>=glitchedimg.height)break; 
            int ex=min(glitchedimg.width,sx+glitch_width);
            color[] selection = Arrays.copyOfRange(glitchedimg.pixels,(sy+y)*glitchedimg.width+sx,(sy+y)*glitchedimg.width+ex);

            int move=int(random(1,glitch_movemax));
            
            if(right){
                for(int x=0;x<selection.length;x++){
                    if(sx+move+x>=glitchedimg.width)break;
                    glitchedimg.pixels[(sy+y)*glitchedimg.width+(sx+move+x)]=selection[x];
                }
            }
            else{
                for(int x=0;x<selection.length;x++){
                    if(ex-move-x<=0)break;
                    glitchedimg.pixels[(sy+y)*glitchedimg.width+(ex-move-x)]=selection[selection.length-1-x];
                }
            }
        }
    }
    glitchedimg.updatePixels();
    return glitchedimg;
}