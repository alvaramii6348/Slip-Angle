x += hsp;
y += vsp;

hsp *= 0.88;
vsp *= 0.88;

if (abs(hsp) < 0.01) hsp = 0;
if (abs(vsp) < 0.01) vsp = 0;