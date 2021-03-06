#############################################################################
##
##  Divisors.gi                                              Sheaves package
##
##  Copyright 2012, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations for divisors.
##
#############################################################################

# a new representation for the GAP-category IsDivisor

##  <#GAPDoc Label="IsDivisorRep">
##  <ManSection>
##    <Filt Type="Representation" Arg="L" Name="IsDivisorRep"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The &GAP; representation of linear systems. <P/>
##      (It is a representation of the &GAP; category <Ref Filt="IsDivisor"/>.)
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareRepresentation( "IsDivisorRep",
        IsDivisor,
        [ ] );

####################################
#
# families and types:
#
####################################

# a new family:
BindGlobal( "TheFamilyOfDivisors",
        NewFamily( "TheFamilyOfDivisors" ) );

# a new type:
BindGlobal( "TheTypeDivisor",
        NewType( TheFamilyOfDivisors,
                IsDivisorRep ) );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HomalgRing,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    
    return HomalgRing( DefiningPolynomial( D ) );
    
end );

##
InstallMethod( AssociatedMatrix,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    
    return HomalgMatrix( [ DefiningPolynomial( D ) ], 1, 1, HomalgRing( D ) );
        
end );

##
InstallMethod( AssociatedMatrixOverWeylAlgebra,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    local A;
    
    A := RingOfDerivations( D );
    
    return A * AssociatedMatrix( D );
    
end );

##
InstallMethod( JacobiMatrix,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    local R, var, n, Rn, varvec, f;

    R := HomalgRing( D );
    
    var := Indeterminates( R );
    
    n := Length( var );
    
    if not IsBound( R!.DerMinusLogModule ) then
        R!.DerMinusLogModule := n * R;
    fi;
    
    Rn := R!.DerMinusLogModule;
    
    varvec := HomalgMatrix( var, 1, n, R );
    
    f := AssociatedMatrix( D );
    
    return Diff( Involution( varvec ), f );
    
end );


##
InstallMethod( DerMinusLogMap,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    local map, R, Rn, f;
    
    if HasIsPrimeDivisor( D ) and not IsPrimeDivisor( D ) and
       IsBound( D!.PreFactorization ) then
        
        map := List( D!.PreFactorization, DerMinusLogMap );
        
        return Iterated( map, ProductMorphism );
        
    fi;
    
    map := JacobiMatrix( D );
    
    R := HomalgRing( D );
    
    Rn := R!.DerMinusLogModule;
    
    f := AssociatedMatrix( D );
    
    if IsHomalgGradedRing( R ) then
        map := GradedMap( map, Rn, LeftPresentationWithDegrees( f ) );
    else
        map := HomalgMap( map, Rn, LeftPresentation( f ) );
    fi;
    
    return map;
    
end );

##
InstallMethod( DerMinusLogMap,
        "for divisors",
        [ IsDivisor and HasPrimeDivisorsAttr ],
        
  function( D )
    local map;
    
    if Length( PrimeDivisorsAttr( D ) ) < 2 then
        TryNextMethod( );
    fi;
    
    map := List( PrimeDivisorsAttr( D ), DerMinusLogMap );
    
    return Iterated( map, ProductMorphism );
    
end );

##
InstallMethod( DerMinusLog,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    
    return KernelSubobject( DerMinusLogMap( D ) );
    
end );

##
InstallMethod( RingOfDerivations,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    local R;
    
    R := HomalgRing( D );
    
    return RingOfDerivations( R );
    
end );

##
InstallMethod( DefiningPolynomialOverWeylAlgebra,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    
    return DefiningPolynomial( D ) / RingOfDerivations( D );
    
end );

##
InstallMethod( DerMinusLogInWeylAlgebra,
        "for divisors",
        [ IsDivisor ],
        
  function( D )
    local der, A, var;
    
    der := DerMinusLog( D );
    der := MatrixOfGenerators( der );
    
    A := RingOfDerivations( D );
    
    var := IndeterminateDerivationsOfRingOfDerivations( A );
    
    var := HomalgMatrix( var, Length( var ), 1, A );

    der := ( A * der ) * var;
    
    der := LeftSubmodule( der );
    
    return der;
    
end );

