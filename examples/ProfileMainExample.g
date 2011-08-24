LoadPackage( "GradedRingForHomalg" );

S := GradedRing( HomalgFieldOfRationalsInDefaultCAS( ) * "x,y,z,t" );

wmat := HomalgMatrix( "[ \
x*y,  y*z,    z*t,        0,           0,          0,\
x^3*z,x^2*z^2,0,          x*z^2*t,     -z^2*t^2,   0,\
x^4,  x^3*z,  0,          x^2*z*t,     -x*z*t^2,   0,\
0,    0,      x*y,        -y^2,        x^2-t^2,    0,\
0,    0,      x^2*z,      -x*y*z,      y*z*t,      0,\
0,    0,      x^2*y-x^2*t,-x*y^2+x*y*t,y^2*t-y*t^2,0,\
0,    0,      0,          0,           -1,         1 \
]", 7, 6, S );

LoadPackage( "GradedModules" );

LoadPackage( "Sheaves" );

ProfileOperationsAndMethods(true);
ProfileGlobalFunctions(true);

wmor := GradedMap( wmat, "free", "free", "left", S );

IsMorphism( wmor );

wmor := SheafMorphism( wmor, "create", "create" );

IsMorphism( wmor );

W := Sheafify( LeftPresentationWithDegrees( wmat ) );
