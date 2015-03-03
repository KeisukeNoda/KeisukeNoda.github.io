public class PBvh
{
  public BvhParser parser;  
  public int id;
  public PBvh(String[] data, int number)
  {
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
    id = number;
  }

  public void update( int ms )
  {
    parser.moveMsTo( ms );//30-sec loop 
    parser.update();
  }

  public void draw()
  {
    noStroke();

    for ( BvhBone b : parser.getBones()) {
      pushMatrix();
        translate(b.absPos.x, b.absPos.y, b.absPos.z);
          scale(0.7);
          ParticleBall.render(id);
          ParticleBall.update();
      popMatrix();
     // BvhBone p = b.getParent();
     // if(p != null) {
     //   stroke(255);
     //   line(b.absPos.x, b.absPos.y, b.absPos.z, p.absPos.x, p.absPos.y, p.absPos.z);
     //   noStroke();
     // }
      if (!b.hasChildren()) {
        pushMatrix();
        translate( b.absEndPos.x, b.absEndPos.y, b.absEndPos.z);
          ParticleBall.render(id);
          ParticleBall.update();
        popMatrix();
      }
    }
  }
}

