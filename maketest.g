##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "Sheaves" );

LoadPackage( "IO_ForHomalg" );

HOMALG_IO.show_banners := false;
HOMALG_IO.use_common_stream := true;

LoadPackage( "GAPDoc" );

list := [
         "../gap/LinearSystems.gd",
         "../gap/LinearSystems.gi",
         "../gap/Sheaves.gd",
         "../gap/Sheaves.gi",
         "../gap/Schemes.gd",
         "../gap/Schemes.gi",
         "../gap/MorphismsOfSchemes.gd",
         "../gap/MorphismsOfSchemes.gi",
         "../gap/Curves.gd",
         "../gap/Curves.gi",
         ];

MyTestManualExamples :=
function ( arg )
    local  ex, bad, res, a;
    if IsRecord( arg[1] )  then
        ex := ManualExamplesXMLTree( arg[1], "Single" );
    else
        ex := ManualExamples( arg[1], arg[2], arg[3], "Single" );
    fi;
    bad := Filtered( ex, function ( a )
            return TestExamplesString( a ) <> true;
        end );
    res := [  ];
    for a  in bad  do
        Print( "===========================\n" );
        PrintFormattedString( a );
        Add( res, TestExamplesString( a, true ) );
    od;
    return res;
end;

size := SizeScreen( );
SizeScreen([80]);

MyTestManualExamples( DirectoriesPackageLibrary( "Sheaves", "doc" )[1]![1], "SheavesForHomalg.xml", list );

GAPDocManualLab( "Sheaves" );

SizeScreen( size );

quit;
