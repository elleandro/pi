import Lava
import VhdlNew
import Patterns
import List
import ExamDraw07

--infixr 5 ->-
--infixr 4 -|-




halfAdd (a, b) = (sum, carry)
	where
	    sum = xor2 (a, b)
	    carry = and2 (a, b)

fullAdd (carryIn, (a, b)) = (sum, carryOut)
    where
       (sum1,carry1) = halfAdd (a, b)
       (sum, carry2) = halfAdd (carryIn, sum1)
       carryOut = xor2 (carry2, carry1)

test1 = simulate halfAdd (low, low)
test2 = simulate fullAdd (low, (high, low))
test3 = simulate fullAdd (high,(low,high))
test4 n = writeVhdlInputOutput "adder" adder 
         (var "cin", (varList n "a", varList n "b"))
         (varList n "sum", var "cout")
test5 n = writeVhdlInputOutputNoClk "adderNoClk" adder 
         (var "cin", (varList n "a", varList n "b"))
         (varList n "sum", var "cout")

test6 = writeVhdlInputOutputNoClk "fullAddNewie" fullAdd 
          (var "cin",(var "a", var "b"))
	  (var "sum", var "cout")

testadder' n = writeVhdlInputOutput "adder2" adder'
	        (var "cin", [(var "a", var "b")])
                (varList n "sum", var "cout")
test7 n = writeVhdlInputOutputNoClk "BrentKungFastAdder" bKungFastAdder
          (varList n "a", varList n "b")
          (varList n "sum", var "cout")

-- 2.5 Exercises
swap :: (Signal Bool, Signal Bool) -> (Signal Bool, Signal Bool)
swap (a, b) = (b ,a)

-- 
copy :: (Signal Bool) -> (Signal Bool, Signal Bool)
copy a = (a, a)

--
twoBitSorter (a,b) = (smaller, bigger)
	where 
	   smaller = and2 (a, b)
	   bigger = or2 (a, b) 

--
alwaysHigh () = high


--
--multiplexer :: (Signal Bool,(Signal Bool,Signal Bool)) -> Signal Bool 
multiplexer (a, (x,y)) = or2 (out1, out2)
   where
       out2 = and2 (a, y)
       out1 = and2 (inv (a), x)

--
inverter (a) = inv (a)

--
sum3Bit (cin, ((a0, a1, a2), (b0, b1, b2))) = ((sum0,sum1,sum2), cOut)
  where
     (sum0, carryOut0) = fullAdd (cin, (a0,b0))
     (sum1, carryOut1) = fullAdd (carryOut0, (a1,b1))
     (sum2, cOut)      = fullAdd (carryOut1, (a2,b2))

--
bitAdder (carryIn, []) = ([], carryIn)

bitAdder (carryIn,a:as) = (sum:sums, carryOut)
   where
      (sum, carry) = halfAdd (a, carryIn)
      (sums, carryOut) = bitAdder (carry, as)
     
--
adder (carryIn, ([], [])) = ([], carryIn)

adder (carryIn, (a:as, b:bs)) = (sum:sums, carryOut)
   where
      (sum, carry) = fullAdd (carryIn,(a,b))
      (sums, carryOut) = adder (carry, (as, bs))

-- Conection patterns
--
row' circ (carryIn, []) = ([], carryIn)

row' circ (carryIn, a:as) = (b:bs, carryOut)
   where
      (b, carry)     = circ (carryIn, a)
      (bs, carryOut) = row' circ (carry, as)

--
bitAdder' (carry, inps) = row' halfAdd (carry, inps)

--
adder' (carry, inps) = row' fullAdd (carry, inps)

-- Shorter definitions:
bitAdder'' = row' halfAdd

--
adder'' = row' fullAdd
--
-- 3.4 Exercises
-- 3.1
halfSub (a, b) = (sub, borrow)
   where 
      sub    = xor2 (a, b)
      borrow = and2 (a, inv (b))

-- Podemos definir el bitSubber por inducci�n sobre listas, para practicar un poco:

bitSubber (borrowIn, []) = ([], borrowIn)

bitSubber (borrowIn, a:as) = (b:bs, borrowOut)
   where
      (b, borrow)     = halfSub (borrowIn, a)
      (bs, borrowOut) = bitSubber (borrow, as)

--
bitSubber' = row' halfSub 

--
adder2 ([],[]) = []

adder2 (a:as, b:bs) = sum:sums
   where
      (sum, carry)     = halfAdd (a, b)
      (sums, carryOut) = adder (carry, (as, bs))

