module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/business/conflict/communication/Communication.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x || isNumber x) . reverse .showCId ) ws
	return (map mkCId is )

gfWords :: [(String, IO [CId])]
gfWords = [
	("A",a)
	, ("Adv",adv)
	-- , ("Aux",aux)
	, ("Conj",conj)
	, ("Det",det)
	, ("N",n)
	, ("CN",cn)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	, ("Tag",tag)
	, ("V",v)
	, ("V2",v2)
	, ("V3",v3)
	, ("VV",vv)
	, ("VS",vs)
	, ("V2A",v2a)
	]

posName :: String -> String
posName "A"	= "Adjective"
posName "Adv"	= "Adverb"
posName "Aux"	= "Auxiliary"
posName "Conj"	= "Conjunction"
posName "Det"	= "Determiner"
posName "N"	= "Uncount Noun"
posName "CN"	= "Count Noun"
posName "PN"	= "Proper Noun"
posName "Pron"	= "Pronoun"
posName "Prep"	= "Preposition"
posName "Rel"	= "Relative Pronoun"
posName "Tag"	= "Question Tag"
posName "V"	= "Verb"
posName "V2"	= "Verb + object"
posName "V3"	= "Verb + obj1 + obj2"
posName "VV"	= "Verb + verb"
posName "VS"	= "Verb + sentence"
posName "V2S"	= "Verb + object + sentence"
posName "V2A"	= "Verb + object + adjective"


a	= cat2funs "AP"
adv	= cat2funs "Adv"
conj	= cat2funs "Conj"
det	= cat2funs "Det"
n	= cat2funs "N"
cn	= cat2funs "CN"
pn	= cat2funs "PN"
prep	= cat2funs "Prep"
pron	= cat2funs "NP"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"
tag = return ( map mkCId tags )





aux = [
	"doesn't"
	, "don't"
	, "does"
	, "do"
	, "is"
	, "are"
	, "isn't"
	, "aren't"
	, "would"
	, "should"
	]
	

rel = [


	]

tags = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

{-


14	: Det;
2012	: PN;
44	: Det;
a
according to	: Prep;
age	: CN;
age_V	: VA;
amazing	: AP;
and	: Conj;
around	: Predet;
as	: Prep;
at	: Prep;
average	: V2;
before	: Prep;
big	: AP;
birthday	: CN;
can	: VV;
cause	: N2;
death	: N;
die	: VA;
dog	: CN;
ever since	: Adv;
feet	: PN;
for	: Prep;
four	: Det;
get	: V2;
Great Dane	: CN;
the Guiness Book of World Records	: PN;
he	: Pron;
hind	: AP;
his	: Pron;
hold	: V2;
hospital	: CN;
in	: Prep;
inch	: CN;
into	: Prep;
leg	: CN;
life span	: N2;
like	: Prep;
love	: V2;
miss	: V2;
month	: CN;
of	: Prep;
often	: Adv;
old	: AP;
on	: Prep;
only	: Det;
pass away	: V;
people	: CN;
poodle	: CN;
quick	: A;
quicker	: Adv;
recently	: Adv;
record	: N2;
sConjchool	: CN;
seven	: Det;
seven feet four inches	: Adv;
at the shoulder	: Adv;
sixth	: AP;
smaller	: AP;
the Smithsonian	: PN;
n feet tall	: AP;
n inches tall	: AP;
tall	: AP;
tallest	: AP;
than	: Prep;
therapy dog	: CN;
they	: Pron;
this	: Pron;
toy	: AP;
two	: Det;
usually	: Adv;
visit	: V2;
world	: CN;
year	: CN;
younger	: AP;
Zeus	: PN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
