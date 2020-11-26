
boolean OnSegment(PVector p, PVector q, PVector r) 
{ 
    if (q.x <= Math.max(p.x, r.x) && q.x >= Math.min(p.x, r.x) && 
        q.y <= Math.max(p.y, r.y) && q.y >= Math.min(p.y, r.y)) 
    return true; 
  
    return false; 
} 
  
// To find orientation of ordered triplet (p, q, r). 
// The function returns following values 
// 0 --> p, q and r are colinear 
// 1 --> Clockwise 
// 2 --> Counterclockwise 
int Orientation(PVector p, PVector q, PVector r) 
{ 
    // See https://www.geeksforgeeks.org/orientation-3-ordered-points/ 
    // for details of below formula. 


    int val = (int)((q.y - p.y) * (r.x - q.x) - 
            (q.x - p.x) * (r.y - q.y)); 
  
    if (val == 0) return 0; // colinear 
  
    return (val > 0)? 1: 2; // clock or counterclock wise 
}

boolean LinesIntersect(PVector p1, PVector q1, PVector p2, PVector q2) 
{ 
    // Find the four orientations needed for general and 
    // special cases 
    int o1 = Orientation(p1, q1, p2); 
    int o2 = Orientation(p1, q1, q2); 
    int o3 = Orientation(p2, q2, p1); 
    int o4 = Orientation(p2, q2, q1); 
  
    // General case 
    if (o1 != o2 && o3 != o4) 
        return true; 
  
    // Special Cases 
    // p1, q1 and p2 are colinear and p2 lies on segment p1q1 
    if (o1 == 0 && OnSegment(p1, p2, q1)) return true; 
  
    // p1, q1 and q2 are colinear and q2 lies on segment p1q1 
    if (o2 == 0 && OnSegment(p1, q2, q1)) return true; 
  
    // p2, q2 and p1 are colinear and p1 lies on segment p2q2 
    if (o3 == 0 && OnSegment(p2, p1, q2)) return true; 
  
    // p2, q2 and q1 are colinear and q1 lies on segment p2q2 
    if (o4 == 0 && OnSegment(p2, q1, q2)) return true; 
  
    return false; // Doesn't fall in any of the above cases 
} 

public float DotProduct(PVector a, PVector b)
{
  return (a.x * b.x) + (a.y * b.y);
}

public boolean PointInRect(PVector point, PVector rectPosition, PVector rectScale)
{
  return((point.x < rectPosition.x + rectScale.x / 2) && (point.x > rectPosition.x - rectScale.x / 2) && 
  (point.y < rectPosition.y + rectScale.y / 2) && (point.y > rectPosition.y - rectScale.y / 2));
 
}
