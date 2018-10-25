import haxe.io.*;
import sys.io.File;
import sys.io.FileInput;

class Benford{
  static function main(){
    var args = Sys.args();
    var fname = args[0];
    var cnt:Array<Int> = [0,0,0,0,0,0,0,0,0,0];
    var fin = File.read(fname,false);
    try{
      while(true){
        var str = fin.readLine();
        var num:Int = Std.parseInt(str);
        var buf = 0;
        while(num != 0){
          buf = num;
          num = Std.int(num/10);
        }
        cnt[buf-1] = cnt[buf-1] + 1; 
      }
    }
    catch(e : Eof){
    }
    var loop = 1;
    while(loop<10){
      var par:Int = Std.int((cnt[loop-1] / 1960 + 0.005) * 100);
      Sys.println(loop + " : " + cnt[loop-1] + " , " + par + "%");
      loop++;
    }
    fin.close();
  }
}
