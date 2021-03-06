#############################################################################
##
##  Divisors.gd                                              Sheaves package
##
##  Copyright 2012, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations for divisors.
##
#############################################################################

####################################
#
# categories:
#
####################################

##  <#GAPDoc Label="Divisor">
##  <ManSection>
##    <Filt Type="Category" Arg="D" Name="Divisor"/>
##    <Returns>true or false</Returns>
##    <Description>
##      The &GAP; category of divisors.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareCategory( "IsDivisor",
        IsExtAElement and
        IsExtLElement and
        IsExtRElement and
        IsAdditiveElementWithInverse and
        IsAttributeStoringRep );

####################################
#
# properties:
#
####################################

##  <#GAPDoc Label="IsPrimeDivisor:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsPrimeDivisor" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is prime.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsPrimeDivisor",
        IsDivisor );

##  <#GAPDoc Label="IsQuasiHomogeneous:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsQuasiHomogeneous" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is effective.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsQuasiHomogeneous",
        IsDivisor );

##  <#GAPDoc Label="IsEffective:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsEffective" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is effective.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsEffective",
        IsDivisor );

##  <#GAPDoc Label="IsBasePointFree:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsBasePointFree" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is base-point-free.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsBasePointFree",
        IsDivisor );

##  <#GAPDoc Label="IsAmple:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsAmple" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is ample.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsAmple",
        IsDivisor );

##  <#GAPDoc Label="IsVeryAmple:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsVeryAmple" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is very ample.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsVeryAmple",
        IsDivisor );

##  <#GAPDoc Label="IsFree:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsFree" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is free.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsFree",
        IsDivisor );

##  <#GAPDoc Label="IsLocallyFree:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsLocallyFree" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is locally free.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsLocallyFree",
        IsDivisor );

##  <#GAPDoc Label="IsDirectSumOfLineBundles:divisor">
##  <ManSection>
##    <Prop Arg="D" Name="IsDirectSumOfLineBundles" Label="for divisors"/>
##    <Returns>true or false</Returns>
##    <Description>
##      Check if the divisor <A>D</A> is a direct sum of line bundles.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsDirectSumOfLineBundles",
        IsDivisor );

####################################
#
# attributes:
#
####################################

##  <#GAPDoc Label="DefiningPolynomial">
##  <ManSection>
##    <Attr Arg="D" Name="DefiningPolynomial"/>
##    <Returns>a homalg ring element</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "DefiningPolynomial",
        IsDivisor );

##  <#GAPDoc Label="AssociatedMatrix">
##  <ManSection>
##    <Attr Arg="D" Name="AssociatedMatrix"/>
##    <Returns>a homalg ring element</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "AssociatedMatrix",
        IsDivisor );

##  <#GAPDoc Label="AssociatedMatrixOverWeylAlgebra">
##  <ManSection>
##    <Attr Arg="D" Name="AssociatedMatrixOverWeylAlgebra"/>
##    <Returns>a homalg ring element</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "AssociatedMatrixOverWeylAlgebra",
        IsDivisor );

##  <#GAPDoc Label="AmbientScheme">
##  <ManSection>
##    <Attr Arg="D" Name="AmbientScheme"/>
##    <Returns>a scheme</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "AmbientScheme",
        IsDivisor );

##  <#GAPDoc Label="PrimeDivisorsAttr">
##  <ManSection>
##    <Attr Arg="D" Name="PrimeDivisorsAttr"/>
##    <Returns>a list of divisors</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "PrimeDivisorsAttr",
        IsDivisor );

##  <#GAPDoc Label="JacobiMatrix">
##  <ManSection>
##    <Attr Arg="D" Name="JacobiMatrix"/>
##    <Returns>a module map</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "JacobiMatrix",
        IsDivisor );

##  <#GAPDoc Label="DerMinusLogMap">
##  <ManSection>
##    <Attr Arg="D" Name="DerMinusLogMap"/>
##    <Returns>a module map</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "DerMinusLogMap",
        IsDivisor );

##  <#GAPDoc Label="DerMinusLog">
##  <ManSection>
##    <Attr Arg="D" Name="DerMinusLog"/>
##    <Returns>a module</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "DerMinusLog",
        IsDivisor );

##  <#GAPDoc Label="DerMinusLogInWeylAlgebra">
##  <ManSection>
##    <Attr Arg="D" Name="DerMinusLogInWeylAlgebra"/>
##    <Returns>a left ideal</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "DerMinusLogInWeylAlgebra",
        IsDivisor );

##  <#GAPDoc Label="Annihilator1">
##  <ManSection>
##    <Attr Arg="D" Name="Annihilator1"/>
##    <Returns>a left ideal</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "Annihilator1",
        IsDivisor );

##  <#GAPDoc Label="Annihilator1Augmented">
##  <ManSection>
##    <Attr Arg="D" Name="Annihilator1Augmented"/>
##    <Returns>a left ideal</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "Annihilator1Augmented",
        IsDivisor );

## intrinsic attributes:
##
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## should all be added by hand to LIDIV.intrinsic_attributes
## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

##  <#GAPDoc Label="DegreeOfDivisor">
##  <ManSection>
##    <Attr Arg="D" Name="DegreeOfDivisor"/>
##    <Returns>a nonnegative integer</Returns>
##    <Description>
##      The degree of the divisor (for divisors on projective schemes) <A>D</A>.
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "DegreeOfDivisor",
        IsDivisor );

##  <#GAPDoc Label="FirstAffineDegree">
##  <ManSection>
##    <Attr Arg="D" Name="FirstAffineDegree"/>
##    <Returns>a left ideal</Returns>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "FirstAffineDegree",
        IsDivisor );

##
DeclareAttribute( "PoincarePolynomial",
        IsDivisor );

####################################
#
# global functions and operations:
#
####################################

DeclareOperation( "HomalgRing",
        [ IsDivisor ] );

DeclareOperation( "RingOfDerivations",
        [ IsDivisor ] );

DeclareOperation( "DefiningPolynomialOverWeylAlgebra",
        [ IsDivisor ] );

# constructors:

DeclareAttribute( "Divisor",
        IsHomalgRingElement );

DeclareOperation( "Divisor",
        [ IsMatrix, IsHomalgRing ] );

DeclareOperation( "*",
        [ IsHomalgRing, IsDivisor ] );

DeclareOperation( "Annihilator1",
        [ IsDivisor, IsRat ] );

DeclareOperation( "Annihilator1Map",
        [ IsDivisor, IsRat ] );

DeclareOperation( "KernelSubobject",
        [ IsDivisor, IsRat ] );

DeclareOperation( "Annihilator1Augmented",
        [ IsDivisor, IsRat ] );

DeclareOperation( "Annihilator1Augmented",
        [ IsDivisor, IsRat, IsHomalgModule ] );

DeclareOperation( "Annihilator1Augmented",
        [ IsDivisor, IsRat, IsList ] );

DeclareOperation( "Annihilator1Augmented",
        [ IsDivisor, IsRat, IsRingElement ] );

DeclareOperation( "FirstAffineDegree",
        [ IsDivisor, IsRat ] );
