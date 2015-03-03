void neural_sphere(){

  for(int i = 0; i < spheres.length; i++){
    spheres[i].update();
  }
  for(int i = 0; i < points.length; i++){
    points[i].update();
  }
  
 translate(width/2, height/2-100, 0);
  rotateY(frameCount * 0.01);

  for(int i = 0; i < points.length; i++){
    Point fromP = points[i];
    stroke(fromP.col, 180);
    for(int j = i+1; j < points.length; j++){
      Point toP = points[j];
      float dist = dist(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
      if(dist < lengthLimit){
        line(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
      }
    }
  }
}
// 球体クラス
class Sphere{
  float radius;   // 半径
  float radNoise; // 半径を変化させるノイズ
  
  Sphere(){
    radNoise = random(10);
  }
  // 半径の大きさを更新
  void update(){
    if( fft.getAvg(0) < 4 ){
       radius = 50 + noise(radNoise) * 570 + soundLevel/50;
     } else
    radius = 600 + noise(radNoise) * 570 + soundLevel/50;
    radNoise += 0.1;
  }
}
// 点クラス
class Point{
  float x, y, z; // 点の座標
  float a, b, c; // 値の保管用
  color col;
  Sphere myS;    // 球体の半径を参照する
  
  Point(){
    // 球体上の座標を計算
    float s = radians(random(360));
    float t = radians(random(360));
    a = cos(s) * sin(t);
    b = sin(s) * sin(t);
    c = cos(t);
    // 参照する球体をランダムに設定
    myS = spheres[int(random(numSpheres))];
    col = color(0, random(255), random(128, 255), 32);
  }
  // 点の座標を更新
  void update(){
    x = myS.radius * a;
    y = myS.radius * b;
    z = myS.radius * c;
  } 
}