alwaysLow :: [Signal Bool] -> [Signal Bool]
alwaysLow (as) = [low | n <- [1..n]]
   where
      n = length as

addZero = (id -|- alwaysLow) ->- adder2



-- Podemos generalizar ese patr�n de conexi�n: (no me parece muy �til, pero a los fines pedag�gicos sirve)
cabezaCola cir1 cir2 ([],[]) = []

cabezaCola cir1 cir2 (a:as, b:bs) = sum:sums
   where
      (sum, carry) = cir1 (a, b)
      (sums, carryOut) = cir2 (carry, (as, bs))

adder2' = cabezaCola halfAdd adder
-- mortal de la muerte ;)

-- 3.7
par' cir1 cir2 (a, b) = (c, d)
   where
      c = cir1 a
      d = cir2 b

-- cir1 -|- cir2 = par' cir1 cir2 


--negador = par' inv inv
--testpar = writeVhdlInputOutput "par'" negador 
 --        (var "a", var "b")
  --       (var "c", var "d")

--serial' cir1 cir2 a = c
 --  where
 --     b = cir1 a
  --    c = cir2 b

--cir1 ->- cir2 = serial' cir1 cir2

--serial' circ1 circ2 = circ2 . circ1
--circ1 ->- circ2    = serial' circ1 circ2



-- 3.6 palort
pair' ([]) = []
pair' (a:b:as) = (c:cs)
   where
      c  = (a ,b)
      cs = pair' (as)

testpair = simulate pair' ([low,high,low,high,high,low])

--
unpair' [] = ([])
unpair' ((a,b):abs) = (a:b:unpair' (abs))