##
InstallMethod( Annihilator1,
        "for a divisor and a rational number",
        [ IsDivisor, IsRat ],
        
  function( D, lambda )
    local der, jac, f, A, var, a;
    
    if IsBound( D!.Annihilator1 ) then
        if IsBound( D!.Annihilator1!.(String( lambda )) ) then
            return D!.Annihilator1!.(String( lambda ));
        fi;
    else
        D!.Annihilator1 := rec( );
    fi;
    
    der := DerMinusLog( D );
    der := MatrixOfGenerators( der );
    
    jac := JacobiMatrix( D );
    
    f := AssociatedMatrix( D );
    
    A := RingOfDerivations( D );
    
    a := A * RightDivide( der * jac, f );
    
    var := IndeterminateDerivationsOfRingOfDerivations( A );
    
    var := HomalgMatrix( var, Length( var ), 1, A );
    
    der := ( A * der ) * var - lambda * a;
    
    der := LeftSubmodule( der );
    
    D!.Annihilator1!.(String( lambda )) := der;
    
    return der;
    
end );

##
InstallMethod( Annihilator1,
        "for a divisor",
        [ IsDivisor ],
        
  function( D )
    
    return Annihilator1( D, -1 );
    
end );
    
##
InstallMethod( Annihilator1Map,
        "for a divisor and a rational number",
        [ IsDivisor, IsRat ],
        
  function( D, lambda )
    local Ann1, A, f;
    
    Ann1 := Annihilator1( D, lambda );
    
    A := HomalgRing( Ann1 );
    
    f := AssociatedMatrixOverWeylAlgebra( D );
    
    return HomalgMap( f, 1 * A, FactorObject( Ann1 ) );
    
end );

##
InstallMethod( KernelSubobject,
        "for a divisor and a rational number",
        [ IsDivisor, IsRat ],
        
  function( D, lambda )
    
    return KernelSubobject( Annihilator1Map( D, lambda ) );
    
end );

##
InstallMethod( Annihilator1Augmented,
        "for a divisor and a rational number",
        [ IsDivisor, IsRat ],
        
  function( D, lambda )
    local f, Ann1f;
    
    if IsBound( D!.Annihilator1Augmented ) then
        if IsBound( D!.Annihilator1Augmented!.(String( lambda )) ) then
            return D!.Annihilator1Augmented!.(String( lambda ));
        fi;
    else
        D!.Annihilator1Augmented := rec( );
    fi;
    
    f := AssociatedMatrixOverWeylAlgebra( D );
    
    Ann1f := LeftSubmodule( f ) + Annihilator1( D, lambda );
    
    D!.Annihilator1Augmented!.(String( lambda )) := Ann1f;
    
    return Ann1f;
    
end );

