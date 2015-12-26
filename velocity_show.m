[t,cx,cy,cz,px,py,pz]=textread('velocity.txt','%d %lf %lf %lf %lf %lf %lf');
figure;
plot(t,cx,t,px);
figure;
plot(t,cy,t,py);
figure;
plot(t,cz,t,pz);