numBreak num = (bit, num')
   where
      digit = imod (num, 2)
      bit   = int2bit digit
      num'  = idiv (num, 2)

int2bin 0 num = []

int2bin n num = (bit:bits)
   where
      (bit, num') = numBreak num
      bits        = int2bin (n-1) num'

-- 3.4
bin2int [] = 0

bin2int (a:as) = num
   where
      num' = bin2int as
      num = bit2int a + 2*num'
 

-- 3.5
zipp' ([],[]) = []

zipp' (a:as, b:bs) = c:cs  
   where
      c  = (a, b)
      cs = zipp' (as, bs)

testzipp = simulate zipp' ([low, high, low],[ high, high, low])

--
unzipp' [] = ([], [])
unzipp' ((a,b):abs) = (a:as, b:bs)
   where
      (as, bs) = unzipp' abs


--
pares []  = []
pares [a] = []
pares (a:b:abs) = b:pares abs

--
impares (a:as) = a:pares as

-- Ya est� definido en Patterns.hs
--map g []     = []
--map g (a:as) = b:bs
--   where
--     b  = g a
--     bs = map g as
--

-- esto es para el paper, s�lo que me molesta all� abajo
secondHalf as  = drop k as
   where 
   k = (length as) `div` 2
--

serialPrefix g (c, []) = ([], c)

serialPrefix g (c, a:as) = (op:ops, out)
   where
      op         = g (c, a)
      (ops, out) = serialPrefix g (op, as)


--
prop_AdderCommutative (as,bs) = ok
   where
      out1 = adder2 (as, bs)
      out2 = adder2 (bs, as)
      ok   = out1 <==> out2

prop_Equivalent circ1 circ2 a = ok
   where
      out1 = circ1 a
      out2 = circ2 a
      ok   = out1 <==> out2

prop_AdderCommutative_ForSize n =
   forAll (list n) $ \as ->
     forAll (list n) $ \bs ->
       prop_AdderCommutative (as, bs)


prop_AdderAssociative (as, bs, cs) = ok
   where
      out1 = adder2 (adder2 (as, bs), cs)
      out2 = adder2 (as, adder2 (bs, cs))
      ok   = out1 <==> out2
prop_AdderAssociative_ForSize n =
   forAll (list n) $ \as ->
    forAll (list n) $ \bs ->
     forAll (list n) $ \cs ->
       prop_AdderAssociative (as, bs, cs)

prop_AdderZero (as,bs) = ok
   where
      out = addZero (as, bs)
      ok   = out <==> as

prop_AdderZero_ForSize n =
  forAll (list n) $ \as ->
   forAll (list n) $ \bs ->
    prop_AdderZero (as,bs) 






--
checkAssociativeDotOp (a, b, c) = ok
   where
      (d, e) = dotOp (a, dotOp (b, c))
      (f, g) = dotOp (dotOp (a, b), c)
      ok1    = d <=> f
      ok2    = e <=> g
      ok     = ok1 <=> ok2




--
sklansky op [a] = [a]
sklansky op as  = ls' ++ [op (last ls', r) | r <- rs']
   where
      k        = (length as + 1) `div` 2
      (ls, rs) = splitAt k as
      ls'      = sklansky op ls
      rs'      = sklansky op rs

--
dotOp ((g1, p1) ,(g, p)) = (go, po)
   where
      go = or2 (g, and2 (p, g1))
      po = and2 (p, p1)
--
unzipl [] = ([],[])
unzipl (a:b:abs) = (a:as, b:bs)
   where
      (as, bs) = unzipl abs
--
zipl ([], []) = []
zipl (a:as, b:bs) = a:b:zipl(as, bs)
--
buf (gin,pin) = (gin, pin)
-- dop takes the operator and the buffer and makes a 2-list to 2-list function
-- This will be what we will use as a prefix network when we have two inputs
dop [a,b] = [a, dotOp(a,b)]
--
miti p = unzipl ->- (id -|- p) ->- zipl
--miti2 p = unzipl ->- operaD p ->- zipl
--
peine []     = []
peine [a]    = []
peine (a:as) = dop [a, head as]++peine (tail as)
--
posPeine (a:as) = a: (peine (init as))++ [last as]
--
wrapR p = peine ->- miti p ->- posPeine 


-- Toda la versi�n del sumador est� hecha para que no pida como par�metro el dotOp, con esta versi�n no se puede usar el programa de Mary para hacer los dibujos de las redes, adem�s de perder de vista donde se puede poner un buffer real.

bKung [a] = []
bKung [a, b] = dop [a, b]
bKung as  = wrapR (bKung) as

--
gAndPs ([],[]) = []
gAndPs (a:as, b:bs) = (g,p):gps
   where
      (g, p) = (and2 (a, b),xor2 (a, b))
      gps    = gAndPs (as, bs)
--
fork as = (as, as)

--
evens as = cs
   where
      (bs,cs) = unzipp as
--
odds as = bs
   where
      (bs,cs) = unzipp as

--passPAndCreatePPNet = evens -|- ppNet
--ppNet =  bKung 
--
dropP = id -|- odds
--
lastXor (as, bs) = map xor2 cs
   where
      cs = zipp (as, bs)
--
sums (a:as, bs) = (a: lastXor (as, init bs),carryOut)
   where
      carryOut = last bs


--fastAdder=[gAndPs, fork, evens -|- ppNet, id -|- odds, sums]


bKungFastAdder = gAndPs ->- fork ->- (evens -|- bKung) ->- dropP ->- sums











-- Propiedades de los sumadores

-- Commutativity --
prop_Commutative binaryOp (as,bs) = ok
   where
      out1 = binaryOp (as, bs)
      out2 = binaryOp (bs, as)
      ok   = out1 <==> out2

prop_Commutative_ForSize binaryOp n =
   forAll (list n) $ \as ->
     forAll (list n) $ \bs ->
       prop_Commutative binaryOp (as, bs)

-- Associative --
prop_Associative binaryOp (as,bs,cs) = ok
   where
      out1 = binaryOp ((binaryOp (as, bs)), cs)
      out2 = binaryOp (as, (binaryOp (bs, cs)))
      ok   = out1 <==> out2

prop_Associative_ForSize binaryOp n =
   forAll (list n) $ \as ->
     forAll (list n) $ \bs ->
       forAll (list n) $ \cs ->
         prop_Associative binaryOp (as, bs, cs)

prop_ZeroExist bKungFastAdder (as, bs) = ok
  where 
    (cs,c) = bKungFastAdder (as, bs)
    ok = cs <==> as    
prop_ZeroExist_ForSize bKungFastAdder (as, bs) n =
   forAll (list n) $ \as ->
     prop_ZeroExist bKungFastAdder (as, bs)




--bs debe ser de la forma (buf, op)
--fastAdder ppNetwork bs as = (gAndPs ->- copyP ->- (id -|- ppNetwork bs) ->- sums) as



-- Pongo el contenido del programa ExamFile07.hs para tener a mano los ejemplos:






{--
to draw pictures:
Main> drawpat "skl" skl 32


produces the file skl32.fig in your current directory
--}

check func m 
  = and (zipWith (==) outs (tail (inits l))) && length outs == length l
  where l = [1..m]
        outs = func (append,id) [[a]| a <- l]