##
InstallMethod( Annihilator1Augmented,
        "for a divisor, a rational number, and an ideal",
        [ IsDivisor, IsRat, IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( D, lambda, J )
    local Ann1, R;
    
    Ann1 := Annihilator1Augmented( D, lambda );
    
    R := HomalgRing( Ann1 );
        
    return Ann1 + R * J;
    
end );

##
InstallMethod( Annihilator1Augmented,
        "for a divisor, a rational number, and a list of ring elements",
        [ IsDivisor, IsRat, IsList ],
        
  function( D, lambda, J )
    
    return Annihilator1Augmented( D, lambda, LeftSubmodule( J ) );
    
end );

##
InstallMethod( Annihilator1Augmented,
        "for a divisor, a rational number, and a ring element",
        [ IsDivisor, IsRat, IsRingElement ],
        
  function( D, lambda, r )
    
    return Annihilator1Augmented( D, lambda, [ r ] );
    
end );

##
InstallMethod( Annihilator1Augmented,
        "for a divisor",
        [ IsDivisor ],
        
  function( D )
    
    return Annihilator1Augmented( D, -1 );
    
end );

##
InstallMethod( FirstAffineDegree,
        "for a divisor and a rational number",
        [ IsDivisor, IsRat ],
        
  function( D, lambda )
    local I, d;
    
    I := Annihilator1Augmented( D, lambda );
    
    return AffineDegree( AssociatedGradedModule( I ) );
    
end );

##
InstallMethod( FirstAffineDegree,
        "for a divisor",
        [ IsDivisor ],
        
  function( D )
    
    return FirstAffineDegree( D, -1 );
    
end );

##
InstallMethod( PoincarePolynomial,
        "for a divisor",
        [ IsDivisor ],
        
  function( D )
    local der, cOmega, C1, c1, cOmega0;
    
    der := DerMinusLog( D );
    
    cOmega := Dual( ChernPolynomial( der ) );
    
    C1 := 1 + VariableForChernPolynomial( );
    
    c1 := CreateChernPolynomial( 0, C1, AmbientDimension( cOmega ) );
    
    cOmega0 := cOmega / c1;
    
    return ( TotalChernClass( cOmega0 )!.polynomial ) * C1;
    
end );

####################################
#
# constructor functions and methods:
#
####################################

##
InstallMethod( Divisor,
        "constructor for divisors",
        [ IsHomalgRingElement ],
        
  function( f )
    local R, X, D;
    
    R := HomalgRing( f );
    
    if IsHomalgGradedRing( R ) then
        X := Proj( R );
    else
        X := Spec( R );
    fi;
    
    D := rec( );
    
    ObjectifyWithAttributes(
            D, TheTypeDivisor,
            AmbientScheme, X,
            DefiningPolynomial, f,
            IsZero, IsZero( f )
            );
    
    return D;
    
end );

##
InstallMethod( Divisor,
        "constructor for divisors",
        [ IsMatrix, IsHomalgRing ],
  function( A, k )
    local alpha, n, m, R, var, Rn, varvec, alphas, alphaH, D;
    
    alpha := HomalgMatrix( A, k );
    
    alpha := CertainRows( alpha, NonZeroRows( alpha ) );
    
    m := NrRows( alpha );
    n := NrColumns( alpha );
    
    alpha := Involution( alpha );
    
    ## will be graded if k is "graded"
    R := k * List( [ 1 .. n ], i -> Concatenation( "x", String( i ) ) );
    
    alpha := R * alpha;
    
    var := Indeterminates( R );
    
    Rn := n * R;
    
    if not IsBound( R!.DerMinusLogModule ) then
        R!.DerMinusLogModule := Rn;
    fi;
    
    varvec := HomalgMatrix( var, 1, n, R );
    
    alphas := List( [ 1 .. m ], c -> CertainColumns( alpha, [ c ] ) );
    
    alphaH := List( alphas, a -> varvec * a );
    
    alphaH := List( alphaH, a -> EntriesOfHomalgMatrix( a )[ 1 ] );
    
    D := Product( alphaH );
    
    D := Divisor( D );
    
    SetPrimeDivisorsAttr( D, List( alphaH, Divisor ) );
    
    return D;
    
end );

##
InstallMethod( \+,
        "constructor for divisors",
        [ IsDivisor, IsDivisor ],
  function( D1, D2 )
    local f1, f2, D;
    
    f1 := DefiningPolynomial( D1 );
    f2 := DefiningPolynomial( D2 );
    
    D := Divisor( f1 * f2 );
    
    ## Fixme:
    SetIsPrimeDivisor( D, false );
    
    D!.PreFactorization := [ D1, D2 ];
    
    return D;
    
end );

##
InstallOtherMethod( \*,
        "base change for divisors",
        [ IsHomalgRing, IsDivisorRep ],
        
  function( R, D )
    
    return Divisor( DefiningPolynomial( D ) / R );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for divisors",
        [ IsDivisorRep ],
        
  function( D )
    
    Print( "<A" );
    
    Print( " divisor on " );
    ViewObj( AmbientScheme( D ) );
    
    Print( ">" );
    
end );

##
InstallMethod( Display,
        "for divisors",
        [ IsDivisorRep ],
        
  function( D )
    
    Display( DefiningPolynomial( D ) );
    
    Print( "\nA divisor given by the above polynomial\n" );
    
end );